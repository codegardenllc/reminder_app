lock '3.2.1'

set :application, 'reminder_app'
set :repo_url, 'git@github.com:codegardenllc/reminder_app.git'
set :deploy_to, '/srv/apps/reminder_app'
set :branch, 'master'
set :scm, :git
set :format, :pretty
set :rvm_ruby_version, 'ruby-2.2.2@reminder_app'

set :ssh_options, {
  user: 'artem',
  forward_agent: true,
  port: 22
}

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'delayed_job:restart'
    on roles(:app), in: :sequence, wait: 5 do
      execute "touch tmp/restart.txt"
    end
  end

  after :publishing, :restart
end