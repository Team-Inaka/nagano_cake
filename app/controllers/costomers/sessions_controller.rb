class Costomers::SessionsController < Devise::SessionsController
# before_action :reject_user, only: [:create]
# def new
#     super
#   end

# POST /resource/sign_in
# def create
#    super
# end

# DELETE /resource/sign_out
# def destroy
#     super
# end
# protected

# def reject_costomer
#     @costomer = Costomer.find_by(email: params[:costomer][:email].downcase)
#     if @costomer
#       if (@costomer.valid_password?(params[:costomer][:password]) && (@costomer.active_for_authentication? == true))
#         flash[:error] = "退会済みです。"
#         redirect_to new_costomer_session_path
#       end
#     else
#       flash[:error] = "必須項目を入力してください。"
#     end
#   end
end

