# https://www.facebook.com/share/p/14b9DXiPo5M/

touch ~/.gitignore_global
echo ".DS_Store" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
