class EmailConfirmationController < ApplicationController
  def confirm_email
    user = Spree::User.find_by_confirmation_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      user = Spree::User.find_by_unconfirmed_email(params[:id])
      if user
        flash[:error] = "Your email has already been activated."
        redirect_to login_path
      else
        flash[:error] = "User does not exist."
        redirect_to login_path
      end
    end
  end
end
