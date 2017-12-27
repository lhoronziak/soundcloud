class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing, with: :missing_param_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :user_not_authorized

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  private

  def missing_param_error(exception)
    render status: :bad_request, json: { status: 400, error: exception.message }
  end

  def record_not_found(exception)
    render status: :not_found, json: { status: 404, error: exception.message }
  end

  def user_not_authorized(exception)
    render status: :forbidden, json: { status: 403, error: exception.message }
  end
end
