#!/bin/bash
PROVISIONING_ROOT=$1
DOCS_ROOT=$2

# Update the system.
DEBIAN_FRONTEND=noninteractive apt-get -y update

# Install dev tools
DEBIAN_FRONTEND=noninteractive apt-get -y install vim zsh

# Add inputrc for bash history completion.
cp $PROVISIONING_ROOT/bash/.inputrc /home/vagrant/.inputrc
cp $PROVISIONING_ROOT/bash/.inputrc /root/.inputrc

# Common tools needed.
DEBIAN_FRONTEND=noninteractive apt-get -y install curl

# Required for getting php docs.
DEBIAN_FRONTEND=noninteractive apt-get -y install git svn
