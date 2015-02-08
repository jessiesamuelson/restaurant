class Employee < ActiveRecord::Base
  has_many :parties

  validates :name, uniqueness: {message: "There is already an employee with that name"}  
end