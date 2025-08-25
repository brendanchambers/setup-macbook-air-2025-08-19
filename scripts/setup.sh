# assume we are running from project top level
cd ..


# install uv
do_install_uv=true
if $do_install_uv; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi
# initialize new project
uv init


# create ssh key (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
pushd ~
ssh-keygen -t ed25519 -C "my-email@host.com"  # avoid uploading true email
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host github.com\n\tAddKeysToAgent yes\n\tUseKeychain yes\n\tIdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
# Host github.com
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_ed25519
ssh-add --apple-use-keychain ~/.ssh/id_ed25519


popd