CREATE TABLE foods 
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, name TEXT, description TEXT, course_type TEXT, price INT);

CREATE TABLE parties
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, table_number INT, people INT, paid BOOLEAN DEFAULT false, employee_id INT, tip FLOAT);

CREATE TABLE orders
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, party_id INT, food_id INT, comped BOOLEAN DEFAULT false);

CREATE TABLE allergens
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, name TEXT);

CREATE TABLE food_allergens
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, allergen_id INT, food_id INT);

CREATE TABLE employees
(id SERIAL PRIMARY KEY, created_at TIMESTAMP, updated_at TIMESTAMP, name TEXT);


sass -w style.scss:style.css

font-family: 'Abel', sans-serif;
font-family: 'Podkova', serif;
