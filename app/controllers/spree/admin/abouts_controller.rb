class Spree::Admin::AboutsController < Spree::Admin::ResourceController
  
  def index
    if Spree::About.count == 1
      redirect_to edit_admin_about_path(Spree::About.first)
    else
      @about = Spree::About.all
    end
  end

  def create
    @about = Spree::About.new(permitted_resource_params)
    if @about.save
      flash[:success] = "About Successfully Created"
      redirect_to location_after_save
    else
      flash[:error] = @about.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

end
