# 1) Uninstall node, npm

# https://www.jianshu.com/p/5ce3b80ee000
sudo npm uninstall npm -g
sudo rm -rf /usr/local/lib/node /usr/local/lib/node_modules /var/db/receipts/org.nodejs.*
sudo rm -rf /usr/local/include/node /Users/$USER/.npm
sudo rm /usr/local/bin/node
sudo rm /usr/local/share/man/man1/node.1
sudo rm /usr/local/lib/dtrace/node.d

# uninstall via brew
brew uninstall node

# validate
node -v
# -bash: /usr/local/bin/node: No such file or directory
npm -v
# -bash: /usr/local/bin/npm: No such file or directory
