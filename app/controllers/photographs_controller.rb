class PhotographsController < ApplicationController
  before_action :authenticate_user!,except:[:index]

  def index
    @photograph = Photograph.includes(:user)
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

private
def photograph_params
  params.require(:photograph).permit(:title, :info, :date, :image).merge(user_id: current_user.id)
  
end


end
