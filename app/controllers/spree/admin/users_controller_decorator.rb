Spree::Admin::UsersController.class_eval do
  
  def validate
    if @user.validate!
      flash[:success] = t('spree.actions.validate')
      redirect_to admin_users_path
    end
  end
  
end