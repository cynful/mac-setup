#  -------------------------------------------------------------------------
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  System Operations & Information
#  7.  Exports
#  8.  Google Cloud SDK
#  -------------------------------------------------------------------------


# ----------------------------- 
# 1. ENVIRONMENT CONFIGURATION
# ------------------------------

# Change Prompt
# -------------------------------------------------------------------------
# https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  # GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
# ------------------------------------------------------------
export BLOCKSIZE=1k


# -------------------------
# 2. MAKE TERMINAL BETTER
# -------------------------
alias rm='rm -i'                        # Preferred 'rm' implementation
alias cp='cp -iv'                       # Preferred 'cp' implementation
alias mv='mv -iv'                       # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                 # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                   # Preferred 'ls' implementation
alias less='less -FSRXc'                # Preferred 'less' implementation
cd () { builtin cd "$@"; ll; }          # Always list directory contents upon 'cd'
alias which='type -all'                 # which:  Find executables
alias path='echo -e ${PATH//:/\\n}'     # path:   Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }    # mcd:    Makes new Dir and jumps inside

alias lr='ls -hArtl -FG'    # thanks @mhartl
alias grep='grep -i'
alias get='curl -OL'

trash () { command mv -iv "$@" ~/.Trash ; }  # trash:  Moves a file to the MacOS trash

fuckingwifi () {                             # thanks @jacobmoyle
    networksetup -setairportpower en0 off
    sleep 1
    echo "Fucking WiFi..."
    sleep 1
    echo "I swear to god, if Steve Jobs wasn't dead..."
    sleep 1
    echo "I'd punch him in his stupid turtleneck..."
    networksetup -setairportpower en0 on
}

# Python specific mac default 2.7 alias to brew install python3
# ---------------------------------------------------------------
alias python=python3
alias pip=pip3


# -------------------------------
# 3. FILE AND FOLDER MANAGEMENT
# -------------------------------

# extract:  Extract most know archives with one command
# -------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}


# -----------------------
# 5. PROCESS MANAGEMENT
# -----------------------

# findPid: find out the pid of a specified process
# --------------------------------------------------------------------------
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
# --------------------------------------------------------------------------
findPid () { lsof -t -c "$@" ; }

# ttop:  Recommended 'top' invocation to minimize resources
# ------------------------------------------------------------------
# Taken from this macosxhints article:
# http://www.macosxhints.com/article.php?story=20060816123853639
# ------------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"


# -------------------------------------
# 6. SYSTEMS OPERATIONS & INFORMATION
# -------------------------------------

# cleanupDS:  Recursively delete .DS_Store files
# ---------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# cleanupPATH:
# --------------
alias cleanupPATH="PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')"

# ---------------------------------------
# 7. EXPORTS
# ---------------------------------------
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$PATH
export PATH=$GOROOT/bin:$PATH

# ------
# RUBY
# ------
export PATH="/usr/local/opt/ruby/bin:$PATH"

# ---------------------
# 8. GOOGLE CLOUD SDK
# ---------------------
export NVM_DIR="/Users/cynful/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cynful/google-cloud-sdk/path.bash.inc' ]; then . '/Users/cynful/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cynful/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/cynful/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

