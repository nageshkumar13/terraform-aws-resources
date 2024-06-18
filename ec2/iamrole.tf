# This resource creates an IAM role with the necessary permissions for SSM access of ec2.

resource "aws_iam_role" "iam-for-ec2-ssm-access" {
  name               = "iam-for-ec2-ssm-access"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [       
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"   
        },
        "Effect": "Allow",
        "Sid": ""       
      }         
    ]           
  }   
EOF        
}

# Role - Policy Attachment
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role        = aws_iam_role.iam-for-ec2-ssm-access.name
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

# Role - Policy Attachment
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role1" {
  role        = aws_iam_role.iam-for-ec2-ssm-access.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Create the aws_iam_instance_profile role from the aws_iam_role

resource "aws_iam_instance_profile" "ec2-profile" {
    name = "ssm-ec2-profile"
    role = aws_iam_role.iam-for-ec2-ssm-access.name
}

