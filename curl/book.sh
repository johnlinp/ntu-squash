#!/bin/bash

if [ "$#" != "12" ]
then
    echo "usage:"
    echo "    $0 citrix_ns_id session_id \\"
    echo "        username \\"
    echo "        date_lst \\"
    echo "        start_time_code end_time_code \\"
    echo "        start_time_num end_time_num \\"
    echo "        section date_code week_code \\"
    echo "        receipt_num"
    exit
fi

CITRIX_NS_ID=$1
SESSION_ID=$2
USERNAME=$3
DATE_LST=$4
START_TIME_CODE=$5
END_TIME_CODE=$6
START_TIME_NUM=$7
END_TIME_NUM=$8
SECTION=$9
DATE_CODE=${10}
WEEK_CODE=${11}
RECEIPT_NUM=${12}

URL='https://info2.ntu.edu.tw/facilities/PlaceOrderFrm.aspx?buildingSeq=MAA1&placeSeq=NAA1&dateLst='$DATE_LST'&sTime='$START_TIME_CODE'&eTime='$END_TIME_CODE'&section='$SECTION'&date='$DATE_CODE'&week='$WEEK_CODE

curl -i -s $URL \
    -H 'Cookie: citrix_ns_id='$CITRIX_NS_ID'; ASP.NET_SessionId='$SESSION_ID \
    -H 'Origin: https://info2.ntu.edu.tw' \
    -H 'Accept-Encoding: gzip, deflate' \
    -H 'Accept-Language: en-US,en;q=0.8,zh-TW;q=0.6,zh;q=0.4,zh-CN;q=0.2' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.108 Safari/537.36' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'Cache-Control: max-age=0' \
    -H 'Referer: '$URL \
    -H 'Connection: keep-alive' \
    --data '__EVENTTARGET=&__EVENTARGUMENT=&__LASTFOCUS=&__VIEWSTATE=%2FwEPDwUKMTMxOTU0ODM0MQ9kFgJmD2QWAgIDD2QWCAIDDw8WAh4EVGV4dAUZ5LuK5pel5pel5pyf77yaMjAxNi8wOS8xNmRkAgUPDxYCHwAFcOS9v%2BeUqOiAhe%2B8muael%2BiHquWdhyhBMTI3ODU0NjM4KTxCUj7ouqvku73liKXvvJrmoKHlj4s8QlI%2B5bey55m75YWlPEJSPjxCUj7mraHov47kvb%2FnlKjnt5rkuIrloLTlnLDpoJDntITns7vntbFkZAILDxYCHwAFvQM8bWFycXVlZSBzY3JvbGxhbW91bnQ9JzInIHNjcm9sbGRlbGF5PScxMzAnIGRpcmVjdGlvbj0gJ3VwJyBpZD14aWFvcWluZyBvbm1vdXNlb3Zlcj14aWFvcWluZy5zdG9wKCkgb25tb3VzZW91dD14aWFvcWluZy5zdGFydCgpPjxwPu%2B8ijIwMTblubQ55pyI5Lu95pmo6ZaT55CD5aC0KDA2OjEwfjA3OjUwKeWgtOWcsOioiuaBr%2BWFrDxhIGhyZWY9amF2YXNjcmlwdDp2b2lkKHdpbmRvdy5vcGVuKCdOZXdzRm9ybS5hc3B4P25ld3NJZD0xOTcnLCfmnIDmlrDmtojmga8nLCdtZW51YmFyPW5vLHN0YXR1cz1ubyxkaXJlY3Rvcmllcz1ubyxtZW51YmFyPW5vLHJlc2l6YWJsZT1ubyx0b29sYmFyPW5vLHNjcm9sbGJhcnM9eWVzLHRvcD0yMDAsbGVmdD0yMDAsd2lkdGg9NTUwLGhlaWdodD0zMDAnKSk%2BLi4uTW9yZTwvYT4gIOOAkDIwMTYvOC8zMeabtOaWsOOAkTwvcD48cD48L21hcnF1ZWU%2BZAIND2QWAgIBD2QWEgIIDw8WAh8ABQY5MDA1NzNkZAIKDw8WAh8ABTPntpzlkIjpq5TogrLppKjlnLDkuIvkuIDmqJMtQjHlo4HnkIPlrqQgICAgICAgICAgICBkZAIMDw8WAh8ABQnmnpfoh6rlnYdkZAIaDw8WAh8ABQbmoKHlj4tkZAIcDxBkDxYCZgIBFgIQBQbnj77ph5EFBuePvumHkWcQBQnmmYLmlbjliLgFBuaZguaVuGdkZAIgDw8WAh8ABQoyMDE2LzA5LzIzZGQCIg8QZA8WD2YCAQICAgMCBAIFAgYCBwIIAgkCCgILAgwCDQIOFg8QBQQ4OjAwBQE4ZxAFBDk6MDAFATlnEAUFMTA6MDAFAjEwZxAFBTExOjAwBQIxMWcQBQUxMjowMAUCMTJnEAUFMTM6MDAFAjEzZxAFBTE0OjAwBQIxNGcQBQUxNTowMAUCMTVnEAUFMTY6MDAFAjE2ZxAFBTE3OjAwBQIxN2cQBQUxODowMAUCMThnEAUFMTk6MDAFAjE5ZxAFBTIwOjAwBQIyMGcQBQUyMTowMAUCMjFnEAUFMjI6MDAFAjIyZ2RkAiQPEGQPFg5mAgECAgIDAgQCBQIGAgcCCAIJAgoCCwIMAg0WDhAFBDk6MDAFATlnEAUFMTA6MDAFAjEwZxAFBTExOjAwBQIxMWcQBQUxMjowMAUCMTJnEAUFMTM6MDAFAjEzZxAFBTE0OjAwBQIxNGcQBQUxNTowMAUCMTVnEAUFMTY6MDAFAjE2ZxAFBTE3OjAwBQIxN2cQBQUxODowMAUCMThnEAUFMTk6MDAFAjE5ZxAFBTIwOjAwBQIyMGcQBQUyMTowMAUCMjFnEAUFMjI6MDAFAjIyZ2RkAioPDxYCHwAFLCROVDI1MC%2FloLTmrKEo5bCW5bOw5pmC5q61MTk6MDDoh7MyMDowMCk8QlI%2BZGRkNG2B7MG7LP6t2kx5seFqax2I8XM%3D&__VIEWSTATEGENERATOR=2C8BDEE8&__EVENTVALIDATION=%2FwEWNQKt57EhAp6dhroKAqaCtLoHApWZoq4NAt71xboPAtSenfEBAoSEs7wEAoi%2F35AJAqWMq%2BQBAqnFmYANArGqs%2B4BAr6qs%2B4BAqaq8%2B0BAqaq%2F%2B0BAqaq%2B%2B0BAqaqx%2B0BAqaqw%2B0BAqaqz%2B0BAqaqy%2B0BAqaq1%2B0BAqaqk%2B4BAqaqn%2B4BAqeq8%2B0BAqeq%2F%2B0BAqeq%2B%2B0BArbX%2BrEDAqG40N8PArm4kNwPArm4nNwPArm4mNwPArm4pNwPArm4oNwPArm4rNwPArm4qNwPArm4tNwPArm48N8PArm4%2FN8PAri4kNwPAri4nNwPAri4mNwPApK4muULApPn4rUIAobWoPQJAuPlzq4KAoSM3rwPAobu5ewHAsr%2Bh4wOAqfq9sYGArDuxJMHAvnS1vQJAvnS%2FoIKAuqoq44JApyNgdcNILG%2B6gAbQFz6g5M9LT2no2Em7Lw%3D&ctl00%24ContentPlaceHolder1%24txtContactName=&ctl00%24ContentPlaceHolder1%24txtContactTel=&ctl00%24ContentPlaceHolder1%24txtFax=&ctl00%24ContentPlaceHolder1%24txtEmail=&ctl00%24ContentPlaceHolder1%24DropLstPayMethod=%E7%8F%BE%E9%87%91&ctl00%24ContentPlaceHolder1%24txtpayHourNum='$RECEIPT_NUM'&ctl00%24ContentPlaceHolder1%24DropLstTimeStart='$START_TIME_NUM'&ctl00%24ContentPlaceHolder1%24DropLstTimeEnd='$END_TIME_NUM'&ctl00%24ContentPlaceHolder1%24txtPlaceNum=1&ctl00%24ContentPlaceHolder1%24btnOrder=%E9%80%81%E5%87%BA%E9%A0%90%E7%B4%84&ctl00%24ContentPlaceHolder1%24hidbookDate='$DATE_LST'&ctl00%24ContentPlaceHolder1%24hidmemberId='$USERNAME'&ctl00%24ContentPlaceHolder1%24hidplaceSeq=4&ctl00%24ContentPlaceHolder1%24hidpayPrice=250&ctl00%24ContentPlaceHolder1%24hidpeekCharge=250&ctl00%24ContentPlaceHolder1%24hidoffCharge=0&ctl00%24ContentPlaceHolder1%24hidsTime='$START_TIME_NUM'&ctl00%24ContentPlaceHolder1%24hideTime='$END_TIME_NUM'&ctl00%24ContentPlaceHolder1%24hidWeek=5&ctl00%24ContentPlaceHolder1%24hiddateLst='$DATE_LST \
    --compressed | grep HTTP/1.1 | grep 200
