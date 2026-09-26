#!/usr/bin/env bash

bookmarks_file="${HOME}/.bookmarks"

if [[ ! -f "${bookmarks_file}" ]]; then
    touch "${bookmarks_file}"
fi

bookmark_list() {
  cat "${bookmarks_file}"
}

bookmark_add() {
  local name="$1"
  local url="$2"
  if [[ -z "${name}" || -z "${url}" ]]; then
    echo "Usage: bookmark-add <name> <url>"
    return 1
  fi
  echo -e "${name}\t${url}" >> "${bookmarks_file}"
  echo "Added: ${name} → ${url}"
}

bookmark_remove() {
  local selection name
  selection=$(bookmark_list | fzf --with-nth=1 --delimiter='\t' --preview 'echo {2}' --preview-window=up:1:wrap)
  [[ -n "${selection}" ]] || return
  grep -v "${selection}" "${bookmarks_file}" > "${bookmarks_file}.tmp" && mv "${bookmarks_file}.tmp" "${bookmarks_file}"
  echo "Removed: ${selection}"
}

bookmark() {
  local selection url
  selection=$(bookmark_list | fzf --with-nth=1 --delimiter='\t' --preview 'echo {2}' --preview-window=up:1:wrap)
  [[ -n "${selection}" ]] || return
  url=$(echo "${selection}" | cut -f2)
  xdg-open "${url}"
}

alias bm=bookmark
alias bmls=bookmark_list
alias bma=bookmark_add
alias bmr=bookmark_remove

