require 'date'

module Api
  module V1

    class HabitsController < ApplicationController
      def index
        render json: Habit.all
      end

      def create
        # Find category or create new one
        if (params[:habit][:newCategory] != "")
          category = Category.create(name: params[:habit][:newCategory])
         else
          category = Category.find_by(name: params[:habit][:category])
        end

        user = User.find_by(email: params[:user_email])
        habit = Habit.create({
          title: params[:habit][:title],
          description: params[:habit][:description],
          category: category,
          user: user,
          frequency: params[:habit][:frequency]
        })
        render json: Habit.all
      end

      def update
        category = Category.find_by(name: params[:category])
        habit = Habit.find(params[:id])
        if params[:selectedDate]
          date = DateTime.parse(params[:selectedDate]).to_date
          if habit.dates_completed.include?(date)
            habit.dates_completed.delete(date)
            habit.update(dates_completed: habit.dates_completed)
            render json: Habit.all
          else
            habit.dates_completed.push(date)
            habit.update(dates_completed: habit.dates_completed)
            render json: Habit.all
          end
        else
          puts "WE ARE GOING TO UPDATE THE HABIT!"
          # debugger
          habit.update({
            title: params[:title],
            description: params[:description],
            category: category,
            frequency: params[:frequency]
            })
          render json: Habit.all
        end
      end

      def destroy
        habit = Habit.find(params[:id])
        # debugger
        habit.destroy
        render json: Habit.all
      end

      private

      def habit_params
        params.require(:habit).permit(:title, :description, :category, :frequency)
      end

    end # Class
  end # V1
end # API
