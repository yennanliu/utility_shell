# https://linuxize.com/post/how-to-install-anaconda-on-centos-7/

# step 1)
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh

# step 2) 
# as root user
sudo yum install bzip2

# step 2)
bash Anaconda3-5.3.1-Linux-x86_64.sh

# step 3)
source ~/.bashrc

# step 4) check install
conda info
