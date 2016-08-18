#Liskit Bash
This is a very simple script that wrap the official Lisk installation script.
It helps me to update or install a brand new Lisk client on my machines.

##Functions
The script actually accepts two commands

####Install
Installs a very new version of Lisk client passing the type and curl url for the download

For instance

    - bash liskitbash.sh install test https://downloads.lisk.io/scripts/installLisk.sh

####Update
Updates an existing version of Lisk client passing the type and curl url for the download

For instance

    - bash liskitbash.sh install test https://downloads.lisk.io/scripts/installLisk.sh

##ToDo
This is a working progress I will improve it over time :)

    - code improvements (absolute/relative paths || use install func inside update || use defaults for wget url)
    - test it actually :D
