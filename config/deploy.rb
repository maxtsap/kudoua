# У вас должна быть настроена авторизация ssh по сертификатам
require 'bundler/capistrano'

set :application, "kudo"

# настройка системы контроля версий и репозитария, по умолчанию - git, если используется иная система версий, нужно изменить значение scm
set :scm, :git
set :repository,  "git@github.com:maxtsap/kudoua.git"

set :user, "hosting_kudoua"
set :use_sudo, false
set :deploy_to, "/home/hosting_kudoua/projects/kudo"


role :web, "lithium.locum.ru"   # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"   # This may be the same as your `Web` server
role :db,  "lithium.locum.ru", :primary => true # This is where Rails migrations will run

# эта секция для того, чтобы вы не хранили доступ к базе в системе контроля версий. Поместите dayabase.yml в shared,
# чтобы он копировался в нужный путь при каждом выкладывании новой версии кода
# так лучше с точки зрения безопасности, но если не хотите - прсото закомментируйте этот таск


# Если хотите поместить конфиг в shared и не хранить его в системе контроя версий - раскомментируйте следующие строки

#after "deploy:update_code", :copy_database_config

#task :copy_database_config, roles => :app do
#  db_config = "#{shared_path}/database.yml"
#  run "cp #{db_config} #{release_path}/config/database.yml"
#end
set :bundle_cmd, "rvm use 1.8.7 do bundle"
set :bundle_dir, "~/.gem"
set :bundle_without, [:development, :test]
set :bundle_flags, "--deployment"

set :unicorn_conf, "/etc/unicorn/kudo.kudoua.rb"
set :unicorn_pid, "/var/run/unicorn/kudo.kudoua.pid"



  set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use 1.8.7 do bundle exec unicorn_rails -Dc #{unicorn_conf})"

after 'deploy:update_code' do
  bundle_cmd     = fetch(:bundle_cmd, "bundle")
  bundle_flags   = fetch(:bundle_flags, "--deployment --quiet")
  bundle_dir     = fetch(:bundle_dir, File.join(fetch(:shared_path), 'bundle'))
  bundle_gemfile = fetch(:bundle_gemfile, "Gemfile")
  bundle_without = [*fetch(:bundle_without, [:development, :test])].compact

  args = ["--gemfile #{File.join(fetch(:current_release), bundle_gemfile)}"]
  args << "--path #{bundle_dir}" unless bundle_dir.to_s.empty?
  args << bundle_flags.to_s
  args << "--without #{bundle_without.join(" ")}" unless bundle_without.empty?


  run_cmd = "cd \"#{fetch(:current_release)}\"; "
  run_cmd << "#{bundle_cmd} install #{args.join(' ')}"

  run run_cmd, :shell => '/bin/bash'
end


# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end

