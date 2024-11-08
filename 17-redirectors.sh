#!/bin/bash


LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP= $(datye +%Y-%M-%D-%H-%M-%S )
LOG_FILE= $LOG_FOLDER/$SCRIPT_NAME/$TIMESTAMP
mkdir -p $LOG_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then  
        echo -e "$R please run this script with root priviliges $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ..$R failed $N" | tee -a $LOG_FILE
        exit 1
    else  
        echo -e "$2 is ..$G sucess $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R Usage: $N sudo sh 16-redirectors.sh package1 package2 ..."
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE


CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
   dnf list installed $package &>>$LOG_FILE
   if [ $? -ne 0 ]
   then
       echo "$package is not installed going to install it" | tee -a $LOG_FILE

       dnf install $package -y
       VALIDATE $? "installing a package"
    else
        echo $package is already installed | tee -a $LOG_FILE
    fi
done