module Api
  module V1

    class UsersController < ApplicationController

      def index
        render json: User.all
      end

      def create
        user = User.create(user_params)
        # debugger
        render json: {message: "User was created!", status: 201, user: user}
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
      end

    end

  end
end
