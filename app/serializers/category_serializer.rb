class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :habits
  has_many :users, through: :habits
end
