# Bash

Scripting Library is a collection of scripts and experiences shared by IT Pros, Developers, DevOps and Geeks across Linux and Windows OS with BaSH, PowerShell and Python from all over the world.
![immagine](https://user-images.githubusercontent.com/56889513/117018797-2012cc80-acf5-11eb-93c9-1ba77e06ef00.png)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# hackerEnv 
hackerEnv is an automation tool that quickly and easily sweep IPs and scan ports, vulnerabilities and exploit them. Then, it hands you an interactive shell for further testing. Also, it generates HTML and docx reports.
It uses other tools such as nmap, nikto, metasploit and hydra. Works in kali linux and Parrot OS.<br />
This tool was NOT coded by a professional, I do not know what i am doing. 
```diff
- By running this program, you are agreeing on NOT running it against any public, corporate or unauthorized networks.
- Performed only when you have authorization to do.
```
**This was a school project, which means i am not gonna work on it any more. However, In the faaaaaaaaaaar future, I will make a python framework that does better job than this shitshow.**
Greetz to @kk
## Update Kali/Parrot
```
apt update; apt upgrade -y
```

### Download hackerEnv
```
cd /opt/
git clone https://github.com/kal1gh0st/Bash/hackerEnv.git
cd /opt/hackerEnv
chmod +x hackerEnv
```

### If you want to use it anywhere on the system, create a shortcut using:
```
ln -s /opt/hackerEnv/hackerEnv /usr/local/bin/
```

### Usage:
```
Usage:
    hackerEnv <flag> <argument>

Examples:
    hackerEnv -t 10.10.10.10
    hackerEnv -t "10.10.10.10\n20.20.20.20"
    hackerEnv -t 10.10.10.10 -i eth0
    hackerEnv -i eth0 -s 24
    hackerEnv -s 24
    
Flages:
    hackerEnv -h, --help          Display this help message.
    hackerEnv --update            Update tool.
    hackerEnv                     Scan the entire network.
    hackerEnv -t                  Pass a specific target's IP.
    hackerEnv -t                  Pass mutipule targets' IPs e.g. hackerEnv -t "10.10.10.10\n20.20.20.20"
    hackerEnv -i                  To specify an interface.
    hackerEnv -a                  Pass attacker's IP.
    hackerEnv -s                  To specify subNetwork 24 or 23 etc. exclude /
    hackerEnv -e, --aggressive    Enable aggressive port scan
    hackerEnv -oA                 genetrate report in HTML and DOCX format
```
[![YouTube video](https://i.imgur.com/cwJ80Pa.png)](https://www.youtube.com/watch?v=-r5iDrLF4xU)
### in Gnome terminal
![alt text](https://i.imgur.com/uHk0Ypt.png)
### in tmux
![alt text](https://i.imgur.com/ppCLMUw.png)
### Report
![alt text](https://i.imgur.com/CCbcKMJ.png)
