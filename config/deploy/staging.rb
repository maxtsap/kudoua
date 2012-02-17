set :deploy_to, "/home/hosting_kudoua/projects/skudo"
set :rails_env, "staging"
set :application, "skudo"

set :unicorn_conf, "/etc/unicorn/skudo.kudoua.rb"
set :unicorn_pid, "/var/run/unicorn/skudo.kudoua.pid"

set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use 1.8.7 do bundle exec unicorn_rails -Dc #{unicorn_conf})"
