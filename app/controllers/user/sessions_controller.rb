# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
      if @user.valid_password?(params[:user][:password])
        elsif unless @user.valid_password?(params[:user][:password])
          flash[:alert] = 'パスワードが違います'
          redirect_to new_user_session_path
        end
      else
        flash[:alert] = '退会済みです。再度新規登録を行なってください。'
        redirect_to root_path
      end
  end

end
