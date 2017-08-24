class HabitSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :dates_completed, :frequency, :category
  belongs_to :user
end
