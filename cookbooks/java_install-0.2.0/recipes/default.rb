#
# Cookbook:: java_install
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'java_install::tomcat_stop'
include_recipe 'java_install::java1.8'
include_recipe 'java_install::tomcat_start'
