class ApplicationController < ActionController::Base
  before_filter :prepare_exception_notifier
  protect_from_forgery with: :exception
  layout :layout_by_resource
  # for learning
  unless Rails.env.test?
    before_action :authenticate_user!
  end

  private
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      :current_user => current_user
    }
  end
end
