echo "Installing XCode command line tools..."
xcode-select --install

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask-cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

echo "Installing tools..."
brew install git
brew install neovim
brew install ack
brew install zsh zsh-completions
brew install tealdeer
brew install exa

echo "Installing fonts..."
brew cask install font-fira-mono
brew cask install font-roboto

echo "Installing apps..."
brew cask install 1password
brew cask install telegram
brew cask install notion
brew cask install spotify

brew cask install google-chrome
brew cask install firefox
brew cask install microsoft-edge

brew cask install alacritty
echo "Alacritty installed - check Github on how to finish setup"

brew cask install visual-studio-code
brew cask install docker
brew cask install dash
brew cask install postman

brew cask install daisydisk
brew cask install avast-security
brew cask install google-backup-and-sync
brew cask install bartender
brew cask install istat-menus
brew cask install oversight
brew cask install alfred
brew cask install smoothscroll

brew cask install slack
brew cask install fantastical
brew cask install zoom

brew cask install figma
brew cask install skitch
brew cask install kap

brew cask install calibre
brew cask install musescore

echo "Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

echo "Installing rustup/cargo/rust..."
curl https://sh.rustup.rs -sSf | sh

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Done! Apps to install manually: clocker, magnet, bear, todoist"
