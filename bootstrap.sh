#!/usr/bin/env zsh
# fast copy dotfiles config, includes shell, brew.

set -e

declare -r APP_PATH="${HOME}/.dotfiles"
declare -r APP_NAME="dotfiles"
declare -r REPO_URL="https://github.com/clay-f/dotfiles.git"
debug_mode=0

msg() {
  printf '%b\n' "$1" >&2
}

success() {
  if [[ "$?" -eq 0 ]]; then
    msg "\33[32m[✔]\33[0m ${1}${2}"
  fi
}

error() {
  msg "\33[31m[✘]\33[0m ${1}${2}"
  exit 1
}

debug() {
  if [[ $debug_mode -eq 1 && $ret -gt 1 ]]; then
    msg "An error occurred in function ${FUNCNAME[1]}, ${BASH_LINENO[1]}, sorry for that."
  fi
}

program_exists() {
  local ret='0'
  command -v "$1" >/dev/null 2>&1 || { local ret='1'; }

  if [[ "$ret" -ne 0 ]]; then
    return 1
  fi

  return 0
}

program_must_exist() {
  program_exist $1

  if [[ "$?" -ne 0 ]]; then
    error "You muse have '$1' installed  to continue."
  fi
}

sync_repo() {
  local repo_path="$1"
  local repo_url="$2"
  local repo_branch="$3"

  msg "Trying to update $APP_NAME"

  if [[ ! -e "$repo_path" ]]; then
    mkdir -p "$repo_path"
    git clone "$repo_url" "$repo_path"
    success "Successfully updated $APP_NAME"
  else
    cd "$repo_path" && git pull origin "$repo_branch"
    success "Successfully updated $APP_NAME"
  fi
}

do_backup() {
  if [[ -e "$1" ]] || [[ -e "$2" ]] || [[ -e "$3" ]]; then
    msg "Attempting to back up your original dotfiles configration."
    today=$(date +%Y%m%d_%s)
    for i in "$1" "$2" "$3"; do
      [[ -e "$i" ]] && [[ -L "$i" ]] && mv -v "$i" "$i.$today"
    done
    success "Your original dotfiles configuration has been backed up."
  fi
}

lnif() {
  if [[ -e "$1" ]]; then
    ln -sf "$1" "$2"
  fi
  ret="$?"
  debug
}

create_symlinks() {
  local source_path="$1"
  local target_path="$2"

  lnif "$source_path/git/gitignore/macOS.gitignore" "$target_path/.gitignore_global"
  cp "$source_path/git/gitconfig" "$target_path/.gitconfig"
  cp "$source_path/tools/help_do.sh" "$target_path/.help_do.sh"

  ret="$?"
  success "Setting up link files"
  debug
}

brew_config_tools() {
  if [[ $count -gt 0 ]]; then
    config_brew_and_relate_tools
    (zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
  fi
  ret="$?"
  debug
}

config_brew_and_relate_tools() {
  program_exists "brew"
  if [[ "$?" -ne 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    (program_must_exist brew) && zsh "$APP_PATH/etc/brew.sh"
  fi
  ret="$?"
  debug
}

main() {
  do_backup "$HOME/.dotfiles"

  sync_repo "$HOME/.dotfiles" \
    "$REPO_URL" \
    "master"

  create_symlinks "${APP_PATH}" \
    "${HOME}"

  uanme -s | grep -i 'darwin' >/dev/null && source brew_config_tools

  msg "config dotfiles succeed"
}

main
