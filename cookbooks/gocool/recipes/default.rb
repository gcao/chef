include_recipe "rails"
include_recipe "passenger"

# Mysql setup
# -----------
template "/tmp/empty-gocool-db.sql" do
  owner 'root'
  group 'root'
  mode 0644
  source "empty-db.sql.erb"
end

execute "create-empty-db-for-gocool" do
  command "mysql -u root -p'#{`msp`]}' < /tmp/empty-gocool-db.sql"
end

web_app "gocool" do
  docroot "/data/apps/gocool/public"
  template "gocool.conf.erb"
  server_name node[:fqdn]
  rails_env "production"
end

service "apache2" do
  action :restart
end