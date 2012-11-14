require 'bundler/capistrano'
require 'capistrano-rbenv'

set :dns_name, "198.61.213.140"

set :application, "modeliter"
set :repository,  "git://github.com/den4j/modeliter.ru.git"

role :web, dns_name                          # Your HTTP server, Apache/etc
role :app, dns_name                          # This may be the same as your `Web` server
role :db,  dns_name, primary: true           # This is where Rails migrations will run

set :deploy_to, "/data/#{application}"

set :rails_env, 'production'
set :branch, 'master'
set :use_sudo, false

set :user, 'deploy'
# set :password, 'ssh_password'
set :port, 22

#set :deploy_via, :remote_cache
set :keep_releases, 5
set :scm, :git
set(:rake_cmd) {"#{bundle_cmd rescue 'bundle'} exec rake RAILS_ENV=#{rails_env}"}
set :rbenv_ruby_version, '1.9.3-p286'

before  'deploy:assets:precompile', 'db:create_symlink'
after   'deploy:create_symlink', 'deploy:cleanup'

# local precompile assets
before  'deploy:finalize_update', 'deploy:assets:symlink'
after   'deploy:update_code', 'deploy:assets:precompile'

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, roles: :app, except: { no_release: true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :db do
  desc "Make symlink for database.yml"
  task :create_symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
    run "ln -nfs #{shared_path}/spree_robokassa/config/initializers/activemerchant.rb #{latest_release}/spree_robokassa/config/initializers/activemerchant.rb"
  end
end