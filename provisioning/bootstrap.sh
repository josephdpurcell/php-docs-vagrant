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
DEBIAN_FRONTEND=noninteractive apt-get -y install git-core subversion git-svn

# Download php docs.
cd $DOCS_ROOT
GIT_SSL_NO_VERIFY=true git svn clone https://svn.php.net/repository/phpdoc/modules/doc-en doc-en
# Note: alternatively, you could store the PEM file: (this is option untested)
# openssl s_client -showcerts -connect svn.php.net:443 </dev/null 2>/dev/null|openssl x509 -outform PEM > svn.php.net.pem
# GIT_SSL_CAINFO=svn.php.net.pem git svn clone https://svn.php.net/repository/phpdoc/modules/doc-en doc-en

