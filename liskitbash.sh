#!/bin/bash

#############################################################
# LISK INSTALLATION AND UPDATE SCRIPT WRAPPER               #
# BY: andreafspeziale                                       #
# DATE: 18/08/2016                                          #
#                                                           #
# SYNTAX: bash liskitbash COMMAND NETWORK_TYPE              #
#                                                           #
# COMMANDS                                                  #
#   - install                                               #
#   - update                                                #
#                                                           #
# OPTION                                                    #
#   - main                                                  #
#   - test                                                  #
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
    wget https://downloads.lisk.io/scripts/installLisk.sh
    echo -e ${GREEN}Running Lisk binary install script...${NC}
    bash installLisk.sh install -r $NETWORK
    rm installLisk.sh
    echo -e ${GREEN}Lisk sould be installed...${NC}
}

# Updating Existing Lisk Version
update ()
{
    echo -e ${GREEN}Updating Lisk and stopping current installation...${NC}
    cd lisk-$NETWORK
    bash lisk.sh stop
    cd ..
    echo -e ${GREEN}Deleting Lisk installation folder...${NC}
    rm -r lisk-$NETWORK
    echo -e ${GREEN}Preparing system 4 Lisk upgrade...${NC}
    sudo apt-get --purge remove postgresql postgresql postgresql-client postgresql-client postgresql-client-common postgresql-common postgresql-contrib postgresql-contrib
    rm -rf /var/lib/postgresql/
    rm -rf /var/log/postgresql/
    rm -rf /etc/postgresql/
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
