require File.join(File.dirname(__FILE__), "default.rb")

def fix_different_prefix
  file = "/usr/lib/ruby/gems/1.8/gems/chef-0.7.12/lib/chef/provider/template.rb"
  error = 'different prefix: "/" and "." (ArgumentError)'
  fix file, error do |line, line_no|
    if line_no == 57 and line.include?("Pathname.new(Chef::Config")
      "cache_file_name = Pathname.new(filename).relative_path_from(Pathname.new(::File.expand_path(Chef::Config[:file_cache_path]))).to_s"
    end
  end
end

fix_different_prefix