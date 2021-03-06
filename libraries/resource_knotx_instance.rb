#
# Cookbook Name:: knotx
# Resource:: knotx_instance
#
# Copyright 2016 Karol Drazek
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

class Chef
  class Resource
    class KnotxInstance < Chef::Resource
      provides :knotx_instance

      attr_accessor :installed
      attr_accessor :reconfigured
      attr_accessor :download_path
      attr_accessor :install_dir
      attr_accessor :lib_dir
      attr_accessor :conf_dir
      attr_accessor :tmp_dir
      attr_accessor :dist_checksum
      attr_accessor :dist_checksum_path
      attr_accessor :full_id
      attr_accessor :log_dir
      attr_accessor :source
      attr_accessor :filename

      # JVM opts
      attr_accessor :jvm_config_path
      attr_accessor :min_heap
      attr_accessor :max_heap
      attr_accessor :extra_opts
      attr_accessor :gc_opts
      attr_accessor :jmx_enabled
      attr_accessor :jmx_ip
      attr_accessor :jmx_port
      attr_accessor :debug_enabled
      attr_accessor :debug_port

      # SOURCE opts
      attr_accessor :knotx_init_cookbook
      attr_accessor :knotx_init_path
      attr_accessor :knotx_systemd_cookbook
      attr_accessor :knotx_systemd_path
      attr_accessor :knotx_ulimit_cookbook
      attr_accessor :knotx_ulimit_path
      attr_accessor :knotx_conf_cookbook
      attr_accessor :knotx_conf_path
      attr_accessor :logback_xml_cookbook
      attr_accessor :logback_xml_path

      def initialize(id, run_context = nil)
        super

        @resource_name = :knotx_instance
        @allowed_actions = :install
        @action = :install

        @id = name
        @version = '1.2.1'
        @source = nil
        @install_dir = nil
        @log_dir = nil
        @custom_logback = true
      end

      def id(arg = nil)
        set_or_return(:id, arg, kind_of: String)
      end

      def version(arg = nil)
        set_or_return(:version, arg, kind_of: String)
      end

      def source(arg = nil)
        set_or_return(:source, arg, kind_of: String)
      end

      def install_dir(arg = nil)
        set_or_return(:install_dir, arg, kind_of: String)
      end

      def log_dir(arg = nil)
        set_or_return(:log_dir, arg, kind_of: String)
      end

      def custom_logback(arg = nil)
        set_or_return(:custom_logback, arg, kind_of: [TrueClass, FalseClass])
      end
    end
  end
end
