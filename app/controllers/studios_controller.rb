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

  def show
    @studio = Studio.find(params[:id])
  end

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    @studio = Studio.find(params[:id])
    @studio.update(studio_params)
    redirect_to '/studios'
  end

  def destroy
    @studio = Studio.find(params[:id])
    @studio.destroy
    flash[:notice] = "Studio deleted successfully"
    redirect_to '/studios'
  end

  def studio_params
    params.require(:studio).permit(:name)
  end
end
