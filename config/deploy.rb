lock "~> 3.11.0"

set :application, "hot-news"
set :repo_url, "https://github.com/dhoangk07/hot_news.git"

set :passenger_restart_with_touch, true
set :deploy_to, "/home/deploy/hot_news"

role :resque_worker, "206.189.152.101"
role :resque_scheduler, "206.189.152.101"

set :workers, { "default" => 1, "high" => 1, '*' => 1 }
set :resque_environment_task, true
set :resque_log_file, "log/resque.log"

after "deploy:restart", "resque:restart"

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

