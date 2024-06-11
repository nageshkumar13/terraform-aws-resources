resource "aws-instance" "nodes"{
    ami = var.ami
    instance_type = var.instance_type
}