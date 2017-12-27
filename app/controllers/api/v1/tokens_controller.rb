class Api::V1::TokensController < Doorkeeper::TokensController
  def create
    response = authorize_response
    headers.merge! response.headers
    self.response_body = response.body.to_json
    self.status        = response.status
  rescue Doorkeeper::Errors::DoorkeeperError => e
    user = params[:user]
    error = get_error_response_from_exception e
    self.headers.merge!  error.headers
    self.response_body = { error: 'invalid_grant', user_exists: !user.blank? }.to_json
    self.status        = error.status
  end
end
