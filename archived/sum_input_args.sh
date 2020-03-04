echo "input :"  "$@"

r=0
for x in $@
do 
	echo $x 
	r=$((r+x))
done 

echo $r