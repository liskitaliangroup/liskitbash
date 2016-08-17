#!/bin/bash

#$1 command
#$2 type
#$3 link

# Installing a brand new version
install ()
{
    echo install
    echo $1
    echo $2
    echo $3
}

# Updating existing Lisk version
update ()
{
    echo update
    echo $1
    echo $2
    echo $3
    # echo Stopping Lisk...
    # cd lisk-$2
    # bash lisk.sh stop
    # cd ..
    # echo Deleting Lisk
    # rm -r lisk-$2
    # rm install installLisk.sh
    # echo Preparing system 4 Lisk upgrade
    # sudo apt-get --purge remove postgresql postgresql postgresql-client postgresql-client postgresql-client-common postgresql-common postgresql-contrib postgresql-contrib
    # rm -rf /var/lib/postgresql/
    # sudo rm -rf /var/log/postgresql/
    # sudo rm -rf /etc/postgresql/
    # echo Reinstalling Lisk
    # wget https://downloads.lisk.io/scripts/installLisk.sh
    # install()
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
