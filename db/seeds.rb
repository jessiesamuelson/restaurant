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

ActiveRecord::Base.connection.execute <<-SQL
DROP TABLE IF EXISTS foods; CREATE TABLE foods 
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, name TEXT, description TEXT, course_type TEXT, price INT);

DROP TABLE IF EXISTS parties; CREATE TABLE parties
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, table_number INT, people INT, paid BOOLEAN DEFAULT false, employee_id INT, tip FLOAT);

DROP TABLE IF EXISTS orders; CREATE TABLE orders
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, party_id INT, food_id INT, comped BOOLEAN DEFAULT false);

DROP TABLE IF EXISTS allergens; CREATE TABLE allergens
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, name TEXT);

DROP TABLE IF EXISTS food_allergens; CREATE TABLE food_allergens
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, allergen_id INT, food_id INT);

DROP TABLE IF EXISTS employees; CREATE TABLE employees
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, name TEXT);
SQL

# CREATE FOODS
[
  {
    name: "Steak tartare",
    description: "Steak tartare with capers, cornichons, and violet mustard",
    course_type: "Appetizer",
    price: 14
  },
  {
    name: "Marinated beets",
    description: "Marinated beets with pickled pear, goat cheese, and pistachio",
    course_type: "Appetizer",
    price: 12
  },
  {
    name: "Pork Chop",
    description: "Bourbon glazed pork chop with cheddar grits, roasted apples, and pecans",
    course_type: "Entree",
    price: 35
  },
  {
    name: "Trout",
    description: "Pennsylvania Trout with crushed yukons, and a bacon-dill vinaigrette",
    course_type: "Entree",
    price: 39
  },
  {
    name: "Bread pudding",
    description: "Croissant bread pudding with dried fruit compote, and maple-bacon ice cream",
    course_type: "Dessert",
    price: 11
  },
  {
    name: "Carrot cake",
    description: "Carrot cake with pineapple, cream cheese frosting, and rum-raisin ice cream",
    course_type: "Dessert",
    price: 10
  }        
].each do |food|
  Food.create( food )
end

#CREATE PARTIES
[
  {
    table_number: 11,
    people: 2,
    paid: false,
    employee_id: 1
  },
  {
    table_number: 12,
    people: 4,
    paid: false,
    employee_id: 2
  }, 
  {
    table_number: 13,
    people: 8,
    paid: false,
    employee_id: 1
  }   
].each do |party|
  Party.create( party )
end

#CREATE ORDERS
[
  {
    party_id: 1,
    food_id: 1
  },
  {
    party_id: 1,
    food_id: 2
  },  
  {
    party_id: 1,
    food_id: 3
  },
  {
    party_id: 1,
    food_id: 4
  },
  {
    party_id: 1,
    food_id: 5
  },
  {
    party_id: 1,
    food_id: 6
  },
  {
    party_id: 2,
    food_id: 1
  },
  {
    party_id: 2,
    food_id: 2
  },
  {
    party_id: 2,
    food_id: 3
  },
  {
    party_id: 2,
    food_id: 4
  },
  {
    party_id: 2,
    food_id: 4
  },
  {
    party_id: 2,
    food_id: 4
  },
  {
    party_id: 2,
    food_id: 4
  },
  {
    party_id: 2,
    food_id: 6
  },            
  {
    party_id: 3,
    food_id: 1
  },
  {
    party_id: 3,
    food_id: 1
  },
  {
    party_id: 3,
    food_id: 1
  },
  {
    party_id: 3,
    food_id: 1
  },
  {
    party_id: 3,
    food_id: 1
  }, 
  {
    party_id: 3,
    food_id: 2
  },
  {
    party_id: 3,
    food_id: 2
  },
  {
    party_id: 3,
    food_id: 2
  },
  {
    party_id: 3,
    food_id: 2
  }, 
  {
    party_id: 3,
    food_id: 3,
  },
  {
    party_id: 3,
    food_id: 3,
  },
  {
    party_id: 3,
    food_id: 3,
  },
  {
    party_id: 3,
    food_id: 3,
  },  
  {
    party_id: 3,
    food_id: 3,
  },
  {
    party_id: 3,
    food_id: 5
  },
  {
    party_id: 3,
    food_id: 6
  },
    {
    party_id: 3,
    food_id: 6
  },
    {
    party_id: 3,
    food_id: 6
  }
].each do |order|
  Order.create( order )
end


[
  {
    name: "soy"
  },
  {
    name: "dairy"
  },
  {
    name: "gluten"
  },
  {
    name: "nuts"
  }
].each do |allergen|
  Allergen.create( allergen )
end

[
  {
    allergen_id: 2,
    food_id: 1
  },
  {
    allergen_id: 2,
    food_id: 2
  },
  {
    allergen_id: 1,
    food_id: 2
  },
  {
    allergen_id: 2,
    food_id: 3
  },
  {
    allergen_id: 3,
    food_id: 4
  },
  {
    allergen_id: 3,
    food_id: 4
  },
  {
    allergen_id: 4,
    food_id: 5
  },
  {
    allergen_id: 2,
    food_id: 6
  }
].each do | food_allergen |
  FoodAllergen.create( food_allergen )
end


[
  {
    name: "Jessie"
  },
  {
    name: "Anya"
  },
  {
    name: "Izabella"
  },
  {
    name: "Vienne"
  }
].each do |employee|
  Employee.create( employee )
end