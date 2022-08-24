#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2022B
#   Assessment: Assignment 2
#   Author: Nguyen Cuong Anh Minh
#   ID: 3931605
#   Created  date: 22/08/2022
#   Last modified: 22/08/2022
#   Acknowledgement: Acknowledge the resources that you use here.

# Change the public Id because ec2 automatically switch to new public Id
scp -o PubkeyAuthentication=no -r ./jenkins/* jenkinsmaster@:

# To ssh to a remote server without Publickey
# ssh -o PubkeyAuthentication=no

# To ssh to a remote server with the right public key
# ssh -o 'IdentitiesOnly yes' -i "asm2.pem"

# Set remote server using access token for RMIT github account
# git remote set-url origin https://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@github.com/MintCici1007/cosc2767-assignment2-website.git  