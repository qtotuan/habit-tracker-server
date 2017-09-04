class User < ApplicationRecord
  has_many :habits
  has_many :categories, through: :habits

  has_secure_password
end
