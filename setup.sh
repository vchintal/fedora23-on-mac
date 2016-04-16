# Do a full update post installation
sudo dnf -y update 

# Install the GUI Workstation
sudo dnf -y group install "Fedora Workstation"

# Set the GUI environment as the default 
sudo systemctl set-default graphical.target

# Install RPM Fusion Repos
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-23.noarch.rpm
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-23.noarch.rpm


# Add thermald repo
sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/hadrons123/thermald/repo/fedora-23/hadrons123-thermald-fedora-23.repo
sudo dnf -y copr enable hadrons123/thermald
sudo systemctl enable thermald
sudo systemctl start thermald

# Install misc utilities
sudo dnf -y install vlc \
                    pigdin \
                    unzip youtube-dl \
                    gimp \
                    vim \
                    java-openjdk \
                    oathtool \
                    xclip \
                    powertop \
                    
# Setup Powertop service 
cat << EOF | sudo tee /usr/lib/systemd/system/powertop.service
[Unit]
Description=PowerTOP auto tune

[Service]
Type=idle
Environment="TERM=dumb"
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF
sudo ln -s /usr/lib/systemd/system/powertop.service /etc/systemd/system/powertop.service
sudo systemctl daemon-reload
sudo systemctl enable powertop.service
sudo systemctl start powertop.service

# Install Slack
sudo rpm -ivh https://downloads.slack-edge.com/linux_releases/slack-2.0.3-0.1.fc21.x86_64.rpm

