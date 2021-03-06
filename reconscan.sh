#!/bin/bash
# clearing the screen before execution
clear
#echo
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
min=1
max=65535
now=$(date +"%d_%m_%Y_%T")

## Function Variables

#echo
#echo -e  "${Blue}$(date)${Reset}"	# Show current date and time

#######################################################################################
f_userinput(){
# Collect user input
read -p "Enter an IP / hostname to scan : " tip
echo
echo
if [ -z $tip ]; then
echo
echo
f_error
else
echo -e "[+]" "Using" "\e[1;36;4m"$tip"\e[0m" "as target For RECON SCAN"
fi
}

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

f_dependencies(){
#echo
echo -e "${Yellow}Checking for dependencies > 10%${Reset}"
#sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies _ 20%${Reset}"
sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies > 30%${Reset}"
#sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies _ 40%${Reset}"
#sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies > 50%${Reset}"
sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies _ 60%${Reset}"
#sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies > 70%${Reset}"
#sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies _ 80%${Reset}"
#sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies > 90%${Reset}"
sleep 1
clear
f_banner
echo -e "${Yellow}Checking for dependencies : 100%${Reset}"
sleep 1
if which nmap >/dev/null; then
	echo -e "Dependencies are installed.....${Green}[Yes]${Reset}"

else
sleep 1
	echo -e "nmap is installed.....${Red}[No]${Reset}"
sleep 1
	read -p "Do you want to install nmap?: Yes / No" opt
if $opt=Yes; then
	echo -e "${Blue}Installing nmap${Reset}"
	apt-get update && apt-get install nmap
else
	echo -e "${Red}I need nmap to work. nmap is not installed....exitting${Reset}"
fi
f_exit
fi

}

f_exit(){
clear
f_banner
echo
cd /$(whoami)/reconscan
zip -r -uq reconscan_$now.zip $now && rm -r $now
cd /$(whoami)
echo -e "${Yellow}Cleaning up before exiting.....${Reset}"
echo -e "${Cyan}Results will be stored in a zipped file @ /$(whoami)/reconscan${Reset}"
echo
echo -e "All processes terminated ---------- ${Green}[ok]${Reset}"
sleep 1
echo -e "All temporary files cleaned up -----${Green}[ok]${Reset}"
sleep 1
echo -e "Network Packet dump stopped---------${Green}[ok]${Reset}"
sleep 1
echo -e "All wrappers terminated-------------${Green}[ok]${Reset}"
sleep 1
echo -e "${Bold}BYE BYE${Reset}"
sleep 4
clear
exit
}


