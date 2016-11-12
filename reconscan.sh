#!/bin/bash
# clearing the screen before execution
clear
echo
echo -e "\e[1;34m$(date)\e[0m" # Display date [ 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan]
echo
echo
# Here goes the branding
echo "[---------------------------------------]"
echo -e [---------"\e[1;33mAuthor:\e[0m""\e[1;32mG0tD4un1k\e[0m" -------------]
echo -e [---------"\e[1;36mR E C O N - S C A N\e[0m"-----------]
echo -e [-------"\e[1;35mPowered by nmap & bash\e[0m"----------]
echo "[-----pentestknight.blogspot.com.au-----]"
echo "[----------------[V0.1]-----------------]"
echo "[---------------------------------------]"
echo
echo
# create a directory to store the results
mkdir -p /$(whoami)/reconscan
touch /$(whoami)/reconscan/target_list.txt
# Collect user input
read -p "Enter an IP / hostname to scan : " tip
echo
echo
if [ -z $tip ]; then
echo
echo
echo -e "\e[1;31mNo Input provided "[Aborting...Restart the program and provide input]"\e[0m"
else
echo -e "[+]" Using "\e[1;36;4m"$tip"\e[0m" as target For RECON SCAN
echo >> "/$(whoami)/reconscan/target_list.txt"
echo "[+]" "[---------------------New Scan------------------]" >> "/$(whoami)/reconscan/target_list.txt"
date >> "/$(whoami)/reconscan/target_list.txt"
echo "The selected target: " $tip >> "/$(whoami)/reconscan/target_list.txt"
echo
fi
echo
echo
PS3='Select the scan type: '
options=("Regular Scan" "Quick Scan" "Intense Scan" "All TCP ports" "Slow & Comprehensive scan" "Top ports" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Regular Scan")
            echo 
	    echo -e "[==>]" "\e[34mThis will perform a regular nmap scan with predetermined parameters.\e[0m"
	    echo
            read -p "Press enter to continue"
            echo "Please wait...scan in progree and may take some time"
            echo >> "/$(whoami)/reconscan/nmap_regularscan.txt"
            echo >> "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_regularscan.txt"
            date >> "/$(whoami)/reconscan/nmap_regularscan.txt" 
            nmap -Pn $tip >> "/$(whoami)/reconscan/nmap_regularscan.txt"
            echo "Scan complete - Check results"
            echo
            echo
            ;;
        "Quick Scan")
            echo "you chose choice 2"
	    nmap -T4 -F $tip > nmap_quickscanresults.txt
            ;;
        "Intense Scan")
            echo "you chose choice 3"
	    nmap -T4 -v -A $tip > nmap_intensescanresults.txt
            ;;
	"All TCP ports")
	    echo "you chose choice 4"
	    nmap -Pn -p- -v -A -T4 $tip > nmap_alltcpportsscanresults.txt
	    ;;
	"Slow & Comprehensive scan")
	    echo "you chose choice 5"
	    nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $tip > nmap_slowcomprehensivescanresults.txt
	    ;;
	"Top ports")
	    echo "you chose choice 6"
	    nmap -Pn -T4 -v -A --top-ports $tip > nmap_topportscanresults.txt
	    ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
