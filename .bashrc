shopt -s checkwinsize

export MANPATH=$MANPATH:/usr/share/man
export PATH=/opt/local/bin:/usr/local/bin/:$HOME/usr/bin:$HOME/bin:$PATH
export PATH=$PATH:/usr/local/texlive/2011basic/bin/universal-darwin:/Developer/usr/bin
export PATH=$PATH:/usr/local/texlive/2011basic/bin/universal-darwin:/Developer/usr/bin
export PYTHONPATH=$HOME/usr/lib/python:$PYTHONPATH
export CLJPATH=/usr/local/Cellar/clojure/1.2.1/clojure.jar
export CLOJURESCRIPT_HOME=$HOME/lib/clojurescript
export CLASSPATH=.:$CLJPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
# add clojurescript to classpath
# TODO package as jar
for next in lib/* src/clj src/cljs; do
  CLASSPATH=$CLASSPATH:$CLOJURESCRIPT_HOME'/'$next
done
export EDITOR=vim

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh 2>/dev/null

#export CPLUS_INCLUDE_PATH=/usr/include/c++/4.2.1/x86_64-apple-darwin10:/usr/include/c++/4.2.1/:/usr/local/include:/usr/local/share/boost-1.53.0/include
#export CPLUS_INCLUDE_PATH=/usr/include/c++/v1:/usr/local/share/boost-1.53.0/include
#export BOOST_LIB_PATH=/usr/local/share/boost-1.53.0/lib
#export LIBRARY_PATH=$BOOST_LIB_PATH
#export LD_LIBRARY_PATH=$BOOST_LIB_PATH
export CXX=clang++

# start nailgun server
alias ng_server="java -cp ~/lib/server-2.2.0.jar:$CLJPATH:. vimclojure.nailgun.NGServer &"
# followed by name of the file to run
alias cljrun="java -cp $CLASSPATH clojure.main"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -l'
alias ll='ls -lh'
alias ls='ls -G'
alias la='ls -a'
alias c='cd'
alias v='vim'
alias r='ranger'
alias g='git'
alias h='heroku'
alias a='ack'
alias ts='tig status'
alias gr='grep'
alias du='du -hs'
alias dus='du | sort'
alias df='df -h'
alias su='sudo bash'
alias rmf='rm -rf'
alias dc='open -a "Double Commander" .'

alias hibernateon="sudo pmset -a hibernatemode 5"
alias hibernateoff="sudo pmset -a hibernatemode 3"

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

#alias rwgrep='perl -i~ -pe'
alias pygrep='grep -ri --include="*.py"'
alias htmlgrep='grep -ri --include="*.html"'
alias pyhtmlgrep='grep -ri --include="*.py" --include="*.html"'
alias vmw='DISPLAY=localhost:0.0 vmware-server-console'
alias pmr='python manage.py runserver'
alias pm='python manage.py'
alias rmpyc='find ./ -name "*.pyc" | xargs -i rm {}'
alias dummy_smtp='python -m smtpd -n -c DebuggingServer localhost:1025'

alias _e1='ssh tomik@zene.sk'
alias __e1='sshfs tomik@zene.sk: ~/mnt/e1/'
alias _grumpy='ssh 82.170.157.148'

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='\[\e[1;35m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;33m\]$(parse_git_branch) \[\e[m\]\[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\] '
if [ $USER == "root" ]; then
  PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\033[0;37m\]'
fi

echo
fortune
