class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def new
    @studio = Studio.new
  end

  def create
    Studio.create(studio_params)
    redirect_to '/studios'
  end

  def studio_params
    params.require(:studio).permit(:name)
  end
end
