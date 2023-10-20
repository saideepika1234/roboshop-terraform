# data.aws_ami.centos.image_id = ami-03265a0778a880afb. So replacing value code

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

resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z015993126HOUOW03F71T"
  name    = "${each.value["name"]}-dev.rsaideepika123.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}