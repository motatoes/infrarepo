
resource "aws_security_group" "bastion_sg" {
  name_prefix   = "bastion-security-group"
  vpc_id = local.vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0 
    to_port     = 0 
    cidr_blocks = ["0.0.0.0/0"]
  }
}




output "bastion_security_group_id" {
  value = aws_security_group.bastion_sg.id  
}