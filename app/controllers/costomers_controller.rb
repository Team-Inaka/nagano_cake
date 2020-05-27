class CostomersController < ApplicationController
	def show
        @costomer = current_costomer
    end

    def edit
    	@costomer = Costomer.find(params[:id])
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
end
