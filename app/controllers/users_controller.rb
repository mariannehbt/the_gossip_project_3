class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'description' => params[:description],
      'email' => params[:email],
      'age' => params[:age],
      'city_id' => params[:city_id],
      'password' => params[:password])
    
    if @user.save
      log_in(@user)
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
