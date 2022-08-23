#!/bin/sh
echo "Wait for 20s before creating jobs"
sleep 20
java -jar jenkins-cli.jar -s http://$PUBLIC_IPV4:8080/ -webSocket create-job PullFromGithubBuildFromMavenAndDeployToTomcatServer < job.xml