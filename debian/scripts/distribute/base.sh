# Update the box
cat << EOF > /etc/apt/sources.list

deb http://ftp.jp.debian.org/debian jessie main contrib non-free
deb-src http://ftp.jp.debian.org/debian jessie main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free

EOF
# update install
apt-get -y update
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get -y install lv curl gawk unzip
apt-get -y install memstat ntpdate
apt-get -y install ansible

# Set up sudo
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub
