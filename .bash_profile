[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

##
# Your previous /Users/jacktsai/.bash_profile file was backed up as /Users/jacktsai/.bash_profile.macports-saved_2011-11-02_at_19:16:09
##

# MacPorts Installer addition on 2011-11-02_at_19:16:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mongodb/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `gdircolors ~/.dir_colors`
fi

# Useful aliases
alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias c="clear"
alias e="exit"
alias ssh="ssh -X"
alias ..="cd .."

# Source nvm
. ~/.nvm/nvm.sh

#export TEST="A $TEST"
#echo $PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Show git branch name
function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
  now=`date +%s`;
  last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
  seconds_since_last_commit=$((now-last_commit));
  minutes_since_last_commit=$((seconds_since_last_commit/60));
  hours_since_last_commit=$((minutes_since_last_commit/60));
  minutes_since_last_commit=$((minutes_since_last_commit%60));

  echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

PS1="[ $HI\u \[\033[1;32m\]\w\[\033[0m] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ "
