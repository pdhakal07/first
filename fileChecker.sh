#!/bin/shell

read -p "Enter the file name you want to check " file 

if [[ -e $file ]]; then
	echo "File already exsit"
	echo "Sending file to the Target"
	scp $file ec2-user@54.91.238.78:/home/ec2-user/
	if [[ $? -eq 0 ]];then
		echo "File sent sucessfully"
	else
		echo "File was not sent"
	fi
else
	echo "File does not exist, Creating a file.."
	touch $file 
	echo "File has been created, Sending to target.."
	scp $file ec2-user@54.91.238.78:/home/ec2-user/
	if [[ $? -eq 0 ]];then
                echo "File sent sucessfully"
        else
                echo "File was not sent"
        fi
fi

