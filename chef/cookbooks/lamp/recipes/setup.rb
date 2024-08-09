# run as
# => in dev
#          sudo chef-apply cookbooks/lamp/default.rb
# => in prod
##       sudo chef-client -zr "lamp::default"
#mysql_service 'foo' do
#  port '3306'
#  version '5.5'
#  initial_root_password 'change me'
#  action [:create, :start]
#end

$w(mysql-server mysql-client git vim gzip gunzip ).each do |p|
    package p do
        action :install
    end
end
