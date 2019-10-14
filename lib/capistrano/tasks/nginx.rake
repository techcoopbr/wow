namespace :nginx do
  desc 'Links nginx config file'
  task :setup do
    on roles(:web) do
      template  'nginx_unicorn.conf',
        "#{release_path}/config/nginx.conf"
    end
  end
  after 'deploy:symlink:linked_files', 'nginx:setup'
end
