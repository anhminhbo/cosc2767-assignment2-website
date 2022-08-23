#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 2
#   Author: Nguyen Cuong Anh Minh
#   ID: 3931605
#   Created  date: 22/08/2022
#   Last modified: 22/08/2022
#   Acknowledgement: Acknowledge the resources that you use here. 

# This happen during build time for the image
# Pull the latest jenkins latest
FROM jenkins/jenkins:latest
# Switch to root user
USER root
# Disable SetupWizards
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
# Make jenkins container to install necessary plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
# Copy jenkins-cli.jar to the Jenkins Container
COPY jenkins-cli.jar .
# Copy job.xml to configure the jobs
COPY job.xml .
# Copy hudson.tasks.Maven.xml to config Maven
COPY hudson.tasks.Maven.xml ./var/jenkins_home/
# Copy jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml to config Publish Over SSH
COPY jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml ./var/jenkins_home/

# Copy and set permissions to execute for createJob.sh
COPY createJob.sh .
RUN chmod +x createJob.sh 

# Get the argument from docker build and set it to publicIpV4
ARG publicIpV4

# Set it to be the env variable PUBLIC_IPV4
ENV PUBLIC_IPV4 $publicIpV4

# This happen when the container first start up
# # # Entry statement is /bin/bash -c
# ENTRYPOINT ["/bin/bash","-c"]
# Create new job in the Jenkins Container based on the job.xml when the container start up
# CMD ./createJob.sh

# For pushing on DockerHub

# build the image locally
# docker build -t jenkins_asm2_3931605:latest .

# create tag to push the image to dockerhub
# docker tag jenkins_asm2_3931605:latest anhminhbo/jenkins_asm2_3931605:latest

#  push the docker image to dockerhub
# docker push anhminhbo/jenkins_asm2_3931605:latest

# Run container based on image on Github
# docker run -d --name jenkins-container --rm -p 8080:8080 anhminhbo/jenkins_asm2_3931605:latest

# Go inside the jenkins-container
# docker exec -it jenkins-container /bin/bash

# Create new job in the Jenkins Container based on the job.xml
# java -jar jenkins-cli.jar -s http://18.215.182.164:8080/ -webSocket create-job PullFromGithubBuildFromMavenAndDeployToTomcatServer < job.xml

# Get public IP address
# dig +short myip.opendns.com @resolver1.opendns.com