set :rails_env, :production
set :branch, 'master'

# roles and servers
server ENV['PRODUCTION_SERVER_IP'], user: ENV['PRODUCTION_DEPLOY_USER'], roles: %w(app db web)
role :app, %w(000.000.000.000)
role :web, %w(000.000.000.000)
role :db,  %w(000.000.000.000)
