class PhotographsController < ApplicationController
  before_action :authenticate_user!,except:[:index]

  def index
    @photographs = Photograph.includes(:user)
    if user_signed_in?
      @photograph = @photographs.where(user_id: current_user.id)
    end
  end

  def new
    @photograph = Photograph.new

  end

  def create
    @photograph = Photograph.new(photograph_params)
    if @photograph.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @photograph = Photograph.find(params[:id])
  end

private
def photograph_params
  params.require(:photograph).permit(:title, :info, :date, {images: []}).merge(user_id: current_user.id)
  
end


end
