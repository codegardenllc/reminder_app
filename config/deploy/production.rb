set :rails_env, 'production'

role :app, %w{artem@45.55.53.94}
role :web, %w{artem@45.55.53.94}
role :db,  %w{artem@45.55.53.94}

server '45.55.53.94', user: 'artem', roles: %w{web app db}