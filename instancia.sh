AWS_ID_GrupoSeguridad_EC2NATALIA=$(
  aws ec2 create-security-group \
  --group-name 'SecGroupEC2NATALIA' \
  --description 'Allow SSH' \
  --output text
)

aws ec2 authorize-security-group-ingress \
--group-id $AWS_ID_GrupoSeguridad_EC2NATALIA \
--ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": "0.0.0.0/0", "Description": "Allow SSH"}]}]'

aws ec2 run-instances \
--image-id ami-0dbc3d7bc646e8516 \
--count 1  \
--instance-type t2.micro \
--key-name vockey \
--region us-east-1 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=EC2NATALIA}]' \
--security-group-ids $AWS_ID_GrupoSeguridad_EC2NATALIA
