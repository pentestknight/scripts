#!/bin/bash
# clearing the screen before execution
clear
echo
echo -e "\e[1;34m$(date)\e[0m"
echo
echo
echo "[---------------------------------------]"
echo -e [---------"\e[1;33mAuthor:\e[0m""\e[1;32mG0tD4un1k\e[0m" -------------]
echo -e [---------"\e[1;36mR E C O N - S C A N\e[0m"-----------]
echo -e [-------"\e[1;35mPowered by nmap & bash\e[0m"----------]
echo "[----------------[V0.1]-----------------]"
echo "[---------------------------------------]"
echo
echo
read -p "Enter an IP / hostname to scan : " tip
echo
#echo -e "[+]" Using "\e[1;36m"$tip"\e[0m" as target For RECON SCAN
echo
echo
if [ -z $tip ]; then
echo
echo
echo -e "\e[1;31mNo Input provided "[Aborting...Restart the program and provide input]"\e[0m"
else
echo -e "[+]" Using "\e[1;36m"$tip"\e[0m" as target For RECON SCAN
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
            echo "you chose choice 1"
	    nmap $tip > nmap_regularscanresults.txt
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
