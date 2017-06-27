#!/bin/bash
# directly append 1 csv to the other if they have same shema 


OutFileName=RESULT_`date +"%Y-%m-%d"`.csv                  # Fix the output name
#OutFileName="MERGED_.csv"                       # Fix the output name

i=0                                       # Reset a counter
for filename in ./*.csv; do 
 if [ "$filename"  != "$OutFileName" ] ;      # Avoid recursion 
 then 
   if [[ $i -eq 0 ]] ; then 
      head -1  $filename >   $OutFileName # Copy header if it is the first file
   fi
   tail -n +2  $filename >>  $OutFileName # Append from the 2nd line each file
   i=$(( $i + 1 ))                        # Increase the counter
 fi
done