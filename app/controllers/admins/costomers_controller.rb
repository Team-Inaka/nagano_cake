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
    params.require(:costomer).permit(:family_name, :middle_name, :family_name_kana, :middle_name_kana, :zipcode, :address, :phone_number, :email, :password, :password_confirmation, :is_withdraw)
 end
  	
end
