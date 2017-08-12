require 'date'

module Api
  module V1

    class HabitsController < ApplicationController
      def index
        render json: Habit.all
      end

      def create
        category = Category.find_by(name: params[:category])
        user = User.find(params[:user_id])
        # byebug
        habit = Habit.create({
          title: params[:title],
          description: params[:description],
          category: category,
          user: user
          })
        # byebug
        render json: {message: "Habit was created", status: 201, habits: Habit.all}
      end

      def update
        habit = Habit.find(params[:id])
        date = DateTime.parse(params[:selectedDate]).to_date
        if habit.dates_completed.include?(date)
          habit.dates_completed.delete(date)
          habit.update(dates_completed: habit.dates_completed)
          render json: {message: "Date was removed", status: 201, habits: Habit.all}
        else
          habit.dates_completed.push(date)
          habit.update(dates_completed: habit.dates_completed)
          render json: {message: "Habit was updated", status: 201, habits: Habit.all}
        end
      end
    end

    private

    def habit_params
      params.require(:habit).permit(:title, :description, :user_id, :category)
    end

  end
end
