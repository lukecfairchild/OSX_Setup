
# Install xcode & Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null

# Install wget
brew install wget

# Install node
brew install node 


# Install Chrome
wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
hdiutil attach ./googlechrome.dmg
sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
hdiutil detach /Volumes/Google\ Chrome
rm googlechrome.dmg
open -a "Google Chrome" "https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd?hl=en-US"
read -n 1 -s -r -p "Press any key to continue"
echo 'Chrome Install Complete'



# Install Sublime Text
printf "
console.log('[sublime.js] Loading..')

const JSDOM      = require('jsdom')
const HTTPS      = require('https')
const FileSystem = require('fs')

console.log('[sublime.js] Getting download URL')
HTTPS.get('https://www.sublimetext.com/3', (pageResponse) => {
        let data = ''
        pageResponse.on('data', (chunk) => {
                data += chunk
        })
        pageResponse.on('end', () => {
                const DOM = new JSDOM.JSDOM(data)
                const filePath = DOM.window.document.querySelector('#dl_osx a').href
                console.log('[sublime.js] URL retrieved')
                const sublimeDmgFile = FileSystem.createWriteStream('sublime.dmg')
                console.log('[sublime.js] Downloading sublime.dmg')
                HTTPS.get(filePath, (fileResponse) => {
                        fileResponse.pipe(sublimeDmgFile)
                })
        })
}).on('error', (error) => {
        console.error(error)
})
" > sublime.js
npm install --save jsdom
node sublime.js
rm sublime.js
rm package-lock.json
rm -rf node_modules
hdiutil attach ./sublime.dmg
sudo cp -r /Volumes/Sublime\ Text/Sublime\ Text.app /Applications/
hdiutil detach /Volumes/Sublime\ Text
rm sublime.dmg
sudo wget -P /Users/lukef/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages https://packagecontrol.io/Package%20Control.sublime-package
echo 'Sublime Install Complete'


# Install Discord
wget https://dl.discordapp.net/apps/osx/0.0.251/Discord.dmg
hdiutil attach ./Discord.dmg
sudo cp -r /Volumes/Discord/Discord.app /Applications/
hdiutil detach /Volumes/Discord
rm Discord.dmg
echo 'Discord Install Complete'


# Install Docker
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
echo "Docker Install Complete"


# Install Hyperdock
wget https://bahoom.com/hyperdock/HyperDock.dmg
hdiutil attach ./Hyperdock.dmg
open /Volumes/Hyperdock/HyperDock.prefpane
hdiutil detach /Volumes/Hyperdock
rm Hyperdock.dmg
read -n 1 -s -r -p "Press any key to continue"
echo 'Hyperdock Install Complete'


# Install Hyperdock
wget https://pilotmoon.com/downloads/ScrollReverser-1.7.6.zip
unzip -a ScrollReverser-1.7.6.zip
rm ScrollReverser-1.7.6.zip
mv Scroll\ Reverser.app/ /Applications/
open /Applications/Scroll\ Reverser.app
read -n 1 -s -r -p "Press any key to continue"
open /Applications/Scroll\ Reverser.app
echo 'Scroll Reverser Install Complete'


# Install Karabiner
wget https://pqrs.org/osx/karabiner/files/Karabiner-Elements-12.1.0.dmg
hdiutil attach ./Karabiner-Elements-12.1.0.dmg
open /Volumes/Karabiner-Elements-12.1.0/Karabiner-Elements.sparkle_guided.pkg
hdiutil detach /Volumes/Karabiner-Elements-12.1.0
rm Karabiner-Elements-12.1.0.dmg
open /Applications/Karabiner-Elements.app
open -a "Google Chrome" "https://pqrs.org/osx/karabiner/complex_modifications/#pc_shortcuts"
read -n 1 -s -r -p "Press any key to continue"
echo 'Karabiner Install Complete'


# Install Slack
wget https://downloads.slack-edge.com/mac_releases/Slack-3.3.3.dmg
hdiutil attach ./Slack-3.3.3.dmg
cp -r /Volumes/Slack.app/Slack.app /Applications/Slack.app
hdiutil detach /Volumes/Slack.app
rm Slack-3.3.3.dmg
echo 'Slack Install Complete'


# Install iTerm2
brew castk install iterm2

wget https://iterm2.com/downloads/stable/iTerm2-3_2_5.zip
unzip -a iTerm2-3_2_5.zip
rm iTerm2-3_2_5.zip
mv iTerm.app /Applications/iTerm.app
open /Applications/iTerm.app


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf '
Please set the following in iTerm2:
iTerm2 > Preferences... > Profiles > Command > Command: /bin/zsh
'
read -n 1 -s -r -p "Press any key to continue"


# Fix already installed commands in zsh
echo 'export PATH="$HOME/bin:/usr/local/bin:$PATH"' >> ~/.zshrc


# Fix subl command
rm -rf /usr/local/bin/subl
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin


# Generate SSH key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
# Copy key to clipboard
pbcopy < ~/.ssh/id_rsa.pub
# Open ssh key page
open -a "Google Chrome" "https://github.com/settings/ssh/new"
echo 'Paste your ssh-key into github'
read -n 1 -s -r -p "Press any key to continue"

