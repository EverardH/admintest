require 'bundler/capistrano'

default_run_options[:pty] = false
ssh_options[:forward_agent] = true
set :use_sudo, false
set :user, "railzy"

set :application, "admintest"
set :repository,  "git@github.com:EverardH/admintest.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, 'master'
set :git_shallow_clone, 1
set :deploy_via, :remote_cache
set :copy_compression, :bz2
set :rails_env, 'production'
set :deploy_to, "/home/railzy/ror.komunita.mx/#{application}"

role :web, "ror.komunita.mx/#{application}"                          # Your HTTP server, Apache/etc
role :app, "ror.komunita.mx/#{application}"                          # This may be the same as your `Web` server
role :db,  "ror.komunita.mx/#{application}", :primary => true # This is where Rails migrations will run
role :db,  "ror.komunita.mx/#{application}"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end