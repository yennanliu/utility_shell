# https://zhuanlan.zhihu.com/p/349295868

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
