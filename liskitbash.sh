#!/bin/bash

#############################################################
# Lisk Installation and update Script                       #
# by: andreafspeziale                                       #
# Date: 18/08/2016                                          #
# $1 command                                                #
# $2 network type                                           #
# $3 link - not used yet                                    #
#############################################################

# Commands
COMMAND=$1
NETWORK=$2

# Colours
GREEN='\033[0;32m'
NC='\033[0m'

# Installing a brand new version
install ()
{
    echo -e ${GREEN}Downloading Lisk binary install script...${NC}
    wget https://downloads.lisk.io/scripts/installLisk.sh
    echo -e ${GREEN}Running Lisk binary install script...${NC}
    bash installLisk.sh install -r $NETWORK
    echo ${GREEN}Lisk sould be installed...${NC}
}

# Updating existing Lisk version
update ()
{
    echo Stopping Lisk...
    cd lisk-$NETWORK
    bash lisk.sh stop
    cd ..
    echo Deleting Lisk
    rm -r lisk-$NETWORK
    rm install installLisk.sh
    echo Preparing system 4 Lisk upgrade
    sudo apt-get --purge remove postgresql postgresql postgresql-client postgresql-client postgresql-client-common postgresql-common postgresql-contrib postgresql-contrib
    rm -rf /var/lib/postgresql/
    rm -rf /var/log/postgresql/
    rm -rf /etc/postgresql/
    echo Reinstalling Lisk
    install
}

# Checking Options
case $COMMAND in
"install")
  install
  ;;
"update")
  update
  ;;
*)
    echo "Error: Unrecognized command."
    echo ""
    echo "Available commands are: "
    echo ""
    echo "1) install main/testnet link"
    echo ""
    echo "2) update main/testnet link"
esac
