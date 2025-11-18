data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = [var.ami_filter_owner]

  filter {
    name   = "name"
    values = [var.ami_filter_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "example" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.type
  vpc_security_group_ids = var.security_groups

    tags = merge(
        {
            Terraform = "true"
        },
        var.tags
    )
}