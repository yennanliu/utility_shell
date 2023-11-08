# https://zhuanlan.zhihu.com/p/349295868

#-----------------------------------
# V1
#-----------------------------------

# https://docs.conda.io/projects/miniconda/en/latest/

# install
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

# export env var
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh


#-----------------------------------
# V2
#-----------------------------------
# Step 1) install Conda for Apple silicon (M1) with below link
# https://zhuanlan.zhihu.com/p/349295868#:~:text=https%3A//github.com/conda-forge/miniforge/%23download

# Step 2) move the script to home path
mv Miniforge3-MacOSX-arm64.sh ~/

# Step 3) Run
Chmod +x Miniforge3-MacOSX-arm64.sh
./Miniforge3-MacOSX-arm64.sh

# step 4) (optional) alias conda
# https://stackoverflow.com/questions/8967843/how-do-i-create-a-bash-alias
alias conda="/Users/yennanliu/miniforge3/bin/conda"

# Step 5) validate (close the terminal and restart)
conda --version
