Spree::UserSessionsController.class_eval do
  # Override
  # def create
  #   user_email = params.dig(:spree_user, :email)
  #   user_password = params.dig(:spree_user, :password)

  #   status, obj = EnlogyAuth::Services::Login.run(user_email, user_password)

  #   if status == :ok
  #     sign_in obj
  #   end

  #   if spree_user_signed_in?
  #     respond_to do |format|
  #       format.html do
  #         flash[:success] = Spree.t(:logged_in_succesfully)
  #         redirect_back_or_default(after_sign_in_path_for(spree_current_user))
  #       end
  #       format.js { render success_json }
  #     end
  #   else
  #     respond_to do |format|
  #       format.html do
  #         flash.now[:error] = obj
  #         render :new
  #       end
  #       format.js do
  #         render json: { error: obj },
  #           status: :unprocessable_entity
  #       end
  #     end
  #   end
  # end
end