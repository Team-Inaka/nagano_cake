class Costomers::CostomersController < ApplicationController
	def show
        @costomer = Costomer.find(params[:id])
    end

    def edit
    	@costomer = Costomer.find(params[:id])
    end

    def update
       @costomer = Costomer.find(params[:id])
    if @costomer.update(costomer_params)
        redirect_to costomers_costomer_path(@costomer)
    else
        render "edit"
    end
  end

    def withdraw
        @costomer = current_costomer
        
    end

    def hide
        @costomer = Costomer.find(params[:id])
        #is_withdrawカラムにフラグを立てる(defaultはfalse)
        @costomer.update(is_withdraw: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
   

private
  def costomer_params
    params.require(:costomer).permit(:family_name, :middle_name, :family_name_kana, :middle_name_kana, :zipcode, :address, :phone_number, :email, :password, :password_confirmation)
  end
end 