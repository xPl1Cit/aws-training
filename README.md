Welcome to my AWS Enablement Capstone Project created on my local machine. My Name is Andreas Lorenz.

This project was created with the following instructions:

1. 
2. 
3. 
4. 
5. 

This Terraform Project utilizes 4 stages and several modules to run a clean Wordpress website. 

These are the steps you need to run to get the project up and running in your AWS account.

1. Install the following tools on your machine: AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), Terraform (https://developer.hashicorp.com/terraform/install), Git (https://git-scm.com/downloads)
2. Make sure you have your AWS security credentials in form of an access key with an ID and Secret (https://docs.aws.amazon.com/IAM/latest/UserGuide/access-key-self-managed.html)
2. Utilize git clone on this repository (https://github.com/xPl1Cit/aws-training)
3. Change into the folder you just copied.
4. Navigate to this path /stages/dev to end up in the development stage of this project. Other stages will connect to my Terraform Cloud Account and can therefore not be used locally on your machine.
5. Inside the /dev folder please run the following command to initialize the Terraform project: "terraform init"
6. To run the project you will need to authenticate your AWS CLI with the AWS API. To achieve this, please run the following command: "aws configure". You will need the following values (Access Key ID: "{Your Access Key ID}", Access Key Secret: "{Your Access Key Secret}", Default Region: "us-east-1", Output Format: "json")
7. Now that Terraform is initialized, please run the following command to run the Terraform project: "terraform apply -auto-approve"
8. When Terraform is up and running, please log into your AWS console to make sure all the resources were deployed successfully.
9. Upon completion of the "apply" command, Terraform should output the DNS Name of the Wordpress website you will be able to access now.
10. Have fun with the deployment!