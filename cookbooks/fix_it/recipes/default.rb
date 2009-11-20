require File.join(File.dirname(__FILE__), "fix.rb")

def fix_different_prefix
  file = "/usr/lib/ruby/gems/1.8/gems/chef-0.7.12/lib/chef/provider/template.rb"
  error = 'different prefix: "/" and "." (ArgumentError)'
  fix file, error do |line, line_no|
    if line_no == 57 and line.include?("Pathname.new(Chef::Config")
      "cache_file_name = Pathname.new(filename).relative_path_from(Pathname.new(::File.expand_path(Chef::Config[:file_cache_path]))).to_s"
    end
  end
end

def fix_closed_stream
  file = "/usr/lib/ruby/gems/1.8/gems/chef-0.7.12/lib/chef/provider/service/simple.rb"
  error = "closed stream (IOError)"
  fix file, error do |line, line_no|
    if line_no == 60 and line.include?("stdin.close")
      "#stdin.close"
    end
  end
end

`gem source -a http://gems.github.com`
fix_different_prefix
fix_closed_stream

# To fix    mv: cannot move `/var/lib/mysql' to `/db/mysql': No such file or directory
`mkdir -p /db/mysql/log`
