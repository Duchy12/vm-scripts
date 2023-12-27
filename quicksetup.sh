# Get current user
user=$(whoami)

# Elevate privileges
echo "Elevating privileges..."
sudo -s

# permanently add sbin to path
echo "export PATH=$PATH:/usr/sbin" >> ~/.bashrc

# Update the system
echo "Updating the system..."
apt update && apt upgrade -y

# Install the required packages
echo "Installing sudo, ufw, openssh-server and screen"
apt install -y sudo ufw openssh-server screen

# Start ssh service
echo "Starting SSH service..."
systemctl start ssh
systemctl enable ssh

# Add user to sudo group
echo "Adding $user to sudo group..."
usermod -aG sudo $user

# Enable firewall
echo "Enabling firewall..."
ufw enable

# Allow SSH
echo "Allowing SSH..."
ufw allow 22

su $user
echo "Done!"