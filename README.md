Welcome to my AWS Enablement Capstone Project created on my local machine. My Name is Andreas Lorenz.

Terraform:

The first project in the terraform folder was created with the following instructions:

1. Build an environment to run Terraform 
2. Install the Terraform software and ensure it works properly
3. Test the environment by creating a simple virtual machine 
4. Build a website similar to the Space Invaders site you built in class by reusing modules
5. Put a copy of your code in Git, then destroy the infrastructure; leave the environment intact

This Terraform Project utilizes 4 stages and several modules to run a clean Wordpress website. 

These are the steps you need to run to get the project up and running in your AWS account.

1. Install the following tools on your machine: AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), Terraform (https://developer.hashicorp.com/terraform/install), Git (https://git-scm.com/downloads)
2. Make sure you have your AWS security credentials in form of an access key with an ID and Secret (https://docs.aws.amazon.com/IAM/latest/UserGuide/access-key-self-managed.html)
2. Utilize git clone on this repository (https://github.com/xPl1Cit/aws-training)
3. Change into the folder you just copied.
4. Navigate to this path /terraform/stages/dev to end up in the development stage of this project. Other stages will connect to my Terraform Cloud Account and can therefore not be used locally on your machine.
5. Inside the /dev folder please run the following command to initialize the Terraform project: "terraform init"
6. To run the project you will need to authenticate your AWS CLI with the AWS API. To achieve this, please run the following command: "aws configure". You will need the following values (Access Key ID: "{Your Access Key ID}", Access Key Secret: "{Your Access Key Secret}", Default Region: "us-east-1", Output Format: "json")
7. Now that Terraform is initialized, please run the following command to run the Terraform project: "terraform apply -auto-approve"
8. When Terraform is up and running, please log into your AWS console to make sure all the resources were deployed successfully.
9. Upon completion of the "apply" command, Terraform should output the DNS Name of the Wordpress website you will be able to access now.
10. Have fun with the Wordpress deployment!

default wordpress login:
username: admin
password: admin_password

Special use cases:
In order to utilize the Basion host a private key is generated and placed inside the folder of the key-pair module. Use this private key when trying to access any of the wordpress instances for maintenance on the EFS files.



Kubernetes:

The second project in the terraform folder was created with the following instructions:

1. Create and configure your deployment environment
2. Containerize and store your images in a repository
3. Deploy an Amazon EKS cluster
4. Deploy your application, including a backend database
5. Test updating your application using rolling updates

This Kubernetes cluster will run an Angular App connecting to a Spring Boot Microservice that runs with a PostgreSQL database. (I chose this as I am using this tech stack for a personal project aswell)

These are the steps you need to run to get the project up and running in your AWS account.

1. Install the following tools on your machine: AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), Docker (https://docs.docker.com/engine/install/), Kubectl (https://kubernetes.io/docs/tasks/tools/), EKSCTL (https://eksctl.io/installation/), Helm(https://helm.sh/docs/intro/install/), Git (https://git-scm.com/downloads) -> On AWS EC2 utilize the install-ec2-tools.sh script
2. Make sure you have your AWS security credentials in form of an access key with an ID and Secret (https://docs.aws.amazon.com/IAM/latest/UserGuide/access-key-self-managed.html)
3. Utilize git clone on this repository (https://github.com/xPl1Cit/aws-training)
4. To run the project you will need to authenticate your AWS CLI with the AWS API. To achieve this, please run the following command: "aws configure". You will need the following values (Access Key ID: "{Your Access Key ID}", Access Key Secret: "{Your Access Key Secret}", Default Region: "us-east-1", Output Format: "json")
5. Change into the folder you just copied. In here please change into the kubernetes folder
6. Here you will find many delete and deploy scripts.
7. To initially deploy the Angular, Springboot, PostgreSQL Tech stack please utilize the perform-initial-setup.sh script (You can provide a Region and a version as inline arguments, defaults to "us-east-1" and "latest")
8. This will deploy the complete application and at the end it will give you the link for the Angular app to access.
9. Note: It will take a couple of minutes after the script is done for the load balancer to receive its full DNS propagation, only then will you be able to access the application.
10. Have fun with the Angular deployment!

Special use cases:
In order to switch between blue and green deployments (initial setup deploys blue by default) please utilize the scripts deploy-blue-deployment.sh and deploy-green-deployment.sh
You can manually add or remove any deployments, scripts etc by utilizing the given scripts. Redeployment is also possible with the given scripts.