#!/bin/bash
# clearing the screen before execution
clear
echo
## Formatting Variables
Red="\033[01;31m"	# For Issues / Errors
Green="\033[01;32m"	# Success / Asking user input
Yellow="\033[01;33m"	# Warnings / Information
Blue="\033[01;34m"	# Headings
Cyan="\033[01;36m"	# Special
Bold="\033[01;01m"	# Highlight
Reset="\033[00m"	# Return to Normal
long='=================================================================================='
medium='========================================================'
short='==================================='

## Function Variables

echo
echo -e  "${Blue}$(date)${Reset}"	# Show current date and time

#######################################################################################

f_banner(){	# For the tool Banner
echo
echo "[---------------------------------------]"
echo -e [---------"${Yellow}Author: ${Green}G0tD4un1k${Reset}"-------------]
echo -e [---------++++++++++++++++++------------]
echo -e [---------"${Red}${Bold}R E C O N - S C A N${Reset}"-----------]
echo -e [---------++++++++++++++++++------------]
echo -e [-------"(Powered by nmap & bash)"--------]
echo -e [-----"${Cyan}pentestknight.blogspot.com.au${Reset}"-----]
echo -e [----------------"${Red}[V0.1]${Reset}"-----------------]
echo "[---------------------------------------]"
echo
echo
echo
}

f_error(){
echo
echo -e "\x1B[1;31m$medium\x1B[0m"
echo
echo -e "\x1B[1;31m           *** Invalid choice or entry. ***\x1B[0m"
echo
echo -e "\x1B[1;31m$medium\x1B[0m"
sleep 2
f_main
}

f_nmapregscan(){	# For nmap REGULAR scan
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
}

f_nmapquickscan(){	# For nmap QUICK scan
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
}

f_nmapintensescan(){	# For nmap INTENSE scan
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
}

f_nmapalltcpportsscan(){	# For nmap All TCP Ports scan
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
}

f_nmapslowcomprehensivescan(){	# For nmap Slow & Comprehensive scan
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
}

f_topportsscan(){	# For nmap TOP PORTS scan
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
}

f_specificportsscan(){	# For nmap SPECIFIC PORTS scan
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
}

f_userdefinedscan(){	# For USER DEFINED nmap scan
echo
echo -e "[==>]" "\e[34mUse this option to define your own scan.\e[0m"
echo
read -p "Enter scan parameters (e.g. -vv -Pn -A -sS -sU -oA -iL --exclude etc.): " cs 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_customscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_customscan.txt"
date >> "/$(whoami)/reconscan/nmap_customscan.txt" 
nmap $cs >> "/$(whoami)/reconscan/nmap_customscan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_advanced(){	# For ADVANCED nmap scans
clear
f_banner
echo
echo -e "${Red}ADVANCED SCAN OPTIONS${Reset}"
echo
echo -e "[*]" "\e[34mUse this option to perform Firewall evasion & spoofing. Exercise caution while running these scans read the nmap documentation if you are not sure wht you are doing. https://nmap.org/book/man-bypass-firewalls-ids.html\e[0m"
echo
echo "1.  FRAGMENT PACKETS"
echo "2.  USE SPECIFIC MTU"
echo "3.  USE SPECIFIED INTERFACE"
echo "4.  USE A DECOY"
echo "5.  RELAY TCP CONNECTIONS THROUGH A CHAIN OF PROXIES"
echo "6.  MANUALLY SPECIFY A SOURCE PORT"
echo "7.  SPOOF MAC ADDRESS"
echo "8.  SEND BAD CHECKSUMS"
echo "9.  BACK TO MAIN MENU"
echo -n "choice: "
read choice

case $choice in
	1) f_fragmentpkts;;
	2) f_spmtu;;
	3) f_spintface;;
	4) f_decoy;;
	5) f_pxychainrelay;;
	6) f_srcport;;
	7) f_macspoof;;
	8) f_badchksum;;
	9) f_main;;
	*) f_error;;
esac
}

