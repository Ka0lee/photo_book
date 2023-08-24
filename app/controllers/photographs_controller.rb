class PhotographsController < ApplicationController
  before_action :authenticate_user!,except:[:index, :show]
  before_action :set_photograph,only:[:show, :edit, :update, :destroy]
  before_action :contributor_confirmation,only:[:edit, :destroy, :search]
  


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
      binding.pry
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    if @photograph.update(photograph_params)
      redirect_to photograph_path(@photograph)
    else
      render :edit
    end
  end

  def destroy
    if @photograph.destroy
      redirect_to root_path
    else
      flash.now[:alert] = '写真の保存に失敗しました。'
      redirect_to root_path
    end
  end

  def search
    @photographs = Photograph.search(params[:keyword])
  end


private

  def photograph_params
    params.require(:photograph).permit(:title, :date, :diary, :category_id, {images: []}).merge(user_id: current_user.id)
  end

  def set_photograph
    @photograph = Photograph.find(params[:id]) 
  end

  def contributor_confirmation
    redirect_to root_path unless @photograph.user == current_user
  end

end
