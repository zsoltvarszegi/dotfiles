line() {
  local ret=0
  local line_number=$1
  [[ $# -eq 2 ]] || ret=1 
  [[ $ret -eq 0 ]] || printf "Try line 1 <file>, or sed-style line numbers, e.g. 1,10\n" 
  [[ $ret -eq 0 ]] || return 1
  sed -n "${line_number}p" $@ 2>/dev/null
}

ctags_ruby() {
  ctags --append=yes --languages=ruby --recurse=yes --tag-relative=yes --verbose -f ~/.tags $@
}

function install_python_packages {
  pip install {fabric,boto,texttable,awscli,MySQL-python,bpython,apache-libcloud,Sphinx,pep8,pylint,mechanize}
}

if [ -f ~/.git-completion.sh ]; then
  . ~/.git-completion.sh
fi

shopt -s dotglob # ls dir/* includes dotfiles
export HISTCONTROL="ignoredups"
export EDITOR="vim"
export PAGER='less'
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:~/bin:/bin:/sbin:/usr/bin:/usr/sbin"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'
export LESS='-R'

export EC2_APITOOL_HOME=$HOME/bin/ec2-api-tools
export EC2_AMITOOL_HOME=$HOME/bin/ec2-ami-tools
export EC2_HOME=${EC2_APITOOL_HOME}
export PATH="$EC2_HOME/bin:$EC2_AMITOOL_HOME/bin:$PATH"

if [ -d ~/.rbenv ]; then
  export RBENV_ROOT=~/.rbenv
  export PATH="$RBENV_ROOT/bin:$PATH"
fi
eval "$(rbenv init -)"
export RI='-f ansi'

# Python
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# Perl
[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

# SM
if [ -d $HOME/.sm ]; then
  export PATH="${PATH}:/home/andrewh/.sm/bin:/home/andrewh/.sm/pkg/active/bin:/home/andrewh/.sm/pkg/active/sbin"
fi

# Node
if [ -f "/usr/local/bin/npm" ]; then
	export PATH="${PATH}:/usr/local/share/npm/bin:/usr/local/share/npm/lib/node_modules/yo/bin"
fi

# Go
export GOPATH=~/code/personal/go
export GOROOT=~/code/opensource/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Java
if [ -d /Library/Java/JavaVirtualMachines/jdk1.7.0_17.jdk ]; then
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_17.jdk/Contents/Home"
fi

# Prompt
if [[ -s "${HOME}/.prm/lib/init.sh" ]]; then 
  source "${HOME}/.prm/lib/init.sh"
  export PATH="${PATH}:${HOME}/.prm/bin"
else
 export PS1='$? [\W]\n$ '
fi

[[ -f /usr/local/bin/gsed ]] && alias sed='gsed'
[[ -f /usr/local/bin/hub ]] && alias git='hub'
alias cl='clear'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gd='git diff'
alias gl='git log'
alias gla='git last'
alias gp='git push'
alias gphm='git push heroku master'
alias gpl='git pull'
alias gpom='git push origin master'
alias grep='grep --color=auto'
alias gst='git status'
alias ifconfig.me='curl ifconfig.me'
alias ifm='curl ifconfig.me'
alias irb='pry'
alias ls='ls -G'
alias l1='ls -1'
alias l='ls -Gp'
alias la='ls -laGp'
alias ll='ls -lGp'
alias s='ls -Gp'
alias sacs='sudo apt-cache search'
alias sag='sudo apt-get'
alias saga='sudo apt-get autoremove'
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update'
alias show_functions="declare -f"
alias sl='ls -Gp'
alias sll='ls -lGp'
alias syi='sudo yum install'
alias sys='sudo yum search'
alias t='tree'
alias th='tree -h'
alias vd='vagrant destroy -f'
alias vhalt='vagrant halt'
alias vp='vagrant provision'
alias vssc='vagrant ssh -c'
alias vssh='vagrant ssh'
alias vst='vagrant status'
alias vup='vagrant up'
alias z='sudo su - zenoss'
