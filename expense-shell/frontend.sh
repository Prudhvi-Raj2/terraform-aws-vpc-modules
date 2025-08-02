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

mkdir -p $LOGS_FOLDER

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT

dnf install nginx -y  &>>$LOG_FILE_NAME
VALIDATE $? "Installing Nginx Server"

systemctl enable nginx &>>$LOG_FILE_NAME
VALIDATE $? "Enabling Nginx server"

systemctl start nginx &>>$LOG_FILE_NAME
VALIDATE $? "Starting Nginx Server"

rm -rf /usr/share/nginx/html/* &>>$LOG_FILE_NAME
VALIDATE $? "Removing existing version of code"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOG_FILE_NAME
VALIDATE $? "Downloading Latest code"

cd /usr/share/nginx/html
VALIDATE $? "Moving to HTML directory"

unzip /tmp/frontend.zip &>>$LOG_FILE_NAME
VALIDATE $? "unzipping the frontend code"

cp /home/ec2-user/expense-shell/expense.conf /etc/nginx/default.d/expense.conf
VALIDATE $? "Copied expense config"

systemctl restart nginx &>>$LOG_FILE_NAME
VALIDATE $? "Restarting nginx"