ata "aws_ami" "centos"{
    owners           =["973714476881"]
    most_recent      = true
    name_regex       = "Centos-8-DevOps-Practice"
}

variable "instance_type"{
  default= "t3.micro"
}

# data.aws_ami.centos.image_id = ami-03265a0778a880afb. So replacing value code

variable "components" {
    default = [ "frontend" , "mangodb" ,"catalogue"]
}

resource "aws_instance" "instance" {
  count         =length(var.components)
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  
#data.aws_security_group.allow-all is in datasources/main.tf

  tags = {
    Name = "var.components[count.index]"
  }
}