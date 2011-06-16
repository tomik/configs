# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#paths for tomik

export MANPATH=$MANPATH:/usr/share/man
export PATH=/usr/local/bin/:$HOME/usr/bin:$PATH
export PYTHONPATH=$HOME/usr/lib/python:$PYTHONPATH

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -l'
alias ll='ls -lh'
alias la='ls -a'
alias c='cd'
alias v='vim'
alias g='git'
alias gr='grep'
alias du='du -hs'
alias dus='du | sort'
alias df='df -h'
alias su='sudo bash'
alias rmf='rm -rf'
alias ls='ls -G'

alias rwgrep='perl -i~ -pe'
alias pygrep='grep -ri --include="*.py"'
alias htmlgrep='grep -ri --include="*.html"'
alias pyhtmlgrep='grep -ri --include="*.py" --include="*.html"'
alias vmw='DISPLAY=localhost:0.0 vmware-server-console'
alias pmr='python manage.py runserver'
alias pm='python manage.py'
alias cgos='cgosview cgos.lri.fr 6919'
alias rmpyc='find ./ -name "*.pyc" | xargs -i rm {}'
alias dummy_smtp='python -m smtpd -n -c DebuggingServer localhost:1025'

alias __e1='sshfs tomik@zene.sk: ~/mnt/e1/'
alias __linda='sshfs tomik@linda.karlov.mff.cuni.cz: ~/mnt/linda/'
alias __conan='sshfs tomik@conan.sk: ~/mnt/conan/'
alias _krabicka='ssh -p2222 tomik@krabicka.net'
alias _linda='ssh tomik@linda.karlov.mff.cuni.cz'
alias _e1='ssh tomik@zene.sk'
alias _conan='ssh tomik@conan.sk'

export EDITOR=vim

DJANGO_DIR=/usr/lib/python2.5/site-packages/django/

PS1='\[\e[1;35m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\] '

if [ $USER == "root" ]; then
  PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\033[0;37m\]'
fi

echo
fortune

