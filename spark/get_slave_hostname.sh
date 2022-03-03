# https://stackoverflow.com/questions/24182950/how-to-get-hostname-from-ip-linux

# pre-process
# x_list = x.split("\t")
# y = [ i for i in x_list if "\n" in i]
# y_ = [i.replace("\n", "") for i in y]
# y_2 = [i.split(":")[0] for i in y_]
# y_2[:-1]
# " ".join(y_2[:-1])

# get hostname from ip
slaves="100.0.0.1 100.0.0.2 ..."

for slave in $slaves
do
	host $slave
done