f_fragmentpkts(){
echo
echo -e "[==>]" "\e[34mSend fragment packets.\e[0m"
echo 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_fragmentscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_fragmentscan.txt"
date >> "/$(whoami)/reconscan/nmap_fragmentscan.txt" 
nmap -f $tip >> "/$(whoami)/reconscan/nmap_fragmentscan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_spmtu(){
echo
echo -e "[==>]" "\e[34mUse this option to define your own MTU.\e[0m"
echo
read -p "Enter MTU (MTU can be specified in multiples of 8 (8,16,24,32)): " mtu 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_mtuscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_mtuscan.txt"
date >> "/$(whoami)/reconscan/nmap_mtuscan.txt" 
nmap -Pn -sV -A --mtu $mtu $tip >> "/$(whoami)/reconscan/nmap_mtuscan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_spintface(){
echo
echo -e "[==>]" "\e[34mUse this option to define your own interface to send and receive packets.\e[0m"
echo
read -p "Enter Interface: " int 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_custinterfacescan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_custinterfacescan.txt"
date >> "/$(whoami)/reconscan/nmap_custinterfacescan.txt" 
nmap -Pn -sV -A -e $int $tip >> "/$(whoami)/reconscan/nmap_custinterfacescan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_decoy(){
echo
echo -e "[==>]" "\e[34mUse this option to confuse firewall with decoys.\e[0m"
echo 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_RNDDecoyscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_RNDDecoyscan.txt"
date >> "/$(whoami)/reconscan/nmap_RNDDecoyscan.txt" 
nmap -Pn -sV -A -D RND:10 $tip >> "/$(whoami)/reconscan/nmap_RNDDecoyscan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_pxychainrelay(){
echo
echo -e "[==>]" "\e[34mUse this option to Relay TCP connections through a chain of proxy URLs.\e[0m"
echo
read -p "Enter Comma-separated list of proxy URLs: " pxy 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_proxyrelayscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_proxyrelayscan.txt"
date >> "/$(whoami)/reconscan/nmap_proxyrelayscan.txt" 
nmap -Pn -sV -A --proxies $pxy $tip >> "/$(whoami)/reconscan/nmap_proxyrelayscan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_srcport(){
echo
echo -e "[==>]" "\e[34mUse this option to manually specify a source port.\e[0m"
echo
read -p "Enter source port to be used: " sp
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_sourceportscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_sourceportscan.txt"
date >> "/$(whoami)/reconscan/nmap_sourceportscan.txt" 
nmap -Pn -sV -A -g $sp $tip >> "/$(whoami)/reconscan/nmap_sourceportscan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_macspoof(){
echo
echo -e "[==>]" "\e[34mUse this option to spoof a mac address.\e[0m"
echo
read -p "Enter mac address to be used for spoofing: " smac
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_spoofmacscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_spoofmacscan.txt"
date >> "/$(whoami)/reconscan/nmap_spoofmacscan.txt" 
nmap -Pn -v -sT --spoof-mac $smac $tip >> "/$(whoami)/reconscan/nmap_spoofmacscan.txt"
echo "Scan complete - Check results"
echo
echo
}

f_badchksum(){
echo
echo -e "[==>]" "\e[34mUse this option to send bad checksums while scanning.\e[0m"
echo
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/nmap_badchecksumscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/nmap_badchecksumscan.txt"
date >> "/$(whoami)/reconscan/nmap_badchecksumscan.txt" 
nmap -Pn -v -sT --badsum $tip >> "/$(whoami)/reconscan/nmap_badchecksumscan.txt"
echo "Scan complete - Check results"
echo
echo
}

######################################################################################

f_main(){
clear
f_banner

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
f_error
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

echo -e "${Blue}SELECT SCAN${Reset}"
echo "1.  REGULAR SCAN"
echo "2.  QUICK SCAN"
echo "3.  INTENSE SCAN"
echo "4.  ALL TCP PORTS"
echo "5.  SLOW & COMPREHENSIVE SCAN"
echo "6.  TOP PORTS"
echo "7.  SPECIFIC PORTS"
echo "8.  USER DEFINED SCAN"
echo "9.  ADVANCED"
echo "10. EXIT"
echo
echo -n "Choice: "
read choice

case $choice in
	1) f_nmapregscan;;
	2) f_nmapquickscan;;
	3) f_nmapintensescan;;
	4) f_nmapalltcpportsscan;;
	5) f_nmapslowcomprehensivescan;;
	6) f_topportsscan;;
	7) f_specificportsscan;;
	8) f_userdefinedscan;;
	9) f_advanced;;
	10) clear && exit;;
	*) f_error;;
esac
}

#######################################################################################

while true; do f_main; done
