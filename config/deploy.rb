set :user, "bbahry"
set :domain, "vultureman.dreamhost.com"
set :project, "movieshelf"
set :application, "movieshelf.brentbahry.com"
set :applicationdir, "/home/#{user}/#{application}"

# set :application, "movieshelf"
# set :repository,  "#{user}@#{domain}/~/git/movieshelf.git"
set :repository, "/home/#{user}/git/movieshelf.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_via, :remote_cache
set :deploy_to, application
set :git_enable_submodules, 1  # for rails vendored plugins
set :branch, "master"
set :git_shallow_clone, 1
set :scm_verbose, true

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

set :scm_command, "~/packages/bin/git" #updated version of git on server in user directory
set :local_scm_command, "/opt/local/bin/git" #correct path to local git

set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false