# https://zhuanlan.zhihu.com/p/349295868

# Step 1) install Conda for Apple silicon (M1) with below link
# https://zhuanlan.zhihu.com/p/349295868#:~:text=https%3A//github.com/conda-forge/miniforge/%23download

# Step 2) move the script to home path
mv Miniforge3-MacOSX-arm64.sh ~/

# Step 3) Run
Chmod +x Miniforge3-MacOSX-arm64.sh
./Miniforge3-MacOSX-arm64.sh

# Step 4) validate (close the terminal and restart)
conda --version
