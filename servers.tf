data "aws_ami" "centos"{
    owners           =["973714476881"]
    most_recent      = true
    name_regex       = "Centos-8-DevOps-Practice"
}

output "ami"{
    value = data.aws_ami.centos.image_id
}

variable "instance_type"{
  default= "t3.micro"
}

# data.aws_ami.centos.image_id = ami-03265a0778a880afb. So replacing value code

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  
#data.aws_security_group.allow-all is in datasources/main.tf

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "frontend-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "cart-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "catalogue-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "dispatch" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "dispatch"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "dispatch-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.dispatch.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "mongodb-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "mysql-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "payment-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "redis-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "rabbitmq-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "shipping-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "var.instance_type"
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z015993126HOUOW03F71T"
  name    = "user-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}