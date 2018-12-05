
# Install xcode
xcode-select --install
read -n 1 -s -r -p "Press any key to continue"


# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Configure GIT
git config --global user.email "lukecfairchild@gmail.com"
git config --global user.name "Luke Fairchild"
git config --global core.editor "vim"


# Install wget
brew install wget


# Install node
brew install node 


# Install Chrome
wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
hdiutil attach ./googlechrome.dmg
cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
hdiutil detach /Volumes/Google\ Chrome
rm googlechrome.dmg
open -W -a "Google Chrome" --args --make-default-browser
open -W -a "Google Chrome" --args --make-default-browser
echo 'Chrome Install Complete'


# Install LastPass
wget https://download.cloud.lastpass.com/mac/lpmacosx.zip
unzip -a lpmacosx.zip
rm ./lpmacosx.zip
open -W ./LastPass\ Installer/LastPass\ Installer.app
rm -rf ./LastPass\ Installer ./__MACOSX
echo "Please login to last pass."
open -W -a "Google Chrome"
read -n 1 -s -r -p "Press any key to continue"
echo 'LastPass Install Complete'


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
cp -r /Volumes/Sublime\ Text/Sublime\ Text.app /Applications/
hdiutil detach /Volumes/Sublime\ Text
rm sublime.dmg

# Ensure Sublime folder exists
mkdir ~/Library/Application\ Support/Sublime\ Text\ 3/
mkdir ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
mkdir ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
mkdir ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

# Install Package Control
wget -P $HOME/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages https://packagecontrol.io/Package%20Control.sublime-package

# Install "A File Icon"
git clone git@github.com:ihodev/a-file-icon.git
mv a-file-icon ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/A\ File\ Icon

# Install "One Dark Color Scheme"
wget -P $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/ https://raw.githubusercontent.com/IceTimux/one-dark-sublime-text-3-color-scheme/master/One%20Dark.tmTheme

# Install "AlignTab"
git clone git@github.com:randy3k/AlignTab.git
mv AlignTab $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/AlignTab

# Install "BracketHighlighter"
git clone git@github.com:facelessuser/BracketHighlighter.git
mv BracketHighlighter $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/BracketHighlighter

# Install "GitGutter"
git clone git@github.com:jisaacks/GitGutter.git
mv GitGutter $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/GitGutter

# Install "Dockerfile Syntax Highlighting"
git clone git@github.com:asbjornenge/Docker.tmbundle.git
mv Docker.tmbundle $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/Docker\ Syntax\ Highlighting

# Install "Unicode Character Highlighter"
git clone git@github.com:possan/sublime_unicode_nbsp.git
mv sublime_unicode_nbsp $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/Unicode\ Character\ Highlighter

# Install "SideBarEnhancements"
git clone git@github.com:SideBarEnhancements-org/SideBarEnhancements.git
mv SideBarEnhancements $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/SideBarEnhancements

# Install "BracketGuard"
git clone git@github.com:philippotto/Sublime-BracketGuard.git
mv Sublime-BracketGuard $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/BracketGuard

# Install "Commandhelper"
wget -P $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/ https://letsbuild.net/jenkins/job/Methodscript%20Syntax%20-%20Sublime/lastSuccessfulBuild/artifact/Commandhelper.tmLanguage

# Copy Settings
printf '
{
        "auto_complete_commit_on_tab": true,
        "auto_match_enabled": false,
        "color_scheme": "Packages/User/One Dark.tmTheme",
        "font_size": 11,
        "highlight_line": true,
        "ignored_packages":
        [
                "0_package_control_loader",
                "Vintage"
        ],
        "show_full_path": true,
        "theme": "Adaptive.sublime-theme"
}
' > ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

# Copy Hotkeys
printf '
[
        {"keys": ["ctrl+d"], "command": "duplicate_line"},
        {"keys": ["ctrl+h"], "command": "show_panel", "args": {"panel": "replace", "in_selection": false}},
        {"keys": ["command+shift+/"], "command": "toggle_comment", "args": {"block": true}},
        {"keys": ["option+shift+/"], "command": "toggle_comment", "args": {"block": true}}
]
' > $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap

# Fix subl command
rm -rf /usr/local/bin/subl
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin

echo 'Sublime Install Complete'


# Install Discord
wget https://dl.discordapp.net/apps/osx/0.0.251/Discord.dmg
hdiutil attach ./Discord.dmg
cp -r /Volumes/Discord/Discord.app /Applications/
hdiutil detach /Volumes/Discord
rm Discord.dmg
echo 'Discord Install Complete'


# Install Docker
wget https://download.docker.com/mac/stable/Docker.dmg
hdiutil attach ./Docker.dmg
cp -r /Volumes/Docker/Docker.app /Applications/
open -a /Applications/Docker.app
hdiutil detach /Volumes/Docker
rm Docker.dmg
echo "Docker Install Complete"


# Install Hyperdock
wget https://bahoom.com/hyperdock/HyperDock.dmg
hdiutil attach ./Hyperdock.dmg
open /Volumes/Hyperdock/HyperDock.prefpane
read -n 1 -s -r -p "Press any key to continue"
hdiutil detach /Volumes/Hyperdock
rm Hyperdock.dmg
echo 'Hyperdock Install Complete'


# Install ScrollReverser
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
open -W /Volumes/Karabiner-Elements-12.1.0/Karabiner-Elements.sparkle_guided.pkg
read -n 1 -s -r -p "Press any key to continue"
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
wget https://iterm2.com/downloads/stable/iTerm2-3_2_5.zip
unzip -a iTerm2-3_2_5.zip
rm iTerm2-3_2_5.zip
mv iTerm.app /Applications/iTerm.app
open /Applications/iTerm.app


#Install Postman
wget -O postman.zip https://dl.pstmn.io/download/latest/osx
unzip -a postman.zip
mv Postman.app /Applications/Postman.app
rm postman.zip


# Generate SSH key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
# Copy key to clipboard
pbcopy < ~/.ssh/id_rsa.pub
# Open ssh key page
open -a "Google Chrome" "https://github.com/settings/ssh/new"
echo 'Paste your ssh-key into github'
read -n 1 -s -r -p "Press any key to continue"


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

