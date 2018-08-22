module Api::V1
  class EventsController < ApiController

    before_action :verify_access_token
    def index
      @events = Event.page(params.fetch(:page, 1)).per(20)

      render json: @events.as_json(only: [:id, :title])
    end

    private

    def verify_access_token
      raise UnauthorizedError if params[:access_token] != 'zzzz'
    end

    class UnauthorizedError < StandardError; end

  end
end