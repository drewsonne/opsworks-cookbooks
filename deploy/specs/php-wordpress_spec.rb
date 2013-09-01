require 'minitest/spec'

describe_recipe 'deploy::php' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it 'configures wordpress' do
    node[:deploy].each do |application, deploy|
      if deploy[:application_type] = 'php'

        it 'configures wordpress permissions' do
          directory(node[:deploy][application][:deploy_to] + '/wp-content').must_exist(:mode, '0770').with(:owner, deploy[:user]).and(:group, deploy[:group])
        end

      end
    end
  end
end
