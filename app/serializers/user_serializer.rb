class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email
  has_many :habits
  has_many :categories, through: :habits
end
