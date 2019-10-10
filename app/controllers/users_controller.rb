class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    render json: { message: "Welcome to the Lull API!"}
  end

end