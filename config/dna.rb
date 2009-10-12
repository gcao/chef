require 'rubygems'
require 'json'

dna = {
  :user => "gcao",
  :mysql_root_pass => %x(msp).strip,
  
  :users =>  [
    {
      :username => "gocool_app",
      :gid => 1101,
      :uid => 1101,
      :authorized_keys => [],
      :shell => "/bin/bash",
    },
    {
      :username => "gcao",
      :gid => 1102,
      :uid => 1102,
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
      #:custom_nginx_conf => File.read(File.dirname(__FILE__), "../config/custom/some-custom-nginx.conf")
    }
  ],
  
  :gems => [
    "rake", 
    {:name => "mysql", :version => "2.7"}
  ],
  
  # :ebs_volumes => [
  #   {:device => "sdq1", :path => "/data"},
  #   {:device => "sdq2", :path => "/db"}
  # ],
  
  :cronjobs => [
    {:name => "a_dumb_task",
     :minute => 30,
     :hour => nil,
     :day => nil,
     :month => nil,
     :weekday => nil,
     :user => "mr_app",
     :command => "date >> /data/look_cron_works.txt"
    }
  ],
  
  :recipes => [
    "fix_it",
    "apache2",
    "packages",
    "users",
    "sudo",
    "openssh",
    # "ec2-ebs",
    "mysql",
    "git",
    "logrotate",
    # "nginx",
    "memcached",
    # "cron",
    "gems",
    "passenger_apache2",
    "gocool",
    "jsgameviewer"
  ]
}

open(File.dirname(__FILE__) + "/dna.json", "w").write(dna.to_json)