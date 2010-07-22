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
  
  :memcached => {
    :memory => 256
  },
  
  :packages => [
    "postfix",  # for sending email
    "unzip",    # for decompress files
    "htop",     # for monitoring (alternative to 'top')
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
    'SyslogLogger',
    'rubaidh-google_analytics',
    'binarylogic-searchlogic'
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
  
  :cronjobs => [
    {
      :name => "backup",
      :day => "/data/apps/sysadmin/current/backup.py"
    },
    {
      :name => "process_new_posts",
      :minute => "0,30",
      :command => "/usr/bin/curl http://localhost/app/misc/process_newer_posts"
    },
    # {
    #   :name => "update_external_games",
    #   :hour => "0,12",
    #   :command => "RAILS_ENV=production /data/apps/gocool/current/bin/update_external_games"
    # },
    {
      :name => "update_stat",
      :hour => "0,12",
      :command => "RAILS_ENV=production /usr/bin/ruby -rubygems /data/apps/gocool/current/bin/update_stat"
    },
    {
      :name => "broadcast_tom",
      :minute => "0",
      :command => "RAILS_ENV=production /usr/bin/ruby -rubygems /data/apps/gocool/current/bin/broadcast_tom"
    }
  ],

  :recipes => %w(
    fix_it
    cron
    php
    php::module_curl
    php::module_gd
    php::module_mysql
    apache2
    apache2::mod_deflate
    apache2::mod_expires
    apache2::mod_headers
    apache2::mod_php5
    apache2::mod_rewrite
    apache2::mod_proxy
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