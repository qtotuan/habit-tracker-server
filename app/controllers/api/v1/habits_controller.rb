module Api
  module V1

    class HabitsController < ApplicationController
      def index
        render json: Habit.all
      end

      def create
        puts "Creating"
      end

      def update

        byebug
        binding.pry
      end
    end

  end
end
