class EmployeesController < ApplicationController
  enable :sessions

  get '/' do
    @employee_id = session[:id] || 1

    @employees = Employee.all
    erb :'employees/index'
  end

  get '/login' do
    @employees = Employee.all
    erb :'employees/login'
  end

  get '/new' do 
    erb :'employees/new'
  end

  post '/' do 
    employee = Employee.create(params[:employee])  
    if employee.valid?
    redirect to "/#{employee.id}"
    else 
      @employee = employee
      @error_messages = employee.errors.messages
      erb :'employees/new'
    end
  end

  get '/:id' do
    @employee = Employee.find(params[:id])
    session[:id] = @employee.id
    erb :'employees/show'
  end

  post '/:id' do
    session[:id] = params[:employee_id]
    employee = Employee.find(params[:employee_id])
    redirect to "/#{employee.id}"
  end 

end