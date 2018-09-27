#!/bin/sh


# ref  https://medium.com/@kn.maragatham09/installing-jupyter-notebook-on-google-cloud-11979e40cd10

# download anaconda 
wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.shwget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
# install anaconda
bash Anaconda3–4.2.0-Linux-x86_64.sh
# export anaconda path 
export PATH=/home/yennanliu/anaconda3/bin:$PATH
# run ipython command line 
ipython 

# then run the command below (inside ipython)
<<COMMENT1

"""

from IPython.lib import passwd
passwd()
Enter password: [Create password and press enter] Verify password: [Press enter]

# then will get response like this : 'sha1:98ff0e580111:12798c72623a6eecd54b51c006b1050f0ac1a62d'

exit 

"""

COMMENT1



# Create Config profile
jupyter notebook --generate-config
mkdir certs
cd certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

# Configure Jupyter
cd ~/.jupyter/
nano jupyter_notebook_config.py

# paste below commands to jupyter_notebook_config.py
<<COMMENT1
"""
c = get_config()
# Kernel config
c.IPKernelApp.pylab = 'inline'  # if you want plotting support always in your notebook
# Notebook config
c.NotebookApp.certfile = u'/home/yennanliu/certs/mycert.pem' #location of your certificate file
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False  #so that the ipython notebook does not opens up a browser by default
c.NotebookApp.password = u'sha1:98ff0e580111:12798c72623a6eecd54b51c006b1050f0ac1a62d'  #the encrypted password we generated above
# Set the port to 8888, the port we set up in the AWS EC2 set-up
c.NotebookApp.port = 8888
"""
COMMENT1

# Create a New Folder
cd ~
mkdir Notebooks
cd Notebooks


# run the jupyter notebook
jupyter notebook


# then visit the notebook via https://35.228.237.26:8888/





