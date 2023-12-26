# get current user
user=$(whoami)

# Get root access
su -

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