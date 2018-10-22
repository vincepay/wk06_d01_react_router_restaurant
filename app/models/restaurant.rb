class Restaurant < ApplicationRecord
  has_many :Menu
  has_many :MenuItem, through: :Menu 
end
