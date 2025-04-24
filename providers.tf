terraform {
    cloud {
        organization = "aws-training-al"

        workspaces {
            name = "AWS-Training-AL"
        }
    }


    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.95.0"
        }
    }
}

provider "aws" {
    region = var.region
}