class EntriesController < ApplicationController
  before_action :authenticate_user!
end