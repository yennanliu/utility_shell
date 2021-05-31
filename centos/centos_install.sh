# 1)
# centos install ansible plaubook
# https://www.snel.com/support/how-to-install-ansible-on-centos-7/
sudo yum -y install epel-repo
sudo yum -y install ansible


# 2)
# cent os install apt-get
# https://www.getpagespeed.com/server-setup/apt-centos
curl https://raw.githubusercontent.com/dvershinin/apt-get-centos/master/apt-get.sh -o /usr/local/bin/apt-get
chmod 0755 /usr/local/bin/apt-get

# 3) install javac
# https://stackoverflow.com/questions/5407703/javac-command-not-found
# as root
yum install java-devel
