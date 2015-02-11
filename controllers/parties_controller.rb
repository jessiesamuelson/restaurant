class PartiesController < ApplicationController

  get '/' do 
    @parties = Party.all

    erb :'parties/index'
  end

  get '/new' do 
    @party = Party.new
    
    erb :'parties/new'
  end

  get '/:id' do 
    party_id = params[:id]
    @party = Party.find(party_id)
    @foods = @party.foods

    erb :'parties/show'
  end

  post '/' do 
    party = Party.create(params[:party])  
    party.assign_table
    if session[:id]
      party.update(employee_id: session[:id])
    else
      party.update(employee_id: 1)
    end
    redirect to "/#{party.id}"
  end

  get '/:id/edit' do 
    @party = Party.find(params[:id]) 
    @foods = Food.all 
    erb :'parties/edit'
  end

  patch '/:id' do
    party = Party.find(params[:id])
    party.update(people: params[:party][:people])
    food_hash = params[:party][:food]
    food_hash.each do |key, value|
      value.to_i.times do 
        Order.create(food_id: key, party_id: party.id)
      end
    end
    redirect to "/#{party.id}"
  end

  delete '/:id' do
    party = Party.find(params[:id])
    party.destroy 
    
    redirect to '/parties'
  end

  get '/:id/receipt'  do
    @party = Party.find(params[:id])
    @foods = @party.foods
    erb :'parties/receipt'
  end

  get '/:id/checkout'  do
    @party = Party.find(params[:id])
    erb :'parties/checkout'
  end

  patch '/:id/checkout' do
    @party = Party.find(params[:id])
    @party.update(params[:party]) 
    @party.update(paid: true)
    redirect to "/#{@party.id}/checkout"
  end
end