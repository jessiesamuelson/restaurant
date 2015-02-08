class Food < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :parties, through: :orders
  has_many :food_allergens
  has_many :allergens, through: :food_allergens


  validates :name, uniqueness: {message: "There is already a food with that name"}  
    
  validates :price, numericality: {message: "A price must be a number"}  

  validates :description, presence: {message: "Please include a description"}

end