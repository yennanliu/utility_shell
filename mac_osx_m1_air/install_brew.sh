# https://stackoverflow.com/questions/66666134/how-to-install-homebrew-on-m1-mac

# step 1)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# step 2) export path
# open /Users/yennanliu/.zprofile and add below
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/yennanliu/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"

# step 3) validate
brew
