# vim: filetype=sh

function ctags_ruby {
  ctags --append=yes --languages=ruby --recurse=yes --tag-relative=yes --verbose -f ~/.tags $@
}

function install_python_packages {
  pip install {fabric,boto,texttable,awscli,MySQL-python,bpython,apache-libcloud,Sphinx,pep8,pylint,mechanize}
}

function line {
  local ret=0
  local line_number=$1
  [[ $# -eq 2 ]] || ret=1 
  [[ $ret -eq 0 ]] || printf "Try line 1 <file>, or sed-style line numbers, e.g. 1,10\n" 
  [[ $ret -eq 0 ]] || return 1
  sed -n "${line_number}p" $@ 2>/dev/null
}

function tabname {
  printf "\e]1;$1\a"
}

