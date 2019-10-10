class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, only: %i[show update destroy]

  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def update
    if @exercise.update(exercise_params)
      render json: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  def create
      @exercise = Exercise.create(exercise_params)
      if @exercise.save
        render json: @exercise
      else
        render json: @exercise.errors , status: :unprocessable_entity
      end
    end

  def destroy
   @exercise.destroy
  end
 
  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :content, :user_id)
  end
end