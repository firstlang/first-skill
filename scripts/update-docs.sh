#!/usr/bin/env bash
set -euo pipefail

skill_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
state_dir="$skill_dir/.state"
docs_dir="$skill_dir/downloaded-docs"
last_modified_file="$state_dir/last-modified.txt"
index_file="$state_dir/index.txt"

site_origin="https://firstlang.dev"
docs_last_modified_url="$site_origin/docs/last-modified.txt"
docs_index_url="$site_origin/docs/index.txt"
docs_archive_url="https://github.com/firstlang/documentation/archive/refs/heads/master.tar.gz"

mkdir -p "$state_dir" "$docs_dir"

fetch() {
	if command -v curl >/dev/null 2>&1; then
		curl -fsSL "$1"
	elif command -v wget >/dev/null 2>&1; then
		wget -qO- "$1"
	else
		echo "First docs update skipped: curl or wget is required." >&2
		return 127
	fi
}

remote_last_modified="$(fetch "$docs_last_modified_url" | tr -cd '0-9')"
if [ -z "$remote_last_modified" ]; then
	echo "First docs update skipped: empty last-modified value." >&2
	exit 0
fi

local_last_modified=""
if [ -f "$last_modified_file" ]; then
	local_last_modified="$(tr -cd '0-9' < "$last_modified_file")"
fi

if [ "$remote_last_modified" = "$local_last_modified" ]; then
	exit 0
fi

tmp_dir="$(mktemp -d "${TMPDIR:-/tmp}/first-docs.XXXXXX")"
trap 'rm -rf "$tmp_dir"' EXIT

fetch "$docs_index_url" > "$tmp_dir/index.txt"
fetch "$docs_archive_url" > "$tmp_dir/documentation.tar.gz"
LC_ALL=C tar -xzf "$tmp_dir/documentation.tar.gz" -C "$tmp_dir"
archive_src="$(find "$tmp_dir" -type d -path '*/documentation-master/src' -print -quit)"
if [ -z "$archive_src" ]; then
	echo "First docs update skipped: documentation archive did not contain src/." >&2
	exit 0
fi

cp -R "$archive_src" "$tmp_dir/docs"

rm -rf "$docs_dir"
mv "$tmp_dir/docs" "$docs_dir"
cp "$tmp_dir/index.txt" "$index_file"
printf '%s\n' "$remote_last_modified" > "$last_modified_file"
