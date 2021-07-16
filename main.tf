provider "aws" {
    access_key = "xxxxyyy"
    secret_key = "xxxxxxxxyyyyyyyy"
    region = "us-east-1"
}

module devopsb16-testvpc {
  source = "./modules/vpc"
vpc_cidr = "10.120.0.0/16"
vpc_name = "devopsb16-testvpc"
IGW_name = "devopsb16-testigw"
public_subnet1_cidr = "10.120.1.0/24"
public_subnet2_cidr = "10.120.2.0/24"
public_subnet3_cidr = "10.120.3.0/24"
public_subnet1_name = "test-subnet-1"
public_subnet2_name = "test-subnet-2"
public_subnet3_name = "test-subnet-3"
Main_Routing_Table  = "Main_routing_table"
environment  = "test"
}

module devopsb16-ec2 {
  source = "./modules/ec2"
imagename = "ami-09e67e426f25ce0d7"
subnetid = "${module.devopsb16-testvpc.subnet1id}"
sgid = "${module.devopsb16-testvpc.sgid}"
servername = "test-env-server-1"
}

module devopsb16-prodvpc {
  source = "./modules/vpc"
vpc_cidr = "10.150.0.0/16"
vpc_name = "devopsb16-prodvpc"
IGW_name = "devopsb16-prodigw"
public_subnet1_cidr = "10.150.1.0/24"
public_subnet2_cidr = "10.150.2.0/24"
public_subnet3_cidr = "10.150.3.0/24"
public_subnet1_name = "prod-subnet-1"
public_subnet2_name = "prod-subnet-2"
public_subnet3_name = "prod-subnet-3"
Main_Routing_Table  = "Main_routing_table"
environment  = "prod"
}