f_nmapregscan(){	# For nmap REGULAR scan
f_userinput
echo
echo -e "[==>]" "\e[34mThis will perform a 'regular' nmap scan with predetermined parameters.\e[0m"
echo
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time"
echo >> "/$(whoami)/reconscan/$now/nmap_regularscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_regularscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_regularscan.txt" 
nmap -Pn $tip >> "/$(whoami)/reconscan/$now/nmap_regularscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_nmapquickscan(){	# For nmap QUICK scan
f_userinput
echo
echo -e "[==>]" "\e[34mThis will perform a 'quick' nmap scan with predetermined parameters.\e[0m"
echo
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time...should be quick though :)"
echo >> "/$(whoami)/reconscan/$now/nmap_quickscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_quickscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_quickscan.txt" 
nmap -Pn -T4 -F $tip >> "/$(whoami)/reconscan/$now/nmap_quickscan.txt" 
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_nmapintensescan(){	# For nmap INTENSE scan
f_userinput
echo
echo -e "[==>]" "\e[34mThis will perform an 'intense' nmap scan with predetermined parameters.\e[0m"
echo
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_intensescan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_intensescan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_intensescan.txt" 
nmap -Pn -T4 -v -A $tip >> "/$(whoami)/reconscan/$now/nmap_intensescan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_nmapalltcpportsscan(){	# For nmap All TCP Ports scan
f_userinput
echo
echo -e "[==>]" "\e[34mThis will perform an nmap scan on 'all TCP ports' with predetermined parameters.\e[0m"
echo
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_allTCPportsscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_allTCPportsscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_allTCPportsscan.txt" 
nmap -Pn -p- -v -A -T4 $tip >> "/$(whoami)/reconscan/$now/nmap_allTCPportsscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_nmapslowcomprehensivescan(){	# For nmap Slow & Comprehensive scan
f_userinput
echo
echo -e "[==>]" "\e[34mThis will perform a 'Slow & Comprehensive' nmap scan with predetermined parameters.\e[0m"
echo
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_comprehensivescan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_comprehensivescan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_comprehensivescan.txt" 
nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $tip >> "/$(whoami)/reconscan/$now/nmap_comprehensivescan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_topportsscan(){	# For nmap TOP PORTS scan
f_userinput
echo
echo -e "[==>]" "\e[34mThis will perform an nmap scan on 'top ports'with predetermined parameters.\e[0m"
echo
read -p "Enter top ports to scan (e.g. 50): " tp
# Check for no input
if [ -z $tp ]; then
	echo "No input provided"
fi
	if [[ "$tp" -gt "$max" ]]; then
		f_error
	else
		if [[ "$tp" -lt "$min" ]]; then
			f_error
		fi
	fi

read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_topportsscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_topportsscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_topportsscan.txt" 
nmap -Pn -T4 -v -A $tip --top-ports $tp >> "/$(whoami)/reconscan/$now/nmap_topportsscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_specificportsscan(){	# For nmap SPECIFIC PORTS scan
f_userinput
echo
echo -e "[==>]" "\e[34mThis will perform an nmap scan on 'Specific Ports'with predetermined parameters.\e[0m"
echo "Enter ports to scan (e.g. 80,443,21,8080) [1-65535]: "
read sp
min=1
max=65535
# Check for No Answer
if [ -z $sp ]; then
	f_error
	#f_specificportsscan
else

# Check for Wrong answer

if [ "$sp" -gt "$max" ]; then
	f_error
	#f_specificportsscan
else
if [ "$sp" -lt "$min" ]; then
	f_error
	#f_specificportsscan
fi
fi
fi
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_spportsscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_spportsscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_spportsscan.txt" 
nmap -Pn -T4 -v -p $sp -A $tip >> "/$(whoami)/reconscan/$now/nmap_spportsscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_userdefinedscan(){	# For USER DEFINED nmap scan
f_userinput
echo
echo -e "[==>]" "\e[34mUse this option to define your own scan.\e[0m"
echo
read -p "Enter scan parameters (e.g. -vv -Pn -A -sS -sU -oA -iL --exclude etc.): " cs 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_customscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_customscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_customscan.txt" 
nmap $cs $tip >> "/$(whoami)/reconscan/$now/nmap_customscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_advanced(){	# For ADVANCED nmap scans
clear
f_banner
echo
echo -e "${Red}ADVANCED SCAN OPTIONS${Reset}"
echo
echo -e "[*]" "\e[34mUse this option to perform Firewall evasion & spoofing. Exercise caution while running these scans. Read the nmap documentation if you are not sure what you are doing: https://nmap.org/book/man-bypass-firewalls-ids.html\e[0m"
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
echo "10. EXIT"
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
	10) f_exit;;
	*) f_error;;
esac
}

