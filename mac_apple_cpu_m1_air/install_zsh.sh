# https://technofob.com/2020/12/24/the-ultimate-mac-m1-terminal-iterm2-oh-my-zsh-zsh-syntax-highlighting/

# step 1) install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# step 2) Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# step 4) activate
# vi ~/.zshrc
# plugins=(git zsh-autosuggestions)

# step 5) customize .zshrc
