resource "aws_subnet" "public"{
	vpc_id = aws_vpc.main.id
	cidr_block = var.cidr[count.index]
	availability_zone = var.az[count.index]
	count = 2
	
	tags = {
		Name = "public-sub"
	}
}


resource "aws_subnet" "private"{
	vpc_id = aws_vpc.main.id
	cidr_block = "10.0.3.0/24"
	availability_zone = "ap-south-1b"
	
	tags = {
		Name = "private-sub"
	}
}

data "aws_subnet" "sid"{
	filter{
		name = "vpc_id"
		values = [aws_vpc.main.id]
	}
	
	tags = {
		Name = "Public"
	}
}
