# Determine which OS we're on
uname="`uname -s`"

### SEARCH PATHS

  # First look in user-bin, then local-bin, then elsewhere
  export PATH=~/bin:/usr/local/bin:${PATH}

  # Enable 256 colors in terminal
  export TERM=xterm-256color

  # Make bc load config file
  export BC_ENV_ARGS="$HOME/.bc"

  # Enable tab completion etc
  export PYTHONSTARTUP=~/.pythonrc

  ### MAC OS X SPECIFIC SETTINGS

  if [ "x$uname" = "xDarwin" ] ; then
    # TeXLive
    export PATH=${PATH}:/usr/local/texlive/2015/bin/x86_64-darwin

    # Local static binaries
    export PATH=${PATH}:/usr/local/sbin

    # Local gcc build
    export PATH=${PATH}:/usr/local-gcc/bin

    # Add some more paths for man
    export MANPATH=${MANPATH}:/usr/man
    export MANPATH=${MANPATH}:/usr/share/man
    export MANPATH=${MANPATH}:/usr/local/man
    export MANPATH=${MANPATH}:/usr/local/share/man
    export MANPATH=${MANPATH}:/usr/local-gcc/man

    # Add homebrew llvm to linker search path
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/Cellar/llvm/3.4/lib/

    # Enable Homebrew Python packages
    unset PYTHONPATH
    #export PYTHONPATH=/usr/local/lib/python2.7/site-packages
    #:$PYTHONPATH

    # Add npm to path
    export PATH=/usr/local/bin:${PATH}:/usr/local/share/npm/bin
  fi

### ALIASES

  # Quick alias for make
  alias m='make'

  # No notice in GNU parallel (TODO: Only set if option is supported)
  alias parallel='parallel --no-notice'

  # Case-insensitive search (-i) and use raw characters (-r)
  alias less='less -ir'

  # Long ls output
  alias ll='ls -l'

  # Long all ls output
  alias la='ls -la'

  # Suffix paths with slash (-F), human-readable sizes (-h), colors (-G)
  alias ls='ls -FhG'

  # Have grep color highlight matches
  alias grep='grep --color=always'

### MAC ALIASES

  if [ "x$uname" = "xDarwin" ] ; then
    # Almost like ldd on Linux
    alias ldd="otool -L"

    # Quicklook (finder + space on file)
    alias ql="qlmanage -p >/dev/null 2>&1"
  fi

### ENVIRONMENT VARIABLES

  # Use vim as my default editor
  export EDITOR=vim

  # Language and charset
  export LANG=en_US.UTF-8
  export LC_CTYPE=no_NO.UTF-8

  # Change color output for ls
  export LSCOLORS=DxBxCxCxCxCxCxCxCxCxCx

  # Highlight grep matches with a bright pink color
  export GREP_COLOR='38;5;197'

### ALIASES

  # Git
  #
  # I use these aliases all the time
  alias ga='git commit --amend --no-edit'
  alias gd='git diff'
  alias gl="git log"
  alias gll="git log --color=never | head -2000 | vim -"
  alias gs='git status -sb'
  # I also use gdd, a script: 'git diff $* | vim -'

  # I don't remember to use these as much
  alias gbr="git branch -r"
  alias gbv="git branch -v"
  alias gdl='git diff --color=always | less'
  alias gn='git show --name-only --oneline'

  # GNU global
  alias gx='global -x'

  # Make R not ask to save workspace
  alias R='R --no-save'

### Load oh-my-zsh on OS X (on Linux tmus+oh-my-zsh is dead slow)

  export ZSH=$HOME/.oh-my-zsh
  ZSH_THEME="af-magic"
  plugins=()
  source ~/.oh-my-zsh/oh-my-zsh.sh
  alias ls='ls -FhG'

  # Slightly modify af-magic prompt
  PROMPT='$FG[237]%{$reset_color%}$FG[032]%n@%m %~$(git_prompt_info) $FG[105]%(!.#.»)%{$reset_color%} '
  # Remove ***INSANELY*** annoying right-hand user@host prompt
  unset RPROMPT

  # Disable history sharing
  unsetopt share_history

### Load host specific configurations

  if [ -e ~/.zshrc-local ]; then
    source ~/.zshrc-local
  fi

### MOTD

  # Display fortune cookie in the most ridiculous way
  fortune | cowsay | lolcat
