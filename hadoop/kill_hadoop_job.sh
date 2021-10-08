# 1) case 1 : distcp ( via anaconda3)
PIDS="`ps -ef  | grep anaconda3 | egrep "2021090103" | awk '{print $2}'`"
echo $PIDS
for i in ${PIDS}; do { echo "Killing $i"; kill -9 $i; }; done;
