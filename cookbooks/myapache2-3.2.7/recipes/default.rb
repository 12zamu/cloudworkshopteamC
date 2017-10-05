#
# Cookbook:: myapache2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


#include_recipe 'apache2::default'

package 'httpd'


all_app_nodes = search('node','role:appserver')
all_app_nodes.each do |app_node|
	node.default['TOMCAT_SERVER'] = app_node['cloud']['public_ipv4']
end

template '/etc/httpd/conf/httpd.conf' do
	variables({
		:TOMCATSERVER => node['TOMCAT_SERVER']
		})
	source 'httpdconf.erb'
    notifies :restart, 'service[httpd]'
end

service 'httpd' do
  action [:enable, :start]
end

