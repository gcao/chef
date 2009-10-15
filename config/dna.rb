require 'rubygems'
require 'json'

dna = {
  :user => "gcao",
  :mysql_root_pass => `msp`.strip,
  
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
  
  :gems => [
    "rake", 
    {:name => "mysql", :version => "2.7"},
    "calendar_date_select",
    "thoughtbot-paperclip",
    "haml",
    'chriseppstein-compass',
    'mislav-will_paginate'
  ],
  
  :gocool => {
    :home => "/data/apps/gocool",
    :rails_root => "/data/apps/gocool/current",
    :rails_env => "production"
  },
  
  :jsgameviewer => {
    :docroot => "/data/apps/jsgameviewer/releases/current"
  },

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