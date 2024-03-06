# output "vpc_id" {
#   value = aws_vpc.shs_vpc.id
# }

output "public_subnet_0" {
  value = aws_subnet.public_subnets[0].id
}

output "public_subnet_1" {
  value = aws_subnet.public_subnets[1].id
}

output "public_subnet_2" {
  value = aws_subnet.public_subnets[2].id
}

# output "private_subnet_ids" {
#   value = aws_subnet.private_subnet[*].id
# }