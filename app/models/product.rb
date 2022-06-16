class Product < ApplicationRecord
  has_many :users, through: :lists
  has_many :lists
end
