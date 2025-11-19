resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "postgresdb"
  engine               = "postgres"
  engine_version       = "16"
  instance_class       = "db.t3.micro"
  username             = "myusername"
  password             =  local.db_secret
  #parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  vpc_security_group_ids = [module.security_group.id]

}

module "security_group" {
  source = "../security_group"
  name   = "security_group"
  vpc_id = var.security_group

  ingress_rules = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]

  egress_rules = []

}

data "aws_secretsmanager_secret" "secrets" {
  arn = "arn:aws:secretsmanager:eu-central-1:372499681037:secret:test-zwG6Jm"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

# Parse the secret string (assuming JSON with key "password")
locals {
  db_secret = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.current.secret_string))["super-token"]
}

output "passwordTestOutput" {
  value = local.db_secret
}