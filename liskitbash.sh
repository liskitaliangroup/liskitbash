#!/bin/bash

install ()
{
    echo You runned install
}

# Updating existing Lisk version
update ()
{
    echo Updating Lisk
    echo Stopping Lisk...
    cd lisk-$2
    bash lisk.sh stop
    cd ..
    echo Deleting Lisk
    rm -r lisk-$2
    rm install installLisk.sh
    echo Preparing system 4 Lisk upgrade
    sudo apt-get --purge remove postgresql postgresql postgresql-client postgresql-client postgresql-client-common postgresql-common postgresql-contrib postgresql-contrib
    rm -rf /var/lib/postgresql/
    sudo rm -rf /var/log/postgresql/
    sudo rm -rf /etc/postgresql/
    echo Reinstalling Lisk
    wget https://downloads.lisk.io/scripts/installLisk.sh
    bash installLisk.sh install -r $2
}

# Checking Options
case $1 in
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
