from troposphere import Ref, Template, Parameter, Output, Join, GetAtt, Base64
import troposphere.ec2 as ec2

# Documentation : 
# http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html
#
# To spin-up an ec2 instance we need :
#   Security group
#   AMI id and instance type
#   SSH key pair

####
# Security Group
####
sg = ec2.SecurityGroup("Staqsgx")
sg.GroupDescription = "Allow access through ports 80 and 22 to the server"
# incomming traffic
sg.SecurityGroupIngress = [
    ec2.SecurityGroupRule(IpProtocol="tcp", FromPort=22, ToPort=22, CidrIp="0.0.0.0/0"),
    #                  should this be tcp instead of hhtp ?
    ec2.SecurityGroupRule(IpProtocol="http", FromPort=80, ToPort=80, CidrIp="0.0.0.0/0"),
]

# write all to a CloudFormation template
t = Template()
t.add_resource(sg)

####
# SSH Key pair
####
# Ask for an ssh keypair when creating the env on AWS (hence parameter)
keypair = t.add_parameter(
    Parameter(
        "KeyName",
        Description = "SSH keypair name",
        Type = "String"
    )
)

####
# Instance Id and type
####
instance = ec2.Instance("Webserver")
instance.ImageId = "ami-965e6bf3"
instance.InstanceType = "t2.micro"
instance.SecurityGroups = [ Ref(sg) ]  # use what we defined earlier
instance.KeyName = Ref(keypair)
instance.UserData = Base64(
    Join('\n', [
        "#!/bin/bash",
        "sudo apt-get install apache2",
        "sudo echo '<html><head><title>Welcome</title></head><body><h1>DevOps on AWS</h1></body></html>' > /var/www/html/index.html",
        "sudo update-rc.d apache2 enable",
        "sudo service apache2 start"
    ])
)
t.add_resource(instance)

t.add_output(
    Output(
        "InstanceAccess",
        Description = "SSH command to access the instance",
        Value = Join("", ["ssh -i ~/.ssh/id-rsa ec2-user@", GetAtt(instance, "PublicDnsName")])
    )
)
t.add_output(
    Output(
        "WebUrl",
        Description = "URL of the webserver",
        Value = Join("", ["http://", GetAtt(instance, "PublicDnsName")])
    )
)

print(t.to_json())
