#
# Cookbook:: mytomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

tomcat_install 'codeathon_team_c' do
  version '8.0.36'
  #install_path '/opt/tomcat_codeathon_team_c/'
  tomcat_user 'root'
  tomcat_group 'root'
  dir_mode '0755'
end
include_recipe 'tomcat::default'

template '/opt/tomcat_codeathon_team_c_8_0_36/conf/tomcat-users.xml' do
	source 'tomcatuser.erb'
end

tomcat_service 'codeathon_team_c' do
  action [:start, :enable]
  env_vars [{ 'CATALINA_PID' => '/opt/tomcat.pid' }]
  sensitive true
  tomcat_user 'root'
  tomcat_group 'root'
end

remote_file '/opt/codeathon_app.war' do
	source 'https://github.com/christian-echica/cheftraining/raw/master/codeathon_app.war'
	owner 'root'
	group 'root'
	mode '755'
end

execute 'stopWar' do
	command "wget --http-user=webadmin --http-password=p@ssw0rd!00 \"http://34.201.102.129:8080/manager/text/stop?path=/codeathon_app\" -O -"
	action :run
	retries 3
	retry_delay 5
end

execute 'undeployWar' do
	command "wget --http-user=webadmin --http-password=p@ssw0rd!00 \"http://34.201.102.129:8080/manager/text/undeploy?path=/codeathon_app\" -O -"
	action :run
	retries 3
	retry_delay 5
end

execute 'deployNewWar' do
	command "wget --http-user=webadmin --http-password=p@ssw0rd!00 \"http://34.201.102.129:8080/manager/text/deploy?war=file:/opt/codeathon_app.war&path=/codeathon_app\" -O -"
	action :run
	retries 3
	retry_delay 5
end

