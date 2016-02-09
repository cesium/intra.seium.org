set :application, 'intra.seium.org'
set :repo_url, 'https://github.com/cesium/intra.seium.org.git'

set :deploy_to, '/home/chalkos/intra.seium.org'

set :linked_files, %w{config/database.yml db/production.sqlite3}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Runs rake db:seed'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  #after :publishing, 'deploy:seed'
  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
