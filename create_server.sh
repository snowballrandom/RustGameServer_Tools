#!/bin/bash

declare serverIdent="default_server";
declare serverIP="0.0.0.0";
declare serverPort="28015";
declare serverTickrate="25";
declare serverHostname="My Rust Server";
declare serverDescription="A Rust Server for you!";
declare serverMaxplayers="50";
declare serverWorldsize="4500";
declare serverSeed="34000";
declare serverSaveinterval="600";
declare serverSecure="True";
declare serverEncryption="1";
declare serverWritecfg="1";
declare rconPassword="UmELZu6S";
declare rconWeb="1";
declare rconIP="0.0.0.0";
declare rconPort="28016";
declare rconPrint="True";
declare logfile=$PWD"/logfile_$(date +"%Y-%m-%d-%s").log";

printf "\n"
printf "\n"
echo "To use default values just press RETURN."
printf "\n"
printf "\n"

#Server Ident
echo "Default Server Identity: "$serverIdent
printf "Enter New Server Identity:"
read -e serverIdentInput

if [[ -n "$serverIdentInput" ]]; then
  serverIdent=$serverIdentInput
fi

printf "\n"

#Server IP
echo "Default Server IP is: "$serverIP
printf "Enter New Server IP:"
read -e serverIPInput

if [[ -n "$serverIPInput" ]]; then
  serverIP=$serverIPInput
fi

printf "\n"

#Server Port
echo "Default Server Port is: "$serverPort
printf "Enter New Server Port:" 
read -e serverPortInput
if [[ -n "$serverPortInput" ]]; then
  serverPort=$serverPortInput
fi

printf "\n"

#Server Tickrate
echo "Default Server Tick is: "$serverTickrate 
printf "Enter New Server Tick Rate:"
read -e serverTickrateInput
if [[ -n "$serverTickrateInput" ]]; then
  serverTickrate=$serverTickrateInput
fi

printf "\n"

#Server Hostname
echo "Default Hostname is: "$serverHostname
printf "Enter New Server Hostname:"
read -e serverHostnameInput
if [[ -n "$serverHostnameInput" ]]; then
  serverHostname=$serverHostnameInput
fi

printf "\n"

#Server Description
echo "Default Description is: "$serverDescription
printf "Enter New Server Description:"
read -e serverDescriptionInput
if [[ -n "$serverHostnameInput" ]]; then
  serverDescription=$serverDescriptionInput
fi

printf "\n"

#Server Maxplayers
echo "Default Max Players is: "$serverMaxplayers
printf "Enter New Max Players:"
read -e serverMaxplayersInput
if [[ -n "$serverMaxplayersInput" ]]; then
  serverMaxplayers=$serverMaxplayersInput
fi

printf "\n"

#Server Worldsize
echo "Default World Size is: "$serverWorldsize
printf "Enter New Worldsize:"
read -e serverWorldsizeInput
if [[ -n "$serverWorldsizeInput" ]]; then
  serverWorldsize=$serverWorldsizeInput
fi

printf "\n"

#Server ServerSeed
echo "Default Seed is: "$serverSeed
printf "Enter New Seed:"
read -e serverSeedInput
if [[ -n "$serverSeedInput" ]]; then
  serverSeed=$serverSeedInput
fi

printf "\n"

#Server Save Interval
echo "Default Save Interval: "$serverSaveinterval
printf "Enter New Save Interval:"
read -e serverSaveintervalInput
if [[ -n "$serverSaveintervalInput" ]]; then
  serverSaveinterval=$serverSaveintervalInput
fi

printf "\n"

#Server Secure
echo "Default Sever Secure: "$serverSecure
read -r -p "Server Secure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        serverSecure="True"
        ;;
    *)
		serverSecure="False"
        ;;
esac

printf "\n"

#Server Encryption
printf "Default Server Encrypted "
if [[ serverEncryption -eq "1" ]]; then echo TRUE; else echo FALSE; fi
read -r -p "Server Encryption? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        serverEncryption="1"
        ;;
    *)
		serverEncryption="0"
        ;;
esac

printf "\n"

#Server Write Config
printf "Default Write Config: "
if [[ serverWritecfg -eq "1" ]]; then echo TRUE; else echo FALSE; fi
read -r -p "Server Write Config? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        serverWritecfg="1"
        ;;
    *)
		serverWritecfg="0"
        ;;
esac

printf "\n"

#Server RCON Password
tmp_pass=`head -c 10 /dev/random | base64`
rconPassword="${tmp_pass:0:10}" #cut to 10 characters after base64 conversion
echo "Enter Server RCON Password:"
echo "Generated is: "$rconPassword
stty -echo
printf "Password: "
read PASSWORD
if [[ -n "$PASSWORD" ]]; then
  rconPassword=$PASSWORD
fi
stty echo

printf "\n"

#Server RCON Web
printf "Default Rcon Web: "
if [[ rconWeb -eq "1" ]]; then echo TRUE; else echo FALSE; fi
read -r -p "Server Rcon Web? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        rconWeb="1"
        ;;
    *)
		rconWeb="0"
        ;;
