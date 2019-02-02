# set anaconda python 3 as default python 
export PATH=~/anaconda3/bin:$PATH


# command line color setting  
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
#alias ls='ls -GFh'


# GCLOUD setting 
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yennanliu/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/yennanliu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yennanliu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/yennanliu/Downloads/google-cloud-sdk/completion.bash.inc'; fi


# Maven setting 
export M3_HOME=/Users/yennanliu/maven/apache-maven-3.6.0
export PATH=$M3_HOME/bin:$PATH


# export SPARK_HOME 
export SPARK_HOME=/Users/$USER/spark
export PATH=$SPARK_HOME/bin:$PATH