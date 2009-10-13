include_recipe "rails"
# include_recipe "passenger"

# Mysql setup
# -----------
template "/tmp/empty-gocool-db.sql" do
  owner 'root'
  group 'root'
  mode 0644
  source "empty-db.sql.erb"
end

execute "create-empty-db-for-gocool" do
  command "mysql -u root -p#{node[:mysql_root_pass]} < /tmp/empty-gocool-db.sql"
end

# web_app "gocool" do
#   template "gocool.conf.erb"
#   docroot node[:gocool][:rails_root] + "/public"
#   server_name node[:fqdn]
#   rails_env = node[:gocool][:rails_env]
# end
# 
# service "apache2" do
#   action :restart
# end