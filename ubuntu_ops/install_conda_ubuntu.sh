# install conda 
# https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart

# nb ref : https://github.com/yennanliu/analysis/blob/master/notebook/notebook_magic/install_conda_ubuntu.ipynb

cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh

sha256sum Anaconda3-2019.03-Linux-x86_64.sh

bash Anaconda3-2019.03-Linux-x86_64.sh

export PATH=~/anaconda3/bin:$PATH
# add export PATH=~/anaconda3/bin:$PATH to ~/.bashrc
source ~/.bashrc
