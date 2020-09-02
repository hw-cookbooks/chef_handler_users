#
# Cookbook:: chef_handler_users
# Recipe:: default
#
# Copyright:: 2013, Heavy Water Ops, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

chef_gem 'chef-handler-users'

chef_handler_gem_spec = Gem::Specification.find_by_name 'chef-handler-users'

chef_handler 'Chef::Handler::Users' do
  arguments [
    node['chef_handler_users']['mail_config'],
  ]
  source File.join(
    chef_handler_gem_spec.full_gem_path,
    'lib/chef-handler-users.rb')
  action :enable
end
