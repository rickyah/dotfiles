# fzf - checkout git branch/tag
fcoa() {
  local tags branches target cmd

  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return

  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return

  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return

  cmd=$(echo "$target" | awk '{print $2}')

  git checkout "$cmd"
}

# fco - checkout git branch
fco() {
  local branches branch cmd

  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf) &&

  # get selected branch | remove first '*' | get the first 'field' | trim
  cmd=$(echo "$branch" | sed '0,/*/s/*//' | awk '{print $1}' | sed 's/.* //')
  
  echo "cmd: $cmd"
  if [ -z "$cmd" ]
  then
    echo "Aborting: No branch selected"
    exit 1
  fi
  # same branch
  if [ "$cmd" = "*" ]
  then
    exit 0
  fi
  
  git checkout "$cmd"
}

fbd() {
  local branches branch cmd
  local trace=${GIT_TRACE:-false}
  
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf -m) &&

 # for each selected branches: get the first 'field' | trim | join lines | trim trailing
  cmd=$(echo "$branch" | awk '{print $1}' | sed 's/.* //' | tr '\n' ' ' | sed 's/ *$//g')

  if [ -z "$cmd" ]; then
    echo "Aborting: No branch selected"
    exit 1
  fi
  
  if [ "$trace" = true ] ; then
    echo "command to run: 'git branch -d $cmd'"
  else
    git branch -d $cmd
  fi
}

fbD() {
  local branches branch cmd
  local trace=${GIT_TRACE:-false}
  
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf -m) &&

  # for each selected branch: get the first 'field' | trim | join lines | trim trailing
  cmd=$(echo "$branch" | awk '{print $1}' | sed 's/.* //' | tr '\n' ' ' | sed 's/ *$//g')

  if [ -z "$cmd" ]; then
    echo "Aborting: No branch selected"
    exit 1
  fi
  if [ "$trace" = true ] ; then
    echo "command to run: 'git branch -D $cmd'"
  else
    git branch -D $cmd
  fi
}
