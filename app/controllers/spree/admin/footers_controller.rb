class Spree::Admin::FootersController < Spree::Admin::ResourceController
  
  def index
    if Spree::Footer.count == 1
      redirect_to edit_admin_footer_path(Spree::Footer.first)
    else
      @footers = Spree::Footer.all
    end
  end

  def create
    @footer = Spree::Footer.new(permitted_resource_params)
    if @footer.save
      flash[:success] = "Footer Successfully Created"
      redirect_to location_after_save
    else
      flash[:error] = @footer.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

end
