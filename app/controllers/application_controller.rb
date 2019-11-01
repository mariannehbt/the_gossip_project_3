class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  protect_from_forgery with: :exception

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
