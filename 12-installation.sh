#!/bin/bash

USERID=$(id -u)
#echo "User id is: $USERID

if [ $USERID -ne 0 ]
then 
    echo "please run the script with root priviligies"
    exit 1
fi

dnf list installed git  #just checking whether git is installed or not


if [ $? -ne 0 ]
then 
    echo "git is not installed going to install it"
    dnf install git -y 
    if [ $? -ne 0 ]
    then
        echo "git installation is not sucess...check it"
        exit 1
    else
        echo "git installation is sucess"
    fi
    else
        echo "git is already installed nothing to do it"
fi

dnf list installed mysql

if [ S? -ne 0 ]
then  
    echo "mysql in not installed going to install it"
    dnf install mysql -y
    if [ $? -ne 0 ] 
    then
        echo "mysql installation is not sucess check it"
        exit 1
    else
        echo "mysql installation is sucess"
    fi
    else
        echo "mysql is alreay installed"
fi

