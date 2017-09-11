module Api
  module V1

    class UsersController < ApplicationController

      def index
        render json: User.all
      end

      def create
        user = User.create(user_params)
        # byebug
        render json: {message: "User was created!", status: 201, user: user}
      end

      private

      def user_params
        params.permit(:first_name, :last_name, :email, :password)
      end

    end

  end
end
