resource "aws_route_table" "rtb"{
	vpc_id 	= aws_vpc.main.id
	
	routes{
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.igw.id
	}
	
	tags = {
		Name = "MyRoute"
	}
	
}

resource "aws_route_table_association" "a"{
	subnet_id 		= aws_subnet.public[count.index].id
	route_table_id 	= aws_route_table.rtb.id
	count = 2
}


// Adding NAT Gateway to default main route table

resource "aws_default_route_table" "dfrtb"{
	vpc_id = aws_vpc.main.id
	
	routes {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_nat_gateway.natgw.id
	}
	
	tags = {
		Name = "dfrtb"
	}
}