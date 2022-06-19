# https://mrmad.com.tw/macos-terminal-oh-my-zsh

cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# vim ~/.zshrc
# ZSH_THEME = agnoster
echo 'syntax on' >> ~/.vimrc
echo 'set nu!' >> ~/.vimrc
source ~/.zshrc
cd ~
cd ~/Downloads && git clone https://github.com/powerline/fonts.git
cd fonts && ./install.sh
cd && rm -rf ~/Downloads/fonts