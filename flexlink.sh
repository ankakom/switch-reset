 #!/usr/bin/expect -f

 set timeout 20

       # set IPaddress [lindex $argv 0]


        #set Directory /Users/annkomar/Desktop/Cisco Work/Switching Team/Switch_reset_script

       # log_file -a $Directory/session_$IPaddress.log

       # send_log "### /START-TELNET-SESSION/ IP: $IPaddress @ [exec date] ###\r"

        spawn  telnet 172.26.192.252

        send "\r"

        expect "SANDBOX.CS.2#"

        send "clear line 11\r"

        expect -exact "confirm\r"

        send "\r"

        expect "SANDBOX.CS.2#"

        #Connect to port 2011

        send "1.1.1.1 2011\r"

        send "\r"

        send "\r"

        #Configure Active Port 

        expect "9300-Flexlink#" 

        send "conf t\r"

        expect "(config)#"

        send "int po4\r"

        expect "(config-if)#"

        send "rep segment 1 edge no-neighbor primary\r"

        expect "end\r"

        #Configure Standby Port

        send "conf t\r"

        expect "(config-if)#"

        send "int po5\r"

        expect "(config-if)#"

        send "rep segment 1 edge no-neighbor\r"

        expect "(config-if)#"

        send "end\r"

        #Configure VLAN Load Balancing

        expect "9300-Flexlink#" 

        send "conf t\r"

        expect "(config)#"

        send "int po4\r"

        expect "(config-if)#"

        send "rep block port 2 vlan 4\r"

        expect "(config-if)#"

        send "end\r"


