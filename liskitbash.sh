#!/bin/bash

#############################################################
# Lisk Installation and Update Script Wrapper               #
# by: andreafspeziale                                       #
# Date: 18/08/2016                                          #
# $1 command                                                #
# $2 network type                                           #
# $3 link - not used yet                                    #
#############################################################

# Options
COMMAND=$1
NETWORK=$2

# Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Installing a brand new version
install ()
{
    echo -e ${GREEN}Downloading Lisk binary install script...${NC}
    # wget https://downloads.lisk.io/scripts/installLisk.sh
    # echo -e ${GREEN}Running Lisk binary install script...${NC}
    # bash installLisk.sh install -r $NETWORK
    # rm installLisk.sh
    # echo ${GREEN}Lisk sould be installed...${NC}
}

# Updating Existing Lisk Version
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

# Checking Input Command
check_command()
{
    case $COMMAND in
        "install")
        check_option
        #install
        ;;
        "update")
        check_option
        #update
        ;;
        *)
        echo ""
        echo -e ${RED}Error: Unrecognized Command.${NC}
        echo Available commands are:
        echo ""
        echo -e 1 "|" $ bash liskitbash.sh ${GREEN}install${NC} main/testnet
        echo -e 2 "|" $ bash liskitbash.sh ${GREEN}update${NC} main/testnet
        echo ""
    esac
}

# Checking Input Option
check_option()
{
    case $NETWORK in
        "main")
        $COMMAND
        ;;
        "test")
        $COMMAND
        ;;
        *)
        echo ""
        echo -e ${RED}Error: Unrecognized Network Type.${NC}
        echo "Available commands are: "
        echo ""
        echo -e 1 "|" $ bash liskitbash.sh install/update ${GREEN}main${NC}
        echo -e 2 "|" $ bash liskitbash.sh install/update ${GREEN}test${NC}
        echo ""
    esac
}

# Run
check_command
