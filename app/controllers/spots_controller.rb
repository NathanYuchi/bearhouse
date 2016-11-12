class SpotsController < ApplicationController
  def show
    @spot = Spot.find(params[:id])
  end

  def index
    @spot = Spot.all
  end

  def new
    if current_user == nil
      flash[:error] = "Log in to continue"
      redirect_to root_path
    else
      @spot = Spot.new
    end
  end

  def create
    @spot = Spot.new
    @spot.address = params[:spot][:address]
    @spot.beds = params[:spot][:beds]
    @spot.baths = params[:spot][:baths]
    @spot.description = params[:spot][:description]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @spot.owner = @current_user.uid

    if @spot.save
      redirect_to spots_path(:id => @spot.id)
    else
      flash[:error] = @spot.errors.full_messages.to_sentence
      redirect_to spots_new_path
    end
  end
end
