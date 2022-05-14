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