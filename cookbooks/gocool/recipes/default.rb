include_recipe "rails"

# Mysql setup
# -----------
template "/tmp/empty-gocool-db.sql" do
  owner 'root'
  group 'root'
  mode 0644
  source "empty-db.sql.erb"
end

shared_config_dir = node[:gocool][:home] + "/shared/config"
`mkdir -p #{shared_config_dir}`

template shared_config_dir + "/database.yml" do
  source "database.yml.erb"
  mode 0644
  variables(
    :username => 'root',
    :password => node[:mysql_root_pass]
  )
end

execute "create-empty-db-for-gocool" do
  command "mysql -u root -p#{node[:mysql_root_pass]} < /tmp/empty-gocool-db.sql"
end

puts "===================== disable default site ====================="
apache_site "default" do
  enable false
end

web_app "gocool" do
  template "gocool.conf.erb"
  docroot node[:gocool][:rails_root] + "/public"
  server_name node[:fqdn]
  rails_env node[:gocool][:rails_env]
end

# service "apache2" do
#   action :restart
# end