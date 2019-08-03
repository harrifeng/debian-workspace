echo "<----------start provision--------------->"

echo "
deb http://mirrors.aliyun.com/debian buster main contrib non-free
deb http://mirrors.aliyun.com/debian buster-proposed-updates main contrib non-free
deb http://mirrors.aliyun.com/debian buster-updates main contrib non-free
deb http://mirrors.aliyun.com/debian-security/ buster/updates main non-free contrib
" | sudo tee /etc/apt/sources.list

sudo apt update
sudo apt install -y emacs git silversearcher-ag lrzsz python3-pip python3-distutils tmux speedometer pipenv htop zsh

pip3 install -U ansible -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com


mkdir -p /home/vagrant/github
DOT_FILES='/home/vagrant/github/dotfiles'
if [ ! -d "$DOT_FILES" ]; then
    git clone https://github.com/harrifeng/dotfiles.git ${DOT_FILES}
    bash ${DOT_FILES}/run.sh
fi

chown -R vagrant:vagrant /home/vagrant/github

echo "<----------finish provision--------------->"