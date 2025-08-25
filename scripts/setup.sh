# assume we are running from project top level
cd ..


# install uv
do_install_uv=true
if $do_install_uv; then

    curl -LsSf https://astral.sh/uv/install.sh | sh

fi

# initialize project
uv init
