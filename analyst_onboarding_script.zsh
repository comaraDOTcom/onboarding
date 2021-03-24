## Install homebrew
## Check if exists
command -v brew >/dev/null 2>&1 || { echo "Installing Homebrew.."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  } >&2;
echo "Homebrew successfully installed"

## install git
echo "Installing git.."
brew install git
echo "git successfully installed"

## install tldr https://tldr.sh/
echo "Installing tldr..."
brew install tldr
echo "tldr installed. "


## Get oh my zsh (plugins, themes for zsh).
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


## Fix zsh permissions
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions

## source file to get jump working
source ~/.zshrc

## install visual studio code
echo "Installing VS Code.."
brew cask install visual-studio-code
## this might ask you for your password
code --version
echo "VS Code successfully installed"

## install anaconda
echo "Installing anaconda.."
brew cask install anaconda
echo "export PATH=/usr/local/anaconda3/bin:"$PATH"" >> ~/.zshrc
echo "anaconda installed succesfully"


## install iterm2
echo "Installing iTerm2.."
cd ~/Downloads
curl https://iterm2.com/downloads/stable/iTerm2-3_3_9.zip > iTerm2.zip
unzip iTerm2.zip &> /dev/null
mv iTerm.app/ /Applications/iTerm.app
spctl --add /Applications/iTerm.app
rm -rf iTerm2.zip
echo "iTerm2 successfully installed.. Adding colors.."

cd ~/Downloads
mkdir -p ${HOME}/iterm2-colors
cd ${HOME}/iterm2-colors
curl https://github.com/mbadolato/iTerm2-Color-Schemes/zipball/master > iterm2-colors.zip
unzip iterm2-colors.zip
rm iterm2-colors.zip
echo "iTerm2 + Colors installed"

## create global gitignore
echo "Creating a global gitignore.."
git config --global core.excludesfile ~/.gitignore
touch ~/.gitignore
echo '.DS_Store' >> ~/.gitignore
echo '.idea' >> ~/.gitignore
echo "Global gitignore created"

echo "Onboarding script ran successfully"
