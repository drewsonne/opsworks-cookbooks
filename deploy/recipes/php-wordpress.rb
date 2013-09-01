#
# Cookbook Name:: wordpress
# Recipe:: php
#

include_recipe 'deploy'



node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::wordpress application #{application} as it is not an PHP app")
    next
  end

  wordpress_deploy_dir do
    user deploy[:user]
    path deploy[:deploy_to]  + "/current/wp-content"
  end

end

