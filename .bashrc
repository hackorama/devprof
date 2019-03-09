#
# hackorama bash profile | https://github.com/hackorama/devprof
#

function devprof() { # update to latest version
  echo
  echo "Updating using : bash <(curl -s https://raw.githubusercontent.com/hackorama/devprof/master/devprof.sh)"
  echo
  read -p "Do you want to update the dev profile (y/n) " response
  echo
  case $response in
        (y*) bash <(curl -s https://raw.githubusercontent.com/hackorama/devprof/master/devprof.sh) ;;
  esac
}

function devprofhelp() {
  echo "devprof : will update using 'bash <(curl -s https://raw.githubusercontent.com/hackorama/devprof/master/devprof.sh)'"
}

function dphelp() {
  devprofhelp
}

function dph() {
  devprofhelp
}

function __show_tag() { # show optional system id tag in prompt
  if [ ! -z "$TAG" ]; then
    echo -e "$TAG "
  elif [ -f ~/.devprof/tag ]; then
    TAG=$(cat ~/.devprof/tag)
    echo -e "$TAG "
  fi
}

# eye candy

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS='no=00;38;5;250:rs=0:di=01;38;5;198:ln=01;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:ex=01;38;5;82:*.cmd=00;38;5;82:*.exe=00;38;5;82:*.com=00;38;5;82:*.btm=00;38;5;82:*.bat=00;38;5;82:*.jpg=00;38;5;37:*.jpeg=00;38;5;37:*.png=00;38;5;37:*.gif=00;38;5;37:*.bmp=00;38;5;37:*.xbm=00;38;5;37:*.xpm=00;38;5;37:*.tif=00;38;5;37:*.tiff=00;38;5;37:*.pdf=00;38;5;98:*.odf=00;38;5;98:*.doc=00;38;5;98:*.ppt=00;38;5;98:*.pptx=00;38;5;98:*.db=00;38;5;98:*.aac=00;38;5;208:*.au=00;38;5;208:*.flac=00;38;5;208:*.mid=00;38;5;208:*.midi=00;38;5;208:*.mka=00;38;5;208:*.mp3=00;38;5;208:*.mpc=00;38;5;208:*.ogg=00;38;5;208:*.ra=00;38;5;208:*.wav=00;38;5;208:*.m4a=00;38;5;208:*.axa=00;38;5;208:*.oga=00;38;5;208:*.spx=00;38;5;208:*.xspf=00;38;5;208:*.mov=01;38;5;208:*.mpg=01;38;5;208:*.mpeg=01;38;5;208:*.3gp=01;38;5;208:*.m2v=01;38;5;208:*.mkv=01;38;5;208:*.ogm=01;38;5;208:*.mp4=01;38;5;208:*.m4v=01;38;5;208:*.mp4v=01;38;5;208:*.vob=01;38;5;208:*.qt=01;38;5;208:*.nuv=01;38;5;208:*.wmv=01;38;5;208:*.asf=01;38;5;208:*.rm=01;38;5;208:*.rmvb=01;38;5;208:*.flc=01;38;5;208:*.avi=01;38;5;208:*.fli=01;38;5;208:*.flv=01;38;5;208:*.gl=01;38;5;208:*.m2ts=01;38;5;208:*.divx=01;38;5;208:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:'

if [[ $(uname -s) == Darwin ]] # on macos
then
  alias ls='ls -GFh'
else
  alias ls='ls --color=auto'
fi

export GREP_COLOR='1;35;40'
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

export PS1='$(__show_tag)\[\e[38;5;81m\]\u\[\e[38;5;141m\]@\[\e[38;5;154m\]\h\[\e[38;5;186m\] \[\e[38;5;197m\]\W \[\e[38;5;37m\]$(__git_ps1) \[\e[38;5;141m\]\$\[\e[0m\] '

shopt -s checkwinsize

# git completion and prompt

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_HIDE_IF_PWD_IGNORED=true
GIT_PS1_SHOWCOLORHINTS=true
if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then # mac
  source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then # mac brew
  source /usr/local/etc/bash_completion.d/git-completion.bash
elif [ -f /etc/bash_completion.d/git-completion.bash ]; then # ubuntu
  source /etc/bash_completion.d/git-completion.bash
else  # fall back to latest version NOTE: may not match the local git version
  source ~/.devprof/git-completion.bash
fi
source ~/.devprof/git-prompt.sh

# history

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend # append

# screen

exit() { # confirm exit if within a screen session
  if test -n "$STY"; then
    read -p "Exit the screen session (y/n) " response
    case $response in
        (y*) command exit "$@" ;;
    esac
  else
    command exit "$@"
  fi
}

# k8s completion

if hash kubectl 2>/dev/null; then
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
fi

# local only profile if any

if [ -f ~/.bashrc_local ]; then
   source ~/.bashrc_local
fi
