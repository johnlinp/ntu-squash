#!/bin/bash

if [ "$#" != "3" ]
then
    echo "usage:"
    echo "    $0 citrix_ns_id username password"
    exit
fi

CITRIX_NS_ID=$1
USERNAME=$2
PASSWORD=$3

curl -s -i -L 'https://info2.ntu.edu.tw/facilities/Default.aspx' \
    -H 'Cookie: citrix_ns_id='$CITRIX_NS_ID \
    -H 'Origin: https://info2.ntu.edu.tw' \
    -H 'Accept-Encoding: gzip, deflate' \
    -H 'Accept-Language: en-US,en;q=0.8,zh-TW;q=0.6,zh;q=0.4,zh-CN;q=0.2' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.108 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'Cache-Control: max-age=0' \
    -H 'Referer: https://info2.ntu.edu.tw/facilities/Default.aspx' \
    -H 'Connection: keep-alive' \
    --data 'ctl00_ContentPlaceHolder1_tcTab_ClientState=%7B%22ActiveTabIndex%22%3A2%2C%22TabState%22%3A%5Btrue%2Ctrue%2Ctrue%5D%7D&__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATE=%2FwEPDwUKMTkxMDM2MTQyNQ9kFgJmD2QWAgIDD2QWCAIDDw8WAh4EVGV4dAUZ5LuK5pel5pel5pyf77yaMjAxNi8wOS8xNmRkAgUPDxYCHwAFSeS9v%2BeUqOiAhTroqKrlrqIoR3Vlc3Qp5oKo5aW9PEJSPjxCUj7mraHov47kvb%2FnlKjnt5rkuIrloLTlnLDpoJDntITns7vntbFkZAIHDw8WAh4HVmlzaWJsZWhkZAILDxYCHwAFvQM8bWFycXVlZSBzY3JvbGxhbW91bnQ9JzInIHNjcm9sbGRlbGF5PScxMzAnIGRpcmVjdGlvbj0gJ3VwJyBpZD14aWFvcWluZyBvbm1vdXNlb3Zlcj14aWFvcWluZy5zdG9wKCkgb25tb3VzZW91dD14aWFvcWluZy5zdGFydCgpPjxwPu%2B8ijIwMTblubQ55pyI5Lu95pmo6ZaT55CD5aC0KDA2OjEwfjA3OjUwKeWgtOWcsOioiuaBr%2BWFrDxhIGhyZWY9amF2YXNjcmlwdDp2b2lkKHdpbmRvdy5vcGVuKCdOZXdzRm9ybS5hc3B4P25ld3NJZD0xOTcnLCfmnIDmlrDmtojmga8nLCdtZW51YmFyPW5vLHN0YXR1cz1ubyxkaXJlY3Rvcmllcz1ubyxtZW51YmFyPW5vLHJlc2l6YWJsZT1ubyx0b29sYmFyPW5vLHNjcm9sbGJhcnM9eWVzLHRvcD0yMDAsbGVmdD0yMDAsd2lkdGg9NTUwLGhlaWdodD0zMDAnKSk%2BLi4uTW9yZTwvYT4gIOOAkDIwMTYvOC8zMeabtOaWsOOAkTwvcD48cD48L21hcnF1ZWU%2BZBgCBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WAgUfY3RsMDAkQ29udGVudFBsYWNlSG9sZGVyMSR0Y1RhYgUyY3RsMDAkQ29udGVudFBsYWNlSG9sZGVyMSR0Y1RhYiRUYWJQYW5lbDMkYnRuTG9naW4FH2N0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkdGNUYWIPD2RmZJSTnQDs%2Fh5xtlrJJeR%2BHLdkRD3u&__VIEWSTATEGENERATOR=FDD57D8C&__EVENTVALIDATION=%2FwEWBAL%2F2O%2B7CQK10MWvBgLD9Iu6CwKbm52ABMnKYUa1M0LCIA9ucGEISJUHy1A7&ctl00%24ContentPlaceHolder1%24tcTab%24TabPanel3%24txtMemberID='$USERNAME'&ctl00%24ContentPlaceHolder1%24tcTab%24TabPanel3%24txtPassword='$PASSWORD'&ctl00%24ContentPlaceHolder1%24tcTab%24TabPanel3%24btnLogin.x=19&ctl00%24ContentPlaceHolder1%24tcTab%24TabPanel3%24btnLogin.y=2' \
    --compressed | grep Set-Cookie | grep SessionId
