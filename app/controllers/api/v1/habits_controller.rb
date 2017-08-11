require 'date'

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
        # byebug
        habit = Habit.find(params[:id])
        date = DateTime.parse(params[:selectedDate]).to_date
        if habit.dates_completed.include?(date)
          habit.dates_completed.delete(date)
          habit.update(dates_completed: habit.dates_completed)
          render json: {message: "Date was removed", status: 201}
        else
          habit.dates_completed.push(date)
          habit.update(dates_completed: habit.dates_completed)
          render json: {message: "Habit was updated", status: 201, updated_habit: habit}
        end
      end
    end

  end
end
