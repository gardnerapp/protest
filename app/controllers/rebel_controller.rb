class RebelController < ApplicationController
  def new
    @rebel = Rebel.new
    @count = Rebel.count
  end
  def create
    @rebel = Rebel.new(rebel_params)
    if @rebel.save
      flash[:success] = "You've Taken Action!"
      redirect_to about_path
    else
      redirect_to error_path
    end
  end

  private

  def rebel_params
    params.require(:rebel).permit(:name, :email)
  end


end
