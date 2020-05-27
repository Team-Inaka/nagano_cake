class Admins::CostomersController < ApplicationController
before_action :authenticate_admin!	

  def index
  	  @costomers = Costomer.all
  end

  def show
  	@costomer = Costomer.find(params[:id])
  end

  def edit
  	@costomer = Costomer.find(params[:id])
  end

  def update
    @costomer = Costomer.find(params[:id])
    @costomer.update(costomer_params)
    redirect_to admins_costomer_path
  end

private

def costomer_params
  params.require(:costomer).permit(:name, :email)
end
  	
end
