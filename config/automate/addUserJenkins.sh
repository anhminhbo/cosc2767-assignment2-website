#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 2
#   Author: Nguyen Cuong Anh Minh
#   ID: 3931605
#   Created  date: 22/08/2022
#   Last modified: 22/08/2022
#   Acknowledgement: Acknowledge the resources that you use here. 

# Root user

# Install docker
echo "Installing docker"
yum install docker -y

# Start docker service
echo "Starting docker service"
service docker start

# add user jenkinsmaster
echo "add user jenkinsmaster"
useradd jenkinsmaster

# set password of jenkinsmaster to be 1234
echo "set password of jenkinsmaster to 1234"
echo 1234 | passwd jenkinsmaster --stdin

# set jenkinsmaster permission to use docker command
echo "set jenkinsmaster permission to use docker command"
usermod -aG docker jenkinsmaster

# set sudoers for jenkinsmaster
echo "set sudoers for jenkinsmaster"
sed -i '111 i jenkinsmaster ALL=(ALL)    NOPASSWD: ALL' /etc/sudoers

# setting ssh config to enable ssh using password
echo "setting ssh config to enable ssh using password"

# comment password authentication No
echo "comment password authentication No"
sed -i '63 s/^/#/' /etc/ssh/sshd_config

# uncomment password Authentication Yes
echo "uncomment password Authentication Yes"
sed -i '61s/^#//' /etc/ssh/sshd_config

# reload ssh service
echo "reload ssh service"
service sshd reload

# exit to start switching back to new user
echo "exit to start switching back to new user"



