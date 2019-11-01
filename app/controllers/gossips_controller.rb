class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :is_author?, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(
      'title' => params[:title],
      'content' => params[:content],
      'user' => current_user)

    if @gossip.save
      flash[:success] = "Gossip bien créé !"
      redirect_to gossips_path
    else
      render 'new'
    end
  end
  
  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id)

    if @gossip.save
      flash[:success] = "Gossip bien modifié !"
      redirect_to gossips_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.delete
    redirect_to gossips_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def is_author?
    @gossip = Gossip.find(params[:id])
    unless @gossip.user_id == current_user.id
      flash[:danger] = "Please log in."
      redirect_to gossip_path(@gossip.id.to_s)
    end
  end

end
