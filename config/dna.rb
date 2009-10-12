require 'rubygems'
require 'json'

dna = {
  :user => "gcao",
  :mysql_root_pass => %x(msp).strip,
  
  :users =>  [
    {
      :username => "gcao",
      :gid => 1102,
      :uid => 1102,
      :authorized_keys => [],
      :shell => "/bin/bash",
    },
    {
      :username => "gocool_app",
      :gid => 1101,
      :uid => 1101,
      :authorized_keys => [],
      :shell => "/bin/bash",
    }
  ],
  
  :packages => [
  ],
  
  :applications => [
    {
      :name => "gocool",
      :server_names => "_",
      :ports => [4000, 4001],
      :user => "gocool_app",
      :group => "gocool_app"
    }
  ],
  
  :gems => [
    "rake", 
    {:name => "mysql", :version => "2.7"}
  ],
    
  :recipes => [
    "fix_it",
    "apache2",
    "packages",
    "users",
    "sudo",
    "openssh",
    "mysql",
    "git",
    "logrotate",
    "memcached",
    "gems",
    "passenger_apache2",
    "gocool",
    "jsgameviewer"
  ]
}

open(File.dirname(__FILE__) + "/dna.json", "w").write(dna.to_json)