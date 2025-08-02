#!bin/bash

USERID=$(id -u) #create a variable to get the USER ID by -u from user details
#below are the color codes
R="\e[31m" #RED
G="\e[32m" #GREEN
Y="\e[33m" #YELLOW
N="\e[0m" #NORMAL

LOGS_FOLDER="/var/log/expense-logs" #create a log folder
LOG_FILE=$(echo $0 | cut -d "." -f1) #LOG file Name $(echo $0 --> get the files ex:backend.sh to cut the .sh will use pipe with cut -d "." -f1 is fragment 1)
TIMESTAMP=$(date +%Y-%m-%d_%I:%M:%S) #Timestamp format YYYY-MM-DD_HH:MM:SS
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log" #Backend YYYY-MM-DD_HH:MM:SS

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else 
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: You must have SUDO access to execute this Script"
        exit 1
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT

dnf install mysql-server -y &>>LOG_FILE_NAME
VALIDATE $? "Installing MySQL Server"

systemctl enable mysqld &>>LOG_FILE_NAME
VALIDATE $? "Enabling MySQL Server"

systemctl start mysqld &>>LOG_FILE_NAME
VALIDATE $? "Starting MySQL Server"

mysql -h mysql.kambalas.shop -u root -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    echo "MySQL Root password not setup" &>>$LOG_FILE_NAME
    mysql_secure_installation --set-root-pass ExpenseApp@1
    VALIDATE $? "Setting Root Password"
else
    echo -e "MySQL Root password already setup ... $Y SKIPPING $N"
fi