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
options=("Regular Scan" "Quick Scan" "Intense Scan" "All TCP ports" "Slow & Comprehensive scan" "Top ports" "Specific Ports" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Regular Scan")
            echo 
	    echo -e "[==>]" "\e[34mThis will perform a 'regular' nmap scan with predetermined parameters.\e[0m"
	    echo
            read -p "Press enter to continue"
            echo "Please wait...scan in progress and may take some time"
            echo >> "/$(whoami)/reconscan/nmap_regularscan.txt"
            echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_regularscan.txt"
            date >> "/$(whoami)/reconscan/nmap_regularscan.txt" 
            nmap -Pn $tip >> "/$(whoami)/reconscan/nmap_regularscan.txt"
            echo "Scan complete - Check results"
            echo
            echo
            ;;
        "Quick Scan")
            echo 
	    echo -e "[==>]" "\e[34mThis will perform a 'quick' nmap scan with predetermined parameters.\e[0m"
	    echo
            read -p "Press enter to continue"
            echo "Please wait...scan in progress and may take some time...should be quick though :)"
            echo >> "/$(whoami)/reconscan/nmap_quickscan.txt"
            echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_quickscan.txt"
            date >> "/$(whoami)/reconscan/nmap_quickscan.txt" 
	    nmap -Pn -T4 -F $tip >> "/$(whoami)/reconscan/nmap_quickscan.txt" 
	    echo "Scan complete - Check results"
            echo
            echo
            ;;
        "Intense Scan")
            echo 
	    echo -e "[==>]" "\e[34mThis will perform an 'intense' nmap scan with predetermined parameters.\e[0m"
	    echo
            read -p "Press enter to continue"
            echo "Please wait...scan in progress and may take some time....."
            echo >> "/$(whoami)/reconscan/nmap_intensescan.txt"
            echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_intensescan.txt"
            date >> "/$(whoami)/reconscan/nmap_intensescan.txt" 
	    nmap -Pn -T4 -v -A $tip >> "/$(whoami)/reconscan/nmap_intensescan.txt"
	    echo "Scan complete - Check results"
            echo
            echo
            ;;
	"All TCP ports")
	    echo 
	    echo -e "[==>]" "\e[34mThis will perform an nmap scan on 'all TCP ports' with predetermined parameters.\e[0m"
	    echo
            read -p "Press enter to continue"
            echo "Please wait...scan in progress and may take some time....."
            echo >> "/$(whoami)/reconscan/nmap_allTCPportsscan.txt"
            echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_allTCPportsscan.txt"
            date >> "/$(whoami)/reconscan/nmap_allTCPportsscan.txt" 
	    nmap -Pn -p- -v -A -T4 $tip >> "/$(whoami)/reconscan/nmap_allTCPportsscan.txt"
	    echo "Scan complete - Check results"
            echo
            echo
	    ;;
	"Slow & Comprehensive scan")
	    echo 
	    echo -e "[==>]" "\e[34mThis will perform a 'Slow & Comprehensive' nmap scan with predetermined parameters.\e[0m"
	    echo
            read -p "Press enter to continue"
            echo "Please wait...scan in progress and may take some time....."
            echo >> "/$(whoami)/reconscan/nmap_comprehensivescan.txt"
            echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_comprehensivescan.txt"
            date >> "/$(whoami)/reconscan/nmap_comprehensivescan.txt" 
	    nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $tip >> "/$(whoami)/reconscan/nmap_comprehensivescan.txt"
	    echo "Scan complete - Check results"
            echo
            echo
	    ;;
	"Top ports")
	    echo 
	    echo -e "[==>]" "\e[34mThis will perform an nmap scan on 'top ports'with predetermined parameters.\e[0m"
	    echo
	    read -p "Enter top ports to scan (e.g. 50): " tp
            read -p "Press enter to continue"
            echo "Please wait...scan in progress and may take some time....."
            echo >> "/$(whoami)/reconscan/nmap_topportsscan.txt"
            echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_topportsscan.txt"
            date >> "/$(whoami)/reconscan/nmap_topportsscan.txt" 
	    nmap -Pn -T4 -v -A $tip --top-ports $tp >> "/$(whoami)/reconscan/nmap_topportsscan.txt"
	    echo "Scan complete - Check results"
            echo
            echo
	    ;;
    "Specific Ports")
        echo 
        echo -e "[==>]" "\e[34mThis will perform an nmap scan on 'Specific Ports'with predetermined parameters.\e[0m"
        echo
        read -p "Enter ports to scan (e.g. 80,443,21,8080): " sp
            read -p "Press enter to continue"
            echo "Please wait...scan in progress and may take some time....."
            echo >> "/$(whoami)/reconscan/nmap_spportsscan.txt"
            echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_spportsscan.txt"
            date >> "/$(whoami)/reconscan/nmap_spportsscan.txt" 
        nmap -Pn -T4 -v -p $sp -A $tip >> "/$(whoami)/reconscan/nmap_spportsscan.txt"
        echo "Scan complete - Check results"
            echo
            echo
        ;;    
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
