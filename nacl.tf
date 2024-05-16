resource "aws_network_acl" "main"{
	vpc_id = aws_vpc.main.id
	
	ingress {
	
		from_port 	= 80
		to_port		= 80
		protocol	= "tcp"
		cidr_block	= "0.0.0.0/0"
		rule_no		= 100
		action 		= "allow"
	}
	
	ingress{
		from_port 	= 22
		to_port 	= 22
		protocol	= "tcp"
		cidr_block 	= "0.0.0.0/0"
		action		= "allow"
		rule_no 	= 200
	}
	
	ingress {
		from_port 	= 443
		to_port 	= 443
		protocol 	= "tcp"
		cidr_block 	= "0.0.0.0/0"
		action 		= "allow"
		rule_no 	= 300
	}
	
	egress {
		from_port 	= 80
		to_port 	= 80
		cidr_block	= "0.0.0.0/0"
		protocol	= "tcp"
		rule_no 	= 100
		action 		= "allow"
	}
	
	egress {
		from_port 	= 443
		to_port 	= 443
		cidr_block	= "0.0.0.0/0"
		protocol	= "tcp"
		rule_no 	= 200
		action 		= "allow"
	}
	
	egress {
		from_port 	= 1024
		to_port 	= 65535
		cidr_block	= "0.0.0.0/0"
		protocol	= "tcp"
		rule_no 	= 100
		action 		= "allow"
	}
	
	tags = {
		Name = "main"
	}
}

resource "aws_network_acl_association" "main" {
	network_acl_id = aws_network_acl.main.id
	subnet_id 	   = aws_subnet.public.id	
}

