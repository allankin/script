#!/bin/bash
USER_FILE=host_users
for ip in `awk '{print $1}' $USER_FILE`
do
    user=`awk -v I="$ip" '{if(I==$1)print $2}' $USER_FILE`
    pass=`awk -v I="$ip" '{if(I==$1)print $3}' $USER_FILE`
    expect ssh_login.exp $ip $user $pass
done
