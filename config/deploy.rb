# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'pi_dashboard'
set :repo_url, 'https://github.com/shawzt/pi_dashboard.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/app/www/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('puma.rb')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

set :rbenv_ruby, File.read('.ruby-version').strip

set :puma_bind, "tcp://0.0.0.0:8080"
set :puma_threads, [0, 8]

namespace :deploy do

  after :finished, :restart_clockwork do
    on roles(:app) do
      within release_path do
        args = "-c clock.rb -d . --log-dir=./log --pid-dir=./tmp/pids --log restart"
        execute :bundle, :exec, :clockworkd, args
      end
    end
  end

end
