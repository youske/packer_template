# Set up Vagrant.

date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
useradd -G sudo -p $(perl -e'print crypt("vagrant", "vagrant")') -m -s /bin/bash -N vagrant

# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Install root keys
mkdir -pm 700 /root/.ssh
curl -Lo /root/.ssh/authorized_keys \
  'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /root/.ssh/authorized_keys
chown -R root:root /root/.ssh

# Customize the message of the day
BUILDDATE=`cat /etc/vagrant_box_build_time`
echo "Welcome to your Vagrant-built virtual machine. (Build:${BUILDDATE})" > /var/run/motd
