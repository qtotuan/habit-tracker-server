class ApplicationController < ActionController::API
  def index
    @categories = Category.all
    render json: @categories
  end

  private

  # JWT method encode takes in three parameters and returns a hashed string
  def issue_token payload
    JWT.encode(payload, secret, algorithm)
  end

  # This method will be called before the auth#show method to intercept that #show renders
  # in case the user is not found in the database
  def authorize_user!
    if !current_user.present?
      render json: {error: 'No user id present'}
    end
  end

  # The method is called by auth#show which renders the json object with the user info
  def current_user
    @current_user ||= User.find_by(id: token_user_id)
  end

  # Helper method for current_user
  def token_user_id
    decoded_token.first['id']
  end

  # Helper method for token_user_id
  def decoded_token
    if token
      begin
        JWT.decode(token, secret, true, {algorithm: algorithm})
      rescue JWT::DecodeError
        return [{}]
      end
    else
      [{}]
    end
  end

  # The jwt token from the POST request that the user is sending with each fetch
  # Helper method for decoded_token
  def token
    request.headers['Authorization']
  end

  # Provide a string that will serve as the secret signing key which is used for hashing the header and payload
  def secret
    "learnlovecode"
  end

  # Algo for jwt encoding
  def algorithm
    "HS256"
  end

end
