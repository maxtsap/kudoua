set :unicorn_conf, "/etc/unicorn/kudo.kudoua.rb"
set :unicorn_pid, "/var/run/unicorn/kudo.kudoua.pid"

set :branch, 'production'
set :deploy_to, "/home/hosting_kudoua/projects/kudo"
set :rails_env, "production"
