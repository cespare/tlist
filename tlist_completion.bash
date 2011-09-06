#!/usr/bin/env bash

_tlist() {
  local current_word
  local options='--print --add --sort --delete --label --edit --current --get-current --next --finish
                 --unsorted --labels -p -a -s -d -l -e -c -g -n -f -u -b'
  COMPREPLY=()
  current_word=${COMP_WORDS[COMP_CWORD]}
  if [[ ${#COMP_WORDS[@]} -gt 1 && $COMP_CWORD -gt 0 ]]; then
    local previous_word=${COMP_WORDS[COMP_CWORD - 1]}
    for test_label in "--label" "-l" "--current" "-c"; do
      if [[ "$test_label" = "$previous_word" ]]; then
        local labels=$(tlist --labels)
        COMPREPLY=($(compgen -W "$labels" -- $current_word))
        return 0
      fi
    done
  fi
  COMPREPLY=($(compgen -W "$options" -- $current_word))
  return 0
}

complete -F _tlist tlist
