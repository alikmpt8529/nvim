#!/bin/sh
# Convert a Neovim vimhelp doc (doc/kickstart.txt) to Markdown.
# Heuristic converter tailored to this file's conventions:
#   - a row of "====" marks a top-level section; the following line is
#     "SECTION NAME ... *tag*" -> first occurrence becomes "# tag" + "## Section Name",
#     later occurrences become "## Section Name"
#   - a line containing only a right-aligned "*tag*" becomes "### tag"
#   - the trailing "vim:...:" modeline is dropped
set -eu
awk '
function totitle(s,    low) {
  low = tolower(s)
  return toupper(substr(low, 1, 1)) substr(low, 2)
}
function emit(s) {
  if (s == "") {
    if (!last_blank) { print ""; last_blank = 1 }
  } else {
    print s
    last_blank = 0
  }
}
BEGIN { last_blank = 1 }
{
  line = $0
  if (line ~ /^=+[ \t]*$/) { prev_eq = 1; next }
  if (prev_eq) {
    prev_eq = 0
    tag = ""; text = line
    if (match(line, /\*[^*]+\*[ \t]*$/)) {
      tagfull = substr(line, RSTART, RLENGTH)
      gsub(/\*/, "", tagfull)
      gsub(/[ \t]+$/, "", tagfull)
      tag = tagfull
      text = substr(line, 1, RSTART - 1)
    }
    gsub(/^[ \t]+|[ \t]+$/, "", text)
    if (!h1done) {
      h1done = 1
      emit("")
      emit("# " (tag != "" ? tag : text))
      emit("")
      emit("## " totitle(text))
    } else {
      emit("")
      emit("## " totitle(text))
    }
    emit("")
    next
  }
  trimmed = line
  gsub(/^[ \t]+|[ \t]+$/, "", trimmed)
  if (trimmed ~ /^\*[^*]+\*$/) {
    tagname = trimmed
    gsub(/\*/, "", tagname)
    emit("")
    emit("### " tagname)
    emit("")
    next
  }
  if (line ~ /^[ \t]*vim:/) next
  gsub(/[ \t]+$/, "", line)
  emit(line)
}
' "$1"
