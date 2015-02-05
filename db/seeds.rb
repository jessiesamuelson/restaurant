require 'pg'
require 'active_record'
require 'pry'

Dir["../models/*.rb"].each do |file|
  require_relative file
end

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "restaurant_db",
  host: "localhost" 
)

#CREATE FOODS
[
  {
    name: "Burrata with vine tomatoes and balsamic reduction",
    course_type: "Appetizer",
    price: 14,
    allergens: "dairy"
  },
  {
    name: "Wedge salad with tamari glazed pork belly, blue cheese, and pickled carrots and daikon radish",
    course_type: "Appetizer",
    price: 15,
    allergens: "dairy, soy, eggs"
  },
  {
    name: "Ribeye with carmalized sweet onions served with black garlic spinach and Hasselback sweet potato with a brown butter sabayon",
    course_type: "Entree",
    price: 39,
    allergens: "dairy, gluten"
  },
  {
    name: "Roasted rack of lamb served with truffled Israeli couscous with wild mushrooms, Meyer lemon, and basil",
    course_type: "Entree",
    price: 44,
    allergens: "dairy"
  },
  {
    name: "Candied grapefruit with hazelnut sorbet",
    course_type: "Dessert",
    price: 11,
    allergens: "dairy, gluten"
  },
  {
    name: "Espresso creme brulee with fresh berries",
    course_type: "Dessert",
    price: 13,
    allergens: "dairy"
  }        
].each do |food|
  Food.create( food )
end

# #CREATE PARTIES
# [
#   {
#     table_number: 11,
#     people: 2,
#     paid: true
#   },
#   {
#     table_number: 12,
#     people: 4,
#     paid: false
#   }, 
#   {
#     table_number: 13,
#     people: 8,
#     paid: false
#   }   
# ].each do |party|
#   Party.create( party )
# end

# #CREATE ORDERS
# [
#   {
#     party_id: 1,
#     food_id: 1,
#     number_ordered: 1
#   },
#   {
#     party_id: 1,
#     food_id: 2,
#     number_ordered: 1
#   },  
#   {
#     party_id: 1,
#     food_id: 3,
#     number_ordered: 1
#   },
#   {
#     party_id: 1,
#     food_id: 4,
#     number_ordered: 1
#   },
#   {
#     party_id: 1,
#     food_id: 5,
#     number_ordered: 1
#   },
#   {
#     party_id: 1,
#     food_id: 6,
#     number_ordered: 1
#   },
#   {
#     party_id: 2,
#     food_id: 1,
#     number_ordered: 1
#   },
#   {
#     party_id: 2,
#     food_id: 2,
#     number_ordered: 1
#   },
#   {
#     party_id: 2,
#     food_id: 3,
#     number_ordered: 1
#   },
#   {
#     party_id: 2,
#     food_id: 4,
#     number_ordered: 3
#   },
#   {
#     party_id: 2,
#     food_id: 6,
#     number_ordered: 1
#   },            
#   {
#     party_id: 3,
#     food_id: 1,
#     number_ordered: 5
#   }, 
#   {
#     party_id: 3,
#     food_id: 2,
#     number_ordered: 4
#   }, 
#   {
#     party_id: 3,
#     food_id: 3,
#     number_ordered: 6
#   },
#   {
#     party_id: 3,
#     food_id: 5,
#     number_ordered: 1
#   },
#   {
#     party_id: 3,
#     food_id: 6,
#     number_ordered: 4
#   }
# ].each do |order|
#   Order.create( order )
# end


