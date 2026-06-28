#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

# General replacement for 'ls' with icons and grid layout
alias ls="eza --icons=always --long --group-directories-first"

# The "Long" detailed view (replacing 'll')
alias ll="eza --icons=always --long --header --git --group-directories-first"

# Display everything, including hidden dotfiles (replacing 'la')
alias la="eza --icons=always --long --header --all --group-directories-first"

# A beautiful tree view configuration
alias lt="eza --icons=always --tree --level=2 --group-directories-first"

# Custom function to manage dotfiles
# Usage: config add .zshrc | config commit -m "update" | config push
config() {
  # Where the 'Brain' (git metadata) is stored
  local git_dir="$HOME/github/ngeran/dotfiles.git"

  # Where the actual files are located (your Home folder)
  local work_tree="$HOME"

  # INITIALIZATION: Run 'config init' to set up a new repo automatically
  if [ "$1" = "init" ]; then
    mkdir -p "$(dirname "$git_dir")"
    git init --bare "$git_dir"
    # Hide untracked files so 'config status' doesn't show your whole Home folder
    git --git-dir="$git_dir" --work-tree="$work_tree" config --local status.showUntrackedFiles no
    echo "✅ Dotfiles repository created at $git_dir"
    return
  fi

  # EXECUTION: Pass all other commands (add, commit, push) directly to git
  git --git-dir="$git_dir" --work-tree="$work_tree" "$@"
}
