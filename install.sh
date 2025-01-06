sudo apt-get --yes update
sudo apt-get --yes upgrade
sudo apt-get --yes install git
sudo apt-get --yes install software-properties-common
sudo apt-get --yes install fzf
sudo apt-get --yes install ninja-build
sudo apt-get --yes install build-essential
sudo apt-get --yes install 'python3-pylsp*'
sudo apt --yes install gcc-10 gcc-10-base gcc-10-doc g++-10
sudo apt --yes install libstdc++-10-dev libstdc++-10-doc

mkdir -p ~/thirdparty
pushd  ~/thirdparty
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
./make.sh
sudo ln -s ~/thirdparty/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
popd

sudo apt --yes install snapd
sudo snap install bash-language-server --classic
sudo snap install go --classic
go install golang.org/x/tools/gopls@latest

sudo snap install --beta nvim --classic
