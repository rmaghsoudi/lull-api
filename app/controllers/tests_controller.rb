class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[show update destroy]

  def index
    @tests = Test.all
    render json: @tests
  end

  def update
    if @test.update(test_params)
      render json: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  def create
      @test = Test.create(test_params)
      if @test.save
        render json: @test
      else
        render json: @test.errors , status: :unprocessable_entity
      end
    end

  def destroy
   @test.destroy
  end
 
  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:score, :completed_at, :user_id)
  end
end