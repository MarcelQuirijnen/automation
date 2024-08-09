# source this file in your current env
export AWS_ACCESS_KEY_ID=`grep -i aws_access_key_id ~/.aws/credentials|xargs|cut -d' ' -f3`
export AWS_SECRET_ACCESS_KEY=`grep aws_secret_access_key ~/.aws/credentials|xargs|cut -d' ' -f3`

# if ec2 files are installed in /etc/ansible, root perms are required to use them
# as well as having boto installed at the system level
# this way, we do not need root permissions
export ANSIBLE_HOSTS=$PWD/ec2.py
# Edit the regions/regions_exclude variables in this .ini file
export EC2_INI_PATH=$PWD/ec2.ini
