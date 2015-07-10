#
# Cookbook Name:: load_balanced_tomcat_sample
# Recipe:: tomcat_sample_app
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

remote_file "#{node['tomcat']['webapp_dir']}/sample.war" do
  source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  mode '0755'
end
