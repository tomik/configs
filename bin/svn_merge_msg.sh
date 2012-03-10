svn log -c $1 $2 | tail -n +4 | sed "$ d" | tac | sed '/./,$!d' | tac | \
awk '{ if(NR == 1 && $1 != "Merged")
    print "Merged from r'$1'\n";
  print $0;
} '
