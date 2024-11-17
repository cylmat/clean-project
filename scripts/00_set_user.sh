#!/usr/bin/env bash


addgroup user --gid 1000
adduser user --uid 1000 --gid 1000 --gecos GECOS --disabled-password
su user

whoami


# USER
# su chown 1000:1000 -R /var/www
# su chown 1000:1000 -R /usr/local/scripts
# su chown 1000:1000 -R /usr/local/.recipes


## run sudo as user
# usermod -aG sudo dev
# e.g. sudo usermod -aG editorial user

# echo 'root:root' | chpasswd
# or
# echo 'root' | passwd --stdin root 
