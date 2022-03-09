#!/bin/bash
printf "Enter the config file name to run."
printf "\n"
read -e serverConfig
value=$(<"$serverConfig")
screen ./RustDedicated "$value"
