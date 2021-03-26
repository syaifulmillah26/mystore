class Spree::Admin::HeadersController < Spree::Admin::ResourceController
  
  def index
    if Spree::Header.count == 1
      redirect_to edit_admin_header_path(Spree::Header.first)
    else
      @headers = Spree::Header.all
    end
  end

  def create
    @header = Spree::Header.new(permitted_resource_params)
    if @header.save
      flash[:success] = "Header Successfully Created"
      redirect_to location_after_save
    else
      flash[:error] = @header.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

end
