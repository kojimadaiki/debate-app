# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

set :application, "debate-app"
set :repo_url, "git@github.com:kojimadaiki/debate-app.git"


set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5' 

set :ssh_options, auth_methods: ['publickey'],
                                  keys: ['~/.ssh/debate-app-4046.pem'] 

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end