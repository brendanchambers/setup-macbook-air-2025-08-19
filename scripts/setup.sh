# install uv
# assume wd == <project_top_level_dir>
bash scripts/info.sh
source config/.secret

do_install_uv=true
if $do_install_uv; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi
# initialize new project
uv init

# configure git identity
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL

# create ssh key for github (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
pushd ~  #
ssh-keygen -t ed25519 -C $GIT_EMAIL  # avoid uploading true email
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host github.com\n\tAddKeysToAgent yes\n\tUseKeychain yes\n\tIdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
# Host github.com
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_ed25519
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
popd

# turn off the doublespace insert period annoying setting manually via settings widget
# try to do this programatically (todo test, I don't think this is quite right)
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # todo test this. for now I toggled via settings menu
# sudo reboot  # todo untested, just a rough sketch

# homebrew (package manager)
#  https://docs.brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#  also seems to be installing xcode cli tools, great

# azure cli (manage azure cloud vms)
brew update && brew install azure-cli
az login # <--  manual authentication step
