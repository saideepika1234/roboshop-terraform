data "aws_ami" "centos"{
    owners           =["973714476881"]
    most_recent      = true
    name_regex       = "Centos-8-DevOps-Practice"
}

variable "instance_type"{
  default= "t3.micro"
}

# data.aws_ami.centos.image_id = ami-03265a0778a880afb. So replacing value code

variable "components" {
    default = {
      frontend ={
        name = "frontend"
        instance_type = "t3.micro"
      }
      mongodb ={
        name = "mongodb"
        instance_type = "t3.micro"
      }
      catalogue ={
        name = "catalogue"
        instance_type = "t3.micro"
      }
      cart ={
        name = "cart"
        instance_type = "t3.micro"
      }
      user ={
        name = "user"
        instance_type = "t3.small"
      }
      rabbitmq ={
        name = "rabbitmq"
        instance_type = "t3.small"
      }
      redis ={
        name = "redis"
        instance_type = "t3.micro"
      }
      payment ={
        name = "payment"
        instance_type = "t3.micro"
      }
      shipping ={
        name = "shipping"
        instance_type = "t3.micro"
      }
      dispatch ={
        name = "dispatch"
        instance_type = "t3.micro"
      }
    
    }
}

resource "aws_instance" "instance" {
  for_each      =var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  
#data.aws_security_group.allow-all is in datasources/main.tf

  tags = {
    Name = each.value["name"]
  }
}