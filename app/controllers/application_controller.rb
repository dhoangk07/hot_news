class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # for learning
  unless Rails.env.test?
    before_action :authenticate_user!
  end
end
