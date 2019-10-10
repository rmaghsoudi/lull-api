class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: %i[show update destroy]

  def index
    @entries = Entry.all
    render json: @entries
  end

  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def create
      @entry = Entry.create(entry_params)
      if @entry.save
        render json: @entry
      else
        render json: @entry.errors , status: :unprocessable_entity
      end
    end

  def destroy
   @entry.destroy
  end
 
  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :content, :created_at, :updated_at, :user_id)
  end
end