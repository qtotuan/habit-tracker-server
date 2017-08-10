module Api
  module V1

    class HabitsController < ApplicationController
      def index
        render json: Habit.all
      end

      def update
        puts "this is working damn it"
        byebug
        binding.pry
      end
    end

  end
end
