config = YAML.load_file(File.expand_path("../deploy_config.yml", __FILE__))

set :application, "oncentral-flats"
set :repository,  "git@github.com:SCPR/oncentral-flats.git"

set :scm, :git
set :deploy_via, :remote_cache
set :deploy_to, config['deploy_to']
set :keep_releases, 5
set :user, "oncentral"
set :use_sudo, false

role :web, config['server']
role :app, config['server']

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :restart do
    # Because it's just flats being served by nginx,
    # we don't need to do anything
  end
end
