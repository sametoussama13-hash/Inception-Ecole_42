# Inception-Ecole_42
Projet d'étude

## Install VM sur Debian:

## Apt:

install apt and upgrade:
```bash
apt update
apt upgrade
```
## Sudo:

### install sudo sur le root:

Command to install sudo:
```bash
apt install sudo
```
### Ajouter le user dans un group sudo:

Command to add user on the group sudo :
```bash
usermod -aG sudo <user>
```

## Ssh

### install ssh

Command for install ssh:
```bash
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh
```
You need to resart the VM:
```bash
exit
```
### Config ssh

to config ssh of the VM put this command:
```bash
sudo nano /etc/ssh/sshd_config
```
Put this on the file sshd_config:
```nano
port: 22
```
## Docker

### isntall docker

command to install docker:
```bash
sudo apt install docker.io
```
### install docker compose:

command to install docker-compose :
```bash
sudo apt docker-compose
```

### Author Docker:

command for authorize docker to lunch without sudo for login :
```bash
sudo usermod -aG docker <login>
```

### Display docker list

command to diplay docker installed:
```bash
docker ps -a 
```

command to diplay docker run:
```bash
docker ps 
```

### Remove container

command to remove docker:
```bash
docker rm <id-container> 
```

### Remove image

To remove image you need to remove container:

```bash
docker rmi <name-image> 
```






## Change language

command for change laguage of keyboard:
```bash
sudo dpkg-reconfigure keyboard-configuration
```
