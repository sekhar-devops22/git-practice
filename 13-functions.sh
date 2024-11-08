#!/bin/bash

USERID =$(id -u)

CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then  
        echo "please run this script with root priviliges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo "$2 is failed"
       exit 1
    else  
        echo "$2 is sucess"
    fi
}

CHECK_ROOT

dnf list installed git

if [ $? -ne 0 ]
then
    echo "git not installed it..going to install"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "git is already installed "
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is installed it ..going to install"
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else  
    echo "mysql is installed"
fi