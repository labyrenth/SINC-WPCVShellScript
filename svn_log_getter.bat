##curl 로 목표 URL에 POST 방식으로 RESTful 하게 XML 형식 String 전달
#! /bin/bash

total_Path=$(find /home/ubuntu/svn/* \! \( -type d -name repositories -prune \) -type d)
target_address_ip=127.0.0.1
target_address_port=8088
target_url=server/xmlFilePath
for val in $total_Path
do

        target=${val##*/}
        svn log -v --xml $val/repositories | curl -v -X POST --Header 'Content-Type:application/xml' --Header 'Charset:UTF-8' --Header 'File:$target' -d @- http://$target_address_ip:$target_address_port/$target_url

done
