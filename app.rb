Dir["models/*.rb"].each do |file|
  require_relative file
end



class Restaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :default_currency_unit, '$'
  set :default_currency_precision, 2
  set :default_currency_separator, ' '


  enable :sessions



  get '/welcome' do 
    # erb :'static/welcome'
  end  

  get '/foods' do 
    @foods = Food.all

    erb :'foods/index'
  end

  get '/foods/new' do 
    @allergens = Allergen.all
    erb :'foods/new'
  end

  get '/foods/:id' do 
    food_id = params[:id]
    @food = Food.find(food_id)

    erb :'foods/show'
  end

  post '/foods' do
    food = Food.create(params[:food])
    @allergens = Allergen.all
    if food.valid?
    redirect to "/foods/#{food.id}"
    else 
      @food = food
      @error_messages = food.errors.messages
      erb :'foods/new'
    end
  end

  get '/foods/:id/edit' do
    @food = Food.find(params[:id]) 
    @allergens = Allergen.all
    erb :'foods/edit'
  end

  patch '/foods/:id' do
   food = Food.find(params[:id])
   food.update(params[:food])
   redirect to "/foods/#{food.id}"
  end

  delete '/foods/:id' do
    food = Food.find(params[:id])
    food.destroy 
    
    redirect to '/foods'
  end  

  get '/parties' do 
    @parties = Party.all

    erb :'parties/index'
  end

  get '/parties/new' do 
    @party = Party.new
    
    erb :'parties/new'
  end

  get '/parties/:id' do 
    party_id = params[:id]
    @party = Party.find(party_id)
    @foods = @party.foods

    erb :'parties/show'
  end

  post '/parties' do 
    # Pry.start(binding)
    party = Party.create(params[:party])  
    party.assign_table
    party.update(employee_id: session[:id])
    # party.assign_server
    redirect to "/parties/#{party.id}"
  end

  get '/parties/:id/edit' do 
    @party = Party.find(params[:id]) 
    @foods = Food.all 
    erb :'parties/edit'
  end

  patch '/parties/:id' do
    party = Party.find(params[:id])
    food_hash = params[:party][:food]
    food_hash.each do |key, value|
      value.to_i.times do 
        Order.create(food_id: key, party_id: party.id)
      end
    end
    redirect to "/parties/#{party.id}"
  end

  delete '/parties/:id' do
    party = Party.find(params[:id])
    party.destroy 
    
    redirect to '/parties'
  end

  delete '/orders/:id' do 
    order = Order.find(params[:id])
    order.destroy
    redirect to "/parties/#{order.party_id}/receipt"
  end

  patch '/orders/:id' do 
    order = Order.find(params[:id])
    order.update(comped: true)
    redirect to "/parties/#{order.party_id}/receipt"
  end


  get '/parties/:id/receipt'  do
    @party = Party.find(params[:id])
    @foods = @party.foods
    erb :'parties/receipt'
  end

  get '/parties/:id/checkout'  do
    @party = Party.find(params[:id])
    erb :'parties/checkout'
  end

  patch '/parties/:id/checkout' do
    @party = Party.find(params[:id])
    @party.update(params[:party]) 
    @party.update(paid: true)
    redirect to "/parties/#{@party.id}/checkout"
  end

  get '/employees' do
    @employee_id = session[:id] || 1

    @employees = Employee.all
    erb :'employees/index'
  end

  get '/employees/login' do
    @employees = Employee.all
    erb :'employees/login'
  end

  get '/employees/new' do 
    erb :'employees/new'
  end

  post '/employees' do 
    employee = Employee.create(params[:employee])  
    if employee.valid?
    redirect to "/employees/#{employee.id}"
    else 
      @employee = employee
      @error_messages = employee.errors.messages
      erb :'employees/new'
    end
  end

  get '/employees/:id' do
    @employee = Employee.find(params[:id])
    session[:id] = @employee.id
    erb :'employees/show'
  end

  post '/employees/:id' do
    session[:id] = params[:employee_id]
    employee = Employee.find(params[:employee_id])
    redirect to "/employees/#{employee.id}"
  end 


  get "/console" do
    Pry.start(binding)  
  end

  get "/*" do
    redirect to("/employees/login")
  end

end  