git_first_unstaged() {
  git ls-files --modified | sed -n 1p
}