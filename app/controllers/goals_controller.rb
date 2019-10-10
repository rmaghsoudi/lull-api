class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: %i[show update destroy]

  def index
    @goals = Goal.all
    render json: @goals
  end

  def update
    if @goal.update(goal_params)
      render json: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  def create
      @goal = Goal.create(goal_params)
      if @goal.save
        render json: @goal
      else
        render json: @goal.errors , status: :unprocessable_entity
      end
    end

  def destroy
   @goal.destroy
  end
 
  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :completed?, :user_id)
  end
end