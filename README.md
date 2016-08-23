#Liskit Bash
This is a very simple script that wrap the official Lisk installation script.
It helps me to update or install a brand new Lisk client on my machines.

There is a description also on the top of the script ;)

Use it in the same folder of the lisk-main or test folder
For instance
--/something
            |-- liskitbash.sh
            |-- /lisk-test

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

    - code improvements (use defaults for wget url)
    - add a command to just uninstall everything
    - check for some progress bar and do not print anything else

##Troubleshooting
Lisk installation guide suggests the following LOCAL options:

    - export LC_ALL=en_US.UTF-8
    - export LANG=en_US.UTF-8
    - export LANGUAGE=en_US.UTF-8
