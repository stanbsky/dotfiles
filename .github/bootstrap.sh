# Run with:
# OUT="$(mktemp)"; wget -q -O - https://pathtofile > $OUT; . $OUT

DOTFILES="$HOME/.dotfiles"

dtf () {
  git --git-dir="$DOTFILES" --work-tree="$HOME" "$@"
}

dtfnew () {
  git clone --bare $1 $DOTFILES
  dtf config --local status.showUntrackedFiles no
  dtf switch -c base

  echo "Please add and commit additional files"
  echo "using 'dtf add' and 'dtf commit', then run"
  echo "dtf push -u origin base"
}

dtfrestore () {
  git clone -b base --bare $1 $DOTFILES
  dtf config --local status.showUntrackedFiles no
  dtf checkout || echo -e 'Deal with conflicting files, then run (possibly with -f flag if you are OK with overwriting)\ndtf checkout'
}
