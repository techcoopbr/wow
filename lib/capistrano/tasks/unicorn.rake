set :unicorn_user,    'wow'
set :unicorn_workers, 2

namespace :unicorn do
  desc "Setup Unicorn initializer and app configuration"
  task :setup do
    on roles(:app) do
      set :unicorn_pid,    "#{release_path}/tmp/pids/unicorn.pid"
      set :unicorn_config, "#{release_path}/config/unicorn.rb"
      set :unicorn_log,    "#{shared_path}/log/unicorn.log"

      template "unicorn.rb", fetch(:unicorn_config)
      template "unicorn_init.sh", "#{release_path}/config/unicorn_init"
      execute :chmod, '+x', "#{release_path}/config/unicorn_init"
    end
  end
  after "deploy:symlink:linked_files", "unicorn:setup"

  %w[restart].each do |command|
    desc "#{command} unicorn"
    task command do
      on roles(:app) do
        execute "#{release_path}/config/unicorn_init #{command}"
      end
    end
    after "deploy:#{command}", "unicorn:#{command}"
  end
  after 'deploy:published', 'restart'
end
