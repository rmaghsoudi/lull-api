class UsersController < ApplicationController

  def index
    render json: { message: "Welcome to the Lull API!"}
  end

end