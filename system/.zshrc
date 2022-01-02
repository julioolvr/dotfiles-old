# Uncomment this line and the one at the end of the file to profile initialization
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/joliv/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="hyperzsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search docker)

# Disable "magic" functions that slow down copy/paste
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Disabled Pure prompt, trying out starship prompt
# autoload -U promptinit; promptinit
# PURE_PROMPT_SYMBOL=λ
# prompt pure
eval "$(starship init zsh)"

# Disable nvm, trying out volta
# nvm configuration
# Set a default version manually and declare a function to load nvm
# nvm is particularly slow and if it's not used then it's a waste to load it
# export PATH=~/.nvm/versions/node/v14.17.5/bin:$PATH

# function invm() {
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
# }
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Setup for Rust's Racer
RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Z
. ~/bin/z.sh

export TERM=xterm-256color

# Add Cargo binaries to PATH
export PATH="$PATH:$HOME/.cargo/bin"

# Homebrew uses $HOME/go to install Go packages, add it to the path
export PATH="$PATH:$HOME/go/bin"

# Add own scripts and stuff to PATH
export PATH="$PATH:$HOME/bin"

# Add Python3 and other executables to the path
export PATH="$PATH:$HOME/.local/bin"

# Because of macOS reasons
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Set VSCode as the default editor for gems
export BUNDLER_EDITOR=code

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use ripgrep with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'
_fzf_compgen_path() {
  rg --files --hidden 2>/dev/null
}
_fzf_compgen_dir() {
  rg --hidden --files --null --sort path 2>/dev/null | xargs -0 dirname | uniq
}

# Custom aliases
alias ov=overmind
alias oc="overmind connect"
alias or="overmind restart"
alias be="bundle exec"
alias n=nvim
alias ta="tmux new-session -A -s"
alias tl="tmux ls"
## Replace ls with exa and add some convenient shortcuts
alias e="exa --group-directories-first"
alias el="exa -l --group-directories-first"
alias ls=e
alias ll=el

# Use nvim as default editor
export EDITOR=nvim

# If it exists, source a private zshrc file that's not in source control
if [ -f ~/.zshrc.private ]; then
  source ~/.zshrc.private
fi

# Fuzzy git checkout
fzf-git-branch() {
  git rev-parse HEAD > /dev/null 2>&1 || return

  git branch --color=always --all --sort=-committerdate |
    grep -v HEAD |
    fzf --height 50% --ansi --no-multi --preview-window right:65% \
        --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
    sed "s/.* //"
}

fzf-git-checkout() {
  git rev-parse HEAD > /dev/null 2>&1 || return

  local branch

  branch=$(fzf-git-branch)
  if [[ "$branch" = "" ]]; then
      echo "No branch selected."
      return
  fi

  # If branch name starts with 'remotes/' then it is a remote branch. By
  # using --track and a remote branch name, it is the same as:
  # git checkout -b branchName --track origin/branchName
  if [[ "$branch" = 'remotes/'* ]]; then
      git checkout --track $branch
  else
      git checkout $branch;
  fi
}

alias gb='fzf-git-branch'
alias gco='fzf-git-checkout'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Uncomment this line and the one at the top of the file to profile initialization
# zprof
