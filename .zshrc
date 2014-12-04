# Determine which OS we're on
uname="`uname -s`"

### SEARCH PATHS

  # First look in user-bin, then local-bin, then elsewhere
  export PATH=~/bin:/usr/local/bin:${PATH}

  ### MAC OS X SPECIFIC SETTINGS

  if [ "x$uname" = "xDarwin" ] ; then
    # TeXLive
    export PATH=${PATH}:/usr/local/texlive/2011/bin/x86_64-darwin

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
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

    # Add npm to path
    export PATH=${PATH}:/usr/local/share/npm/bin
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
  export GREP_COLOR='38;5;197m'

### ALIASES

  # Git
  alias gbr="git branch -r"
  alias gbv="git branch -v"
  alias gd='git diff'
  alias gl="git log"
  alias gs='git status'

  # Make R not ask to save workspace
  alias R='R --no-save'

### Load oh-my-zsh on OS X (on Linux tmus+oh-my-zsh is dead slow)

  if [ "x$uname" = "xDarwin" ] ; then
    export ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="af-magic"
    plugins=(git)
    source ~/.oh-my-zsh/oh-my-zsh.sh
  fi

### MOTD

  # Display fortune cookie in the most ridiculous way
  fortune | cowsay | lolcat
