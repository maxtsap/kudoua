set :branch, "production"
set :deploy_to, "/home/hosting_kudoua/projects/kudo"
set :rails_env, "production"

set :application, "kudo"

set :unicorn_conf, "/etc/unicorn/kudo.kudoua.rb"
set :unicorn_pid, "/var/run/unicorn/kudo.kudoua.pid"

set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use 1.8.7 do bundle exec unicorn_rails -Dc #{unicorn_conf})"

