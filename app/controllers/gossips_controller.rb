class GossipsController < ApplicationController

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
      'user' => User.first)

    if @gossip.save
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
      user_id: User.first.id)
    redirect_to gossips_path
  end

  def destroy
  end

end
