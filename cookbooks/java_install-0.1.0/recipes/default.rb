#
# Cookbook:: java_install
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'java_install::tomcat_stop'
include_recipe 'java_install::javaremove'
include_recipe 'java_install::java1.7'
include_recipe 'java_install::tomcat_start'