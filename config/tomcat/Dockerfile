#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 2
#   Author: Nguyen Cuong Anh Minh
#   ID: 3931605
#   Created  date: 22/08/2022
#   Last modified: 22/08/2022
#   Acknowledgement: Acknowledge the resources that you use here. 
# Pull latest tomcat
FROM tomcat:latest
# Copy everything inside webapp.dist to webapps
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
# Copy the war file from Jenkins server delievery to webapps for deployment
COPY ./*.war /usr/local/tomcat/webapps

# For pushing on DockerHub

# build the image locally
# docker build -t tomcat_asm2_3931605:latest .

# create tag to push the image to dockerhub
# docker tag tomcat_asm2_3931605:latest anhminhbo/tomcat_asm2_3931605:latest

#  push the docker image to dockerhub
# docker push anhminhbo/tomcat_asm2_3931605:latest

# Run container based on image on Github
# docker run -d --name tomcat-container --rm -p 8080:8080 anhminhbo/tomcat_asm2_3931605:latest

# Login dockerhub
#sudo docker login -u "anhminhbo" -p "Anhminh1234*" docker.io;
#sudo docker logout;