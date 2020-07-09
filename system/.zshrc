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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search)

# Set color for ZSH autosuggestions, 100 is set in Alacritty's theme file
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=100"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure

# nvm configuration
# Set a default version manually and declare a function to load nvm
# nvm is particularly slow and if it's not used then it's a waste to load it
export PATH=~/.nvm/versions/node/v12.16.1/bin:$PATH

function invm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
}

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

# Add Python3 executables to the path
export PATH="$PATH:`python3 -m site --user-base`/bin"

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
alias be="bundle exec"
alias n=nvim
alias ta="tmux attach"

# Use nvim as default editor
export EDITOR=nvim

# If it exists, source a private zshrc file that's not in source control
if [ -f ~/.zshrc.private ]; then
  source ~/.zshrc.private
fi

# This is to get coc-omnisharp working in neovim
export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current

# Replace ls with exa and add some convenient shortcuts
alias e="exa --group-directories-first"
alias el="exa -l --group-directories-first"
alias ls=e
alias ll=el

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Uncomment this line and the one at the top of the file to profile initialization
# zprof
