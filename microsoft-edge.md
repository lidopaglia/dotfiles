
# Install Microsoft Edge on Linux

Debian instructions via [linuxcapable.com][1].

## Debian 11 Bullseye

```
# Update Debian
sudo apt update && sudo apt upgrade -y

# Install Required Packages
sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2 ubuntu-keyring -y

# Import the Microsoft Edge GPG Key
sudo wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-edge.gpg

# Import the Microsoft Edge Repo
echo 'deb [signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' | sudo tee /etc/apt/sources.list.d/microsoft-edge.list

# Refresh the Repository List
sudo apt update

# Install Microsoft Edge Stable
sudo apt install microsoft-edge-stable -y

```

# Remove Microsoft Edge on Linux

## Debian 11 Bullseye

```
# Remove Edge Stable
sudo apt autoremove microsoft-edge-stable --purge

# Remove the Repository
sudo rm /etc/apt/sources.list.d/microsoft-edge.list

# Remove the GPG key
sudo rm /usr/share/keyrings/microsoft*
```


[1]: https://www.linuxcapable.com/how-to-install-microsoft-edge-on-debian-11/
