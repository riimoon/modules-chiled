resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

# My Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "MyIGW"
  }
}

# Internet Gateway Route
resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Elastic IPs for Nat Gateways
resource "aws_eip" "my_eip" {
  count = length(aws_subnet.public_subnets)

  tags = {
    Name = "MyEIP-${count.index + 1}"
  }
}

# # My NAT Gateway
# resource "aws_nat_gateway" "my_nat_gateway" {
#   count          = length(aws_subnet.public_subnets)
#   allocation_id  = aws_eip.my_eip[count.index].id
#   subnet_id      = aws_subnet.public_subnets[count.index].id

#   tags = {
#     Name = "MyNATGateway-${count.index + 1}"
#   }
# }

# # NAT Gateway Route
# resource "aws_route" "nat_gateway_route" {
#   count                  = length(aws_subnet.public_subnets)
#   route_table_id         = aws_route_table.private_route_table[count.index].id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.my_nat_gateway[count.index].id
# }