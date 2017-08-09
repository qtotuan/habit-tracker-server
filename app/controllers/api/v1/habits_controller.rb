module Api
  module V1

    class HabitsController < ApplicationController
      def index
        render json: Habit.all
      end
    end

  end
end
