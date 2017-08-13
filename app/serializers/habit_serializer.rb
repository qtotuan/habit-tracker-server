class HabitSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :dates_completed
  belongs_to :category
  belongs_to :user
end
