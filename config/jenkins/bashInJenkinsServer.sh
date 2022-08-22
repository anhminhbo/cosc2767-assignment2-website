# Start docker service
sudo service docker start
# Clean up docker container and image
sudo docker stop jenkins-container;
sudo docker rm jenkins-container;
sudo docker rmi --force jenkins_asm2_3931605:latest
sudo docker rmi --force anhminhbo/jenkins_asm2_3931605:latest
sudo docker rmi --force jenkins/jenkins:latest

# Log out and then log in to push image to DockerHub
sudo docker logout
sudo docker login -u "anhminhbo" -p "Anhminh1234*" docker.io
sudo docker build -t jenkins_asm2_3931605:latest .
sudo docker tag tomcat_asm2_3931605:latest anhminhbo/tomcat_asm2_3931605:latest
sudo docker push anhminhbo/jenkins_asm2_3931605:latest

# Clean up Dockerfile and current images
sudo docker rmi --force jenkins_asm2_3931605:latest
sudo docker rmi --force anhminhbo/jenkins_asm2_3931605:latest
sudo docker rmi --force jenkins/jenkins:latest
sudo docker image prune
sudo rm -rf Dockerfile

# Run the container pull from DockerHub
sudo docker run -d --name jenkins-container --rm -p 8080:8080 anhminhbo/jenkins_asm2_3931605:latest

# Go inside the jenkins container
sudo docker exec -it jenkins-container /bin/bash