#
# Cookbook Name:: load_balanced_tomcat_sample
# Recipe:: haproxy_config
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

template "#{node['haproxy']['conf_dir']}/haproxy.cfg" do
  source 'haproxy.cfg.erb'
  owner node['haproxy']['user']
  group node['haproxy']['group']
  variables :tomcat_servers => search(:node, 'role:tomcat_sample_server')
end
