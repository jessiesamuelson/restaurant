Dir["models/*.rb"].each do |file|
  require_relative file
end



class Restaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/welcome' do 
    "Welcome"
    # erb :'static/welcome'
  end  

  get '/foods' do 
    @foods = Food.all

    erb :'foods/index'
  end

  get '/foods/new' do 
    @food = Food.new

    erb :'foods/new'
  end

  get '/foods/:id' do 
    food_id = params[:id]
    @food = Food.find(food_id)

    erb :'foods/show'
  end

  post '/foods' do 
    food = Food.create(params[:food])
    
    redirect to "/foods/#{food.id}"
  end

  get '/foods/:id/edit' do
    @food = Food.find(params[:id]) 
    
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
# _______________________________________________
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
    party = Party.create(params[:party])
    
    redirect to '/parties/#{party.id}'
  end

  get '/parties/:id/edit' do |id|
    @party = Party.find(id) 
    
    erb :'parties/edit'
  end

  patch '/parties/:id' do
    party = Party.find(params[:id])
    party.update(params[:party]) 
    
    redirect to '/parties/#{party.id}'
  end

  delete '/parties/:id' do
    party = Party.find(params[:id])
    party.destroy 
    
    redirect to '/parties'
  end

  get '/parties/:id/receipt'  do
    @party = Party.find(params[:id])
    erb :'parties/receipt'
  end

  get "/console" do
    Pry.start(binding)  
  end

  get "/*" do
    redirect to("/welcome")
  end

end  