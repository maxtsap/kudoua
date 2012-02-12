set :deploy_to, "/home/hosting_kudoua/projects/skudo"
set :rails_env, "staging"

set :unicorn_conf, "/etc/unicorn/skudo.kudoua.rb"
set :unicorn_pid, "/var/run/unicorn/skudo.kudoua.pid"
