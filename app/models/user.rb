class User < ApplicationRecord
  has_many :habits
  has_many :categories, through: :habits
end
