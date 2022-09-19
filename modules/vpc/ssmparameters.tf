resource "aws_ssm_parameter" "vpc_id" {
  name "samrdaymond/wa/vpc/vpc_id"
  type = "string"
  overwrite = true
  value = aws_vpc.samrdaymond_wa_vpc.id
}

#private subnet id's

resource "aws_ssm_parameter" "private_sub_a_id" {
  name "samrdaymond/wa/vpc/private_sub_a_id"
  type = "string"
  overwrite = true
  value = aws_subnet.samrdaymond_wa_private_sub_a.id
}

resource "aws_ssm_parameter" "private_sub_b_id" {
  name "samrdaymond/wa/vpc/private_sub_b_id"
  type = "string"
  overwrite = true
  value = aws_subnet.samrdaymond_wa_private_sub_b.id
}

resource "aws_ssm_parameter" "private_sub_c_id" {
  name "samrdaymond/wa/vpc/private_sub_c_id"
  type = "string"
  overwrite = true
  value = aws_subnet.samrdaymond_wa_private_sub_c.id
}

#public subnet id's

resource "aws_ssm_parameter" "public_sub_a_id" {
  name "samrdaymond/wa/vpc/public_sub_a_id"
  type = "string"
  overwrite = true
  value = aws_subnet.samrdaymond_wa_public_sub_a.id
}

resource "aws_ssm_parameter" "public_sub_b_id" {
  name "samrdaymond/wa/vpc/public_sub_b_id"
  type = "string"
  overwrite = true
  value = aws_subnet.samrdaymond_wa_public_sub_b.id
}

resource "aws_ssm_parameter" "public_sub_c_id" {
  name "samrdaymond/wa/vpc/public_sub_c_id"
  type = "string"
  overwrite = true
  value = aws_subnet.samrdaymond_wa_public_sub_c.id
}