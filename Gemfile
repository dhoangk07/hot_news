source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails'                  , '~> 5.1.4'
gem 'puma'                   , '~> 3.7'
gem 'devise'
gem 'bcrypt'                 , '~> 3.1.7'
gem 'pg'                     , '~> 0.18'  
gem 'sass-rails'             , '~> 5.0'
gem 'uglifier'               , ' >= 1.3.0'
gem 'coffee-rails'           , '~> 4.2'
gem 'turbolinks'             , '~> 5'
gem 'jbuilder'               , '~> 2.5'
gem 'jquery-rails'
gem "font-awesome-rails"
gem 'bootstrap'              , '~> 4.1.3'
gem 'simple_form'            , '~> 4.0', '>= 4.0.1'
gem 'watir'
gem 'webdrivers'
gem 'kaminari'
gem 'exception_notification'
gem 'slack-notifier'
gem 'paperclip'              , '~> 6.1'
gem 'aws-sdk'                , '~> 3.0', '>= 3.0.1'
gem 'figaro'                 , '~> 1.1', '>= 1.1.1'
gem 'resque-scheduler'       , '~> 4.3', '>= 4.3.1'


group :development, :test do
  gem 'byebug'               , platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'             , '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'          , '~> 3.7'
  gem 'rails-controller-testing'
  gem 'whenever'             , require: false
  gem "feedjira"          
  gem 'faker'                , '~> 1.9', '>= 1.9.1'
  gem 'letter_opener'        , '~> 1.6'
end

group :development do
  gem 'letter_opener'          , '~> 1.6'
  gem 'web-console'          , '>= 3.3.0'
  gem 'listen'               , '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'           , '~> 3.11'
  gem 'capistrano-rails'     , '~> 1.4'
  gem 'capistrano-rbenv'     , '~> 2.1', '>= 2.1.4'
  gem 'capistrano-passenger' , '~> 0.2.0'
  gem 'capistrano-resque'    , '~> 0.2.3', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
