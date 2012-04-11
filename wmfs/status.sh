#!/bin/sh
#  
# 
#
  
# Fecha
 DATE="`date '+%a %d %b %Y'`"
  
# Hora 
 HOUR="`date '+%H:%M:%S'`"
  

# Procesador
 CPU0=$(eval $(awk '/^cpu0 /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat);
          sleep 0.4;
          eval $(awk '/^cpu0 /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat);
          intervaltotal=$((total-${prevtotal:-0}));
          echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))")
  	  
# Mem.
 MEM="`free -m | grep "buffers/" | awk {'print $3'}`"
  
# Vol. 
  VOL=`amixer | grep "PCM" -A 5 | grep -o "\[.*%" | sed "s/\[//" | sed 's/%//'` 
 


#
 wmfs -s "\\#000000\\CPU ¤ \\#BD814B\\$CPU0%  | \\#000000\\MEM ¤ \\#BD814B\\$MEM | \\#000000\\VOL ¤ \\#BD814B\\$VOL%\\#BD814B\\ | \\#000000\\$DATE \\#BD814B\\| \\#BD814B\\$HOUR" 
 
 

