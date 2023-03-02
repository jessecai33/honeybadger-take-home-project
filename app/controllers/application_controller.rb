class ApplicationController < ActionController::API
  before_action :authenticate
  before_action :validate_json_payload

  private

  def authenticate
    # TODO: Implement authentication
    true
  end

  def validate_json_payload
    ActiveSupport::JSON.decode(request.body.read)
  rescue ActiveSupport::JSON.parse_error
    render json: { error: 'Invalid JSON payload' }, status: :bad_request
  end
end