f_fragmentpkts(){
echo
echo -e "[==>]" "\e[34mSend fragment packets.\e[0m"
echo 
f_userinput
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_fragmentscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_fragmentscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_fragmentscan.txt" 
nmap -f $tip >> "/$(whoami)/reconscan/$now/nmap_fragmentscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_spmtu(){

echo
echo -e "[==>]" "\e[34mUse this option to define your own MTU.\e[0m"
echo
f_userinput
read -p "Enter MTU (MTU can be specified in multiples of 8 (8,16,24,32)): " mtu 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_mtuscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_mtuscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_mtuscan.txt" 
nmap -Pn -sV -A --mtu $mtu $tip >> "/$(whoami)/reconscan/$now/nmap_mtuscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_spintface(){
echo
echo -e "[==>]" "\e[34mUse this option to define your own interface to send and receive packets.\e[0m"
echo
f_userinput
read -p "Enter Interface: " int 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_custinterfacescan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_custinterfacescan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_custinterfacescan.txt" 
nmap -Pn -sV -A -e $int $tip >> "/$(whoami)/reconscan/$now/nmap_custinterfacescan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_decoy(){
echo
echo -e "[==>]" "\e[34mUse this option to confuse firewall with decoys.\e[0m"
echo 
f_userinput
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_RNDDecoyscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_RNDDecoyscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_RNDDecoyscan.txt" 
nmap -Pn -sV -A -D RND:10 $tip >> "/$(whoami)/reconscan/$now/nmap_RNDDecoyscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_pxychainrelay(){
echo
echo -e "[==>]" "\e[34mUse this option to Relay TCP connections through a chain of proxy URLs.\e[0m"
echo
f_userinput
read -p "Enter Comma-separated list of proxy URLs: " pxy 
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_proxyrelayscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_proxyrelayscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_proxyrelayscan.txt" 
nmap -Pn -sV -A --proxies $pxy $tip >> "/$(whoami)/reconscan/$now/nmap_proxyrelayscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_srcport(){
echo
echo -e "[==>]" "\e[34mUse this option to manually specify a source port.\e[0m"
echo
f_userinput
read -p "Enter source port to be used: " sp
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_sourceportscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_sourceportscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_sourceportscan.txt" 
nmap -Pn -sV -A -g $sp $tip >> "/$(whoami)/reconscan/$now/nmap_sourceportscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_macspoof(){
echo
echo -e "[==>]" "\e[34mUse this option to spoof a mac address.\e[0m"
echo
f_userinput
read -p "Enter mac address to be used for spoofing: " smac
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_spoofmacscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_spoofmacscan.txt"
date >> "/$(whoami)/reconscan/$now/nmap_spoofmacscan.txt" 
nmap -Pn -v -sT --spoof-mac $smac $tip >> "/$(whoami)/reconscan/$now/nmap_spoofmacscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

f_badchksum(){
echo
echo -e "[==>]" "\e[34mUse this option to send bad checksums while scanning.\e[0m"
echo
f_userinput
read -p "Press enter to continue"
echo "Please wait...scan in progress and may take some time....."
echo >> "/$(whoami)/reconscan/$now/nmap_badchecksumscan.txt"
echo "[+]" "[------------Scan Results------------]" >> "/$(whoami)/reconscan/$now/nmap_badchecksumscan.txt"
date >> "/$(whoami)/reconscan/nmap_badchecksumscan.txt" 
nmap -Pn -v -sT --badsum $tip >> "/$(whoami)/reconscan/$now/nmap_badchecksumscan.txt"
echo "Scan complete - Check results"
sleep 2
echo
echo
}

######################################################################################
f_banner
f_dependencies
sleep 2
f_main(){
clear
echo -e  "${Blue}$(date)${Reset}"  # Show current date and time
f_banner
#echo
#f_dependencies
# create a directory to store the results
mkdir -p /$(whoami)/reconscan/$now
touch /$(whoami)/reconscan/$now/target_list.txt

echo >> "/$(whoami)/reconscan/$now/target_list.txt"
echo "[+]" "[---------------------New Scan------------------]" >> "/$(whoami)/reconscan/$now/target_list.txt"
date >> "/$(whoami)/reconscan/$now/target_list.txt"
echo "The selected target: " $tip >> "/$(whoami)/reconscan/$now/target_list.txt"
echo
echo
echo
echo -e "${Blue}SELECT SCAN:${Reset}"
echo
echo "1.  REGULAR SCAN"
echo "2.  QUICK SCAN"
echo "3.  INTENSE SCAN"
echo "4.  ALL TCP PORTS"
echo "5.  SLOW & COMPREHENSIVE SCAN"
echo "6.  TOP PORTS"
echo "7.  SPECIFIC PORTS"
echo "8.  USER DEFINED SCAN"
echo -e "9.  ${Red}${Bold}ADVANCED${Reset}"
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
	10) f_exit;;
	*) f_error;;
esac
}

#######################################################################################

while true; do f_main; done
