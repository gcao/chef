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
    },
    {
      :username => "www",
      :gid => 1103,
      :uid => 1103,
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
    'mislav-will_paginate',
    'rspec',
    'SyslogLogger'
  ],
  
  :ucenter => {
    :home => "/data/apps/ucenter",
    :docroot => "/data/apps/ucenter/current"
  },
  
  :bbs => {
    :home => "/data/apps/bbs",
    :docroot => "/data/apps/bbs/current"
  },
  
  :jsgameviewer => {
    :home => "/data/apps/jsgameviewer",
    :docroot => "/data/apps/jsgameviewer/current"
  },
  
  :gocool => {
    :home => "/data/apps/gocool",
    :rails_root => "/data/apps/gocool/current",
    :rails_env => "production"
  },

  :recipes => %w(
    fix_it
    php
    php::module_curl
    php::module_gd
    php::module_mysql
    apache2
    apache2::mod_php5
    packages
    users
    sudo
    openssh
    mysql
    git
    logrotate
    memcached
    gems
    ucenter
    bbs
    jsgameviewer
    passenger_apache2
    gocool
  )
}

open(File.dirname(__FILE__) + "/dna.json", "w").write(dna.to_json)