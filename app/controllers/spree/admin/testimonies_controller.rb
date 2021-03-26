class Spree::Admin::TestimoniesController < Spree::Admin::ResourceController
  
  def index
    @testimonies = Spree::Testimony.all
  end

  def new
    @testimony = Spree::Testimony.new
  end

  def create
    @testimony = Spree::Testimony.new(permitted_resource_params)
    if @testimony.save
      flash[:success] = "Testimony Successfully Created"
      redirect_to location_after_save
    else
      flash[:error] = @testimony.errors.full_messages.to_sentence
      render action: 'new'
    end
  end


end
