# Start docker service
echo "Start docker service"
sudo service docker start
# Clean up docker container and image
echo "Clean up docker container and image"
# stop all processes
sudo docker stop $(docker ps -aq)

# remove all containers
sudo docker rm $(docker ps -aq)

# remove all images
sudo docker rmi --force $(docker images -aq)

# Log out and then log in to push image to DockerHub
echo "Log out and then log in to push image to DockerHub"
sudo docker logout
sudo docker login -u "anhminhbo" -p "Anhminh1234*" docker.io

# Get the public Id of current Jenkins server and get it inside the container
echo "Public id of Jenkins server is: "
dig +short myip.opendns.com @resolver1.opendns.com
publicIpV4=$(dig +short myip.opendns.com @resolver1.opendns.com)

# Build the image with the publicIp and push to Dockerhub
echo "Build the image with the publicIp and push to Dockerhub"
sudo docker build -t jenkins_asm2_3931605:latest --build-arg publicIpV4=$publicIpV4 .
sudo docker tag jenkins_asm2_3931605:latest anhminhbo/jenkins_asm2_3931605:latest
sudo docker push anhminhbo/jenkins_asm2_3931605:latest

# Clean up Dockerfile and current images
echo "Clean up docker container and image when finishing push to Dockerhub"

# remove all images
sudo docker rmi --force $(docker images -aq)
# remove Dockerfile
sudo rm -rf Dockerfile

# Run the container pull from DockerHub
echo "Run container via DockerHub"
sudo docker run -d --name jenkins-container --rm -p 8080:8080 anhminhbo/jenkins_asm2_3931605:latest

# Go inside the jenkins container and execute the createJob.sh
echo "Start a script inside Jenkins container"
sudo docker exec jenkins-container ./createJob.sh

# See logs inside jenkins container
echo "See logs inside jenkins container"
sudo docker logs jenkins-container