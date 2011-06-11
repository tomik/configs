# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#paths for tomik

export MANPATH=$MANPATH:/usr/share/man
export PATH=$PATH:$HOME/usr/bin:/usr/local/bin
export PYTHONPATH=$HOME/usr/lib/python:$PYTHONPATH
export PYROBOT=/usr/lib/python2.6/site-packages/pyrobot #/bin/pyrobot
PRG=$HOME/prg
TGA=$PRG/Projects/TGA/
BT=$PRG/Projects/TGA/doc/bt
TGA_DOC=$PRG/Projects/TGA/doc/
UNIX_PRG=$PRG/unix
HASKELL_PRG=$PRG/haskell
UZAP=$UNIX_PRG/zapoctak/trunk
WWW=$HOME/www/
AK=$HOME/src/akimot
ERO=$HOME/src/python/ero
AEI=$AK/other/aei
ATS=$AK/other/ats
RT=$AK/other/rabbitsa
TG=$AK/other/tagui
MATCH=$AK/other/match
DAF=$HOME/src/django/docalliancefilms/daf
LUA_PATH=";;;/usr/local/lib/lua/5.1/?"

GB_LOG=$HOME/src/gpsboard/work_log_gpsboard
GB=$HOME/src/gpsboard/trunk/gpsboard
GB_MEDIA=$GB/../www

PGD=$HOME/src/django/pagoda/
PAGODA=$HOME/src/django/pagoda/
GK=$HOME/src/django/goklub/
PRG=$HOME/src/django/cviko/trunk/cviko

GENGO=$HOME/src/gengo/trunk

DATA1=/mnt/data1

GO=$DATA1/[Go]

DJANGO_DIR=/usr/lib64/python2.4/site-packages/django

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

alias rwgrep='perl -i~ -pe'
alias pygrep='grep -ri --include="*.py"'
alias htmlgrep='grep -ri --include="*.html"'
alias pyhtmlgrep='grep -ri --include="*.py" --include="*.html"'
alias vmw='DISPLAY=localhost:0.0 vmware-server-console'
alias matlabnd='matlab -r2006a -- -nodesktop'
alias pmr='python manage.py runserver'
alias pm='python manage.py'
alias cgos='cgosview cgos.lri.fr 6919'
alias rmpyc='find ./ -name "*.pyc" | xargs -i rm {}'
alias dummy_smtp='python -m smtpd -n -c DebuggingServer localhost:1025'

alias __dukla='sshfs -p2222 tomik@dukla.doc-air.com: ~/mnt/dukla/'
alias __ymir='sshfs -p2222 tomik@ymir.doc-air.com: ~/mnt/ymir/'
alias __ms='sshfs kozet3am@u-pl17.ms.mff.cuni.cz: ~/mnt/ms/'
alias __e1='sshfs tomik@zene.sk: ~/mnt/e1/'
alias __linda='sshfs tomik@linda.karlov.mff.cuni.cz: ~/mnt/linda/'
alias __conan='sshfs tomik@conan.sk: ~/mnt/conan/'
alias _phobos='ssh -p2222 tomik@phobos.kolej.mff.cuni.cz'
alias _f_phobos='ncftp phobos.kolej.mff.cuni.cz'
alias _ms11='ssh -X kozet3am@u-pl11.ms.mff.cuni.cz'
alias _ms12='ssh -X kozet3am@u-pl12.ms.mff.cuni.cz'
alias _ms13='ssh -X kozet3am@u-pl13.ms.mff.cuni.cz'
alias _ms14='ssh -X kozet3am@u-pl14.ms.mff.cuni.cz'
alias _ms15='ssh -X kozet3am@u-pl15.ms.mff.cuni.cz'
alias _ms17='ssh -X kozet3am@u-pl17.ms.mff.cuni.cz'
alias _ms19='ssh -X kozet3am@u-pl19.ms.mff.cuni.cz'
alias _ms18='ssh -X kozet3am@u-pl18.ms.mff.cuni.cz'
alias _ms20='ssh -X kozet3am@u-pl20.ms.mff.cuni.cz'
alias _ms21='ssh -X kozet3am@u-pl21.ms.mff.cuni.cz'
alias _ms22='ssh -X kozet3am@u-pl22.ms.mff.cuni.cz'
alias _ms23='ssh -X kozet3am@u-pl23.ms.mff.cuni.cz'
alias _ms24='ssh -X kozet3am@u-pl24.ms.mff.cuni.cz'
alias _mssol='ssh kozet3am@u-us.ms.mff.cuni.cz'
alias _msir='ssh kozet3am@kappa.ms.mff.cuni.cz'
alias _blava='ssh petrusekta00b@info.gdunaba.sk'
alias _krabicka='ssh -p2222 tomik@krabicka.net'
alias _linda='ssh tomik@linda.karlov.mff.cuni.cz'
alias _parlab='ssh stud_24@parlab.ms.mff.cuni.cz'
alias _dukla='ssh -p2222 tomik@dukla.doc-air.com'
alias _ymir='ssh -p2222 tomik@ymir.doc-air.com'
alias _ymir_socks5='ssh -D 1234 -p2222 tomik@ymir.doc-air.com'
alias _dukla_socks5='ssh -D 1234 -p2222 tomik@dukla.doc-air.com'
alias _e1='ssh tomik@zene.sk'
alias _conan='ssh tomik@conan.sk'
alias _mount_e1='sshfs tomik@zene.sk:/home/tomik /home/tomik/mnt/e1'
alias _mount_krabicka='sshfs -p2222 tomik@krabicka.net:/home/tomik /home/tomik/mnt/krabicka'
alias _mount_conan='sshfs tomik@conan.sk:/home/tomik /home/tomik/mnt/conan'

alias _galjas='ssh tkk230@galjas.few.vu.nl -X'
alias _rattler='ssh tkk230@galjas.few.vu.nl -X'
alias _retrieve_sim_galjas='scp tkk230@galjas.few.vu.nl:last_ec_sim.pdf .; scp tkk230@galjas.few.vu.nl:worldimages.tar .'
alias _retrieve_aso_galjas='scp tkk230@galjas.few.vu.nl:last_aso_sim.pdf . ; xpdf last_aso_sim.pdf '
alias _retrieve_report_galjas='scp tkk230@galjas.few.vu.nl:report.pdf .'
alias _retrieve_ec_sim_rattler='scp tkk230@rattler.few.vu.nl:last_ec_sim.pdf .'
alias _vu='ssh tkk230@keg.cs.vu.nl'
alias _pg='ping www.google.com'

SVN_GB=svn+ssh://tomik@conan.sk/svn/gpsboard/trunk

alias joseki='qgo $GO/joseki/kogo.sgf'

export EDITOR=vim

DJANGO_DIR=/usr/lib/python2.5/site-packages/django/
STUDNICE="scp -r 'kozet3am@u-pl19.ms.mff.cuni.cz:/afs/ms/doc/vyuka/Studnice_Vedomosti/' ."


alias su='sudo bash'
alias rmf='rm -rf'
alias ls='ls --color=auto'
PS1='\[\e[1;35m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\] '


#Sun Tzu's Art Of War fortune
echo
fortune taow

alias ls='ls --color=auto'

if [ $USER == "root" ]; then
#stuff 
alias p='pacman'
alias y='yaourt'
alias psearch="pacman -Sl | cut -d' ' -f2 | grep"

#root prompt
PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\033[0;37m\]'
fi