esac

#Server RCON IP
echo "Default Rcon IP is: "$rconIP
printf "Enter New Rcon IP:"
read -e rconIPInput

if [[ -n "$rconIPInput" ]]; then
  rconIP=$rconIPInput
fi

printf "\n"

#Server RCON Port
echo "Default Rcon Port is: "$rconPort
printf "Enter New Rcon Port:"
read -e rconPortInput

if [[ -n "$rconPortInput" ]]; then
  rconPort=$rconPortInput
fi

printf "\n"

#Server RCON Print
printf "Default Rcon Print: "
if [[ rconPrint -eq "True" ]]; then echo TRUE; else echo FALSE; fi
read -r -p "Server Rcon Print? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        rconPrint="True"
        ;;
    *)
		rconPrint="False"
        ;;
esac

printf "\n"

#Server Log File
echo "Default Log File: "$logfile
printf "Enter New Log File Name / location:"
read -e logfileInput

if [[ -n "$logfileInput" ]]; then
  logfile=$logfileInput
fi

printf "\n"
printf "\n"
printf "\n"
echo "##################"
echo "##### REPORT #####"
echo "##################"
printf "\n"
echo "Identity File: "$serverIdent
echo "Server IP: "$serverIP
echo "Server Port: "$serverPort
echo "TickRate: "$serverTickrate
echo "Hostname: "$serverHostname
echo "Description: "$serverDescription
echo "Max Players: "$serverMaxplayers
echo "WorldSize: "$serverWorldsize
echo "Seed: "$serverSeed
echo "Save Interval: "$serverSaveinterval
echo "Secure: "$serverSecure 
echo "Encrypted: "$serverEncryption
echo "Write Config: "$serverWritecfg
echo "Password: "$rconPassword
echo "Rcon Web: "$rconWeb
echo "Rcon IP: "$rconIP
echo "Rcon Port: "$rconPort
echo "Rcon Print: "$rconPrint
echo "Log File: "$logfile

printf "\n"
printf "\n"
printf "\n"
echo "########################"
echo "##### SAVE CONFIG #####"
echo "#######################"
printf "\n"
printf "\n"
printf "\n"

# Save Config
read -r -p "Write Config To File? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo "Saving Config...";
		echo "-batchmode +server.identity $serverIdent +server.ip $serverIP +server.port $serverPort +server.tickrate $serverTickrate +server.hostname $serverHostname +server.description $serverDescription +server.maxplayers $serverMaxplayers +server.worldsize $serverWorldsize +server.seed $serverSeed +server.saveinterval $serverSaveinterval +server.secure $serverSecure +server.encryption $serverEncryption +server.writecfg $serverWritecfg +rcon.password $rconPassword +rcon.web $rconWeb +rcon.ip $rconIP +rcon.port $rconPort +rcon.print rconPrint -logfile $logfile" > $PWD"/"server_$(date +"%Y-%m-%d-%s").config  
        ;;
    *)
		echo "Not Saving!"
        ;;
esac

printf "\n"
printf "\n"
printf "\n"
echo "########################"
echo "##### START SERVER #####"
echo "########################"
printf "\n"
printf "\n"
printf "\n"

# Start Server
read -r -p "Continue To Start Server? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
    read -r -p "Use Screen to start server? [y/N] " responsee
       echo "Starting server..."
		case "$responsee" in
		    [yY][eE][sS]|[yY]) 
		        echo "Using Screen..."
		        screen ./RustDedicated -batchmode +server.identity "$serverIdent" +server.ip $serverIP +server.port $serverPort +server.tickrate $serverTickrate +server.hostname "$serverHostname" +server.description "$serverDescription" +server.maxplayers $serverMaxplayers +server.worldsize $serverWorldsize +server.seed $serverSeed +server.saveinterval $serverSaveinterval +server.secure "$serverSecure" +server.encryption "$serverEncryption" +server.writecfg "$serverWritecfg" +rcon.password "$rconPassword" +rcon.web "$rconWeb" +rcon.ip "$rconIP" +rcon.port $rconPort +rcon.print rconPrint -logfile $logfile
		        ;;
		    *)
				echo "Not using screen..."
				screen ./RustDedicated -batchmode +server.identity "$serverIdent" +server.ip $serverIP +server.port $serverPort +server.tickrate $serverTickrate +server.hostname "$serverHostname" +server.description "$serverDescription" +server.maxplayers $serverMaxplayers +server.worldsize $serverWorldsize +server.seed $serverSeed +server.saveinterval $serverSaveinterval +server.secure "$serverSecure" +server.encryption "$serverEncryption" +server.writecfg "$serverWritecfg" +rcon.password "$rconPassword" +rcon.web "$rconWeb" +rcon.ip "$rconIP" +rcon.port $rconPort +rcon.print rconPrint -logfile $logfile
		        ;;
		esac 
        
        ;;
    *)
		echo "Not starting server..."
        ;;
esac

