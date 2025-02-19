#
# Cookbook Name:: zip_app
# Recipe:: data_bag
#
# Copyright 2011, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

bag       = node['zip_app']['data_bag']
bag_item  = begin
  data_bag_item(*bag)
rescue => ex
  Chef::Log.info("Data bag #{bag.join('/')} not found (#{ex}), so skipping")
  Hash.new
end

node['zip_app']['apps'] += Array(bag_item['zip_apps'])
include_recipe 'zip_app'
