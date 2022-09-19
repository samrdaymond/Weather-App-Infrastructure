output "samrdaymond_wa_vpcid" {
  value = aws_vpc.samrdaymond_wa_vpc.id
}

#output id's of private subnets
output  "samrdaymond_wa_private_sub_aid" {
  value = aws_subnet.samrdaymond_wa_private_sub_a.id
}

output  "samrdaymond_wa_private_sub_bid" {
  value = aws_subnet.samrdaymond_wa_private_sub_b.id
}

output  "samrdaymond_wa_private_sub_cid" {
  value = aws_subnet.samrdaymond_wa_private_sub_c.id
}



#output id's of public subnets
output  "samrdaymond_wa_public_sub_aid" {
  value = aws_subnet.samrdaymond_wa_public_sub_a.id
}

output  "samrdaymond_wa_public_sub_bid" {
  value = aws_subnet.samrdaymond_wa_public_sub_b.id
}

output  "samrdaymond_wa_public_sub_cid" {
  value = aws_subnet.samrdaymond_wa_public_sub_c.id
}