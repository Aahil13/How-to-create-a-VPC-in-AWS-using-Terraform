# How to create a VPC in AWS using Terraform

## Description

This project provides an infrastructure setup for creating a [Virtual Private Cloud (VPC)](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html) on [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io/). It includes the configuration for creating four subnets (two private and two public) in two availability zones, along with necessary resources such as Elastic IP, NAT gateway, Internet Gateway, route tables, and security groups.

To create a VPC on AWS using Terraform, you can follow the step-by-step process outlined below. This guide assumes you have already set up Terraform and have the necessary credentials and access to an AWS account.

## Prerequisites

- [Terraform installed](https://developer.hashicorp.com/terraform/downloads) and configured
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configured

## Getting Started

To use this project, follow the steps below:

1. Clone the repository to your local machine:

    ```shell
    git clone https://github.com/Aahil13/How-to-create-a-VPC-in-AWS-using-Terraform.git
    ```

2. Change into the project directory:

    ```shell
    cd repo-name
    ```

3. Open the `VPC.tf` file and modify the necessary values. You should also define the following variables in the `variables.tf` file:
   - `var.region`: Specify the AWS region where you want to create the VPC.
   - `var.availablity_zone1` and `var.availablity_zone2`: Specify the availability zones for the subnets.

4. Initialize Terraform by running the following command:

    ```shell
    terraform init
    ```

5. Create the infrastructure on AWS by running the following command:

    ```shell
    terraform apply
    ```

    Review the plan and type **yes** to confirm and create the resources.

6. Once the `terraform apply` command completes, Terraform will output the details of the created VPC, subnets, and other resources. You can also verify the creation of resources in the AWS Management Console.

## Cleaning Up

To clean up and destroy the created resources when they are no longer needed, follow these steps:

1. Change into the project directory, if you are not already there:

    ```shell
    cd repo-name
    ```

2. Run the following command to destroy the resources created by Terraform:

    ```shell
    terraform destroy
    ```

    Review the plan and type **yes** to confirm the destruction of resources.

3. Verify in the AWS Management Console that all the resources have been successfully deleted.

## Contributing

Contributions are welcome! If you find any issues or want to enhance this project, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
