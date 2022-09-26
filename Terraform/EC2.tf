module "Bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Bastion"

  ami                    = "ami-0149b2da6ceec4bb0"
  instance_type          = "t2.micro"
  key_name               = "ssh"
  monitoring             = true
  vpc_security_group_ids = [module.bastion.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
module "Jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Jenkins"

  ami                    = "ami-0149b2da6ceec4bb0"
  instance_type          = "t2.micro"
  key_name               = "ssh"
  monitoring             = true
  vpc_security_group_ids = [module.Private_SG.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "App" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "App"

  ami                    = "ami-0149b2da6ceec4bb0"
  instance_type          = "t2.micro"
  key_name               = "ssh"
  monitoring             = true
  vpc_security_group_ids = [module.Private_SG.security_group_id]
  subnet_id              = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}