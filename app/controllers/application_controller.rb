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

  def authorize_user!
    if !current_user.present?
      render json: {error: 'No user id present'}
    end
  end

  def current_user
    @current_user ||= User.find_by(id: token_user_id)
  end

  def token_user_id
    decoded_token.first['id']
  end

    def decoded_token
      if token
        begin
          # puts `----------------> JWT.decode #{JWT.decode(token, secret, true, {algorithm: algorithm})}`
          JWT.decode(token, secret, true, {algorithm: algorithm})
        rescue JWT::DecodeError
          return [{}]
        end
      else
        [{}]
      end
    end

  # The jwt token from the POST request that the user is sending with each fetch
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
