module "vpc-dev" {
    source = "./VPC"
    cidr = "10.20.0.0/16"
    project_name = "dev-vpc"
}

module "vpc-stg" {
    source = "./VPC"
    cidr = "10.30.0.0/16"
    project_name = "stg-vpc"
}

module "vpc-prd" {
    source = "./VPC"
    cidr = "10.40.0.0/16"
    project_name = "prd-vpc"
}

module "igw-dev" {
    source = "./IGW"
    project_name = "dev-igw"
    vpc_id       = module.vpc-dev.id_vpc
}

module "igw-stg" {
    source = "./IGW"
    project_name = "stg-igw"
    vpc_id       = module.vpc-stg.id_vpc
}

module "igw-prd" {
    source = "./IGW"
    project_name = "prd-igw"
    vpc_id       = module.vpc-prd.id_vpc
}

module "subn-dev" {
    source = "./SUBNETS"
    project_name = "dev-subn"
    vpc_id       = module.vpc-dev.id_vpc
    cidr         = "10.20.0.0/24"
}

module "subn-stg" {
    source = "./SUBNETS"
    project_name = "stg-subn"
    vpc_id       = module.vpc-stg.id_vpc
    cidr         = "10.30.0.0/24"
}
module "subn-prd" {
    source = "./SUBNETS"
    project_name = "prd-subn"
    vpc_id       = module.vpc-prd.id_vpc
    cidr         = "10.40.0.0/24"
}

module "ec2-dev" {
    source = "./EC2"
    ami          = "ami-0022f774911c1d690"
    instance_type = "t2.small"
    project_name = "dev-ec2"
    subnet_id    = module.subn-dev.id_subnet
    az           = "us-east-1b"
}

module "ec2-stg" {
    source = "./EC2"
    ami          = "ami-09d56f8956ab235b3"
    instance_type = "t2.micro"
    project_name = "stg-ec2"
    subnet_id    = module.subn-stg.id_subnet
    az           = "us-east-1e"
}

module "ec2-prd" {
    source = "./EC2"
    ami          = "ami-0f095f89ae15be883"
    instance_type = "t2.medium"
    project_name = "prd-ec2"
    subnet_id    = module.subn-prd.id_subnet
    az           = "us-east-1a"
}