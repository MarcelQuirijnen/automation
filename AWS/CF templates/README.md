#Generate template
`python webserver-cf.py > webserver.template`

# upload template to AWS Cloudformation
- Login to your AWS account and browse to Cloudformation
- Click `Create new stack` button
- Select the `Upload a template to Amazon S3`
- Click `Next`
- Give it a StackName
- Specify the KeyName Parameter as mentioned in the python script
- Click `Next`
- Fill out any of the optional values
- Click `Next`
- Check the estimated costs if that concerns you
- Click `Create`

# When 'Create Complete'
- Congrats! You spun up an AWS instance with a template. We'll script this later.
- The `Outputs` tab should show 2 key/value pairs
- The first shows the instance SSH access command, something like
  `ssh -i ~/.ssh/id_rsa ec2-user@ec2-54-213-177-65.us-east-2.compute.amazonaws.com`
- The second shows the URL of the server for http access, something like
   `http://ec2-54-213-177-65.us-east-2.compute.amazonaws.com`
- try 'em out

We now know how to use infrastructure as code (IaC), ie provisioning systems through machine-readable definition files, rather than physical hardware configuration.
IaC supports IaaS, but should not be confused with it.
