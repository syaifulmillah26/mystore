# frozen_string_literal: true

class Spree::Admin::ResourceController < Spree::Admin::BaseController
  # URL helpers
  helper_method :new_object_url, :edit_object_url, :object_url, :collection_url, :validate_object_url

  def validate_object_url(object, options = {})
    if parent?
      spree.polymorphic_url([:admin, :validate, parent, object], options)
    else
      spree.polymorphic_url([:admin, :validate, object], options)
    end
  end

  def update_positions
    ActiveRecord::Base.transaction do
      params[:positions].each do |id, index|
        model_class.find_by(id: id)&.set_list_position(index)
      end
    end

    respond_to do |format|
      format.js { head :no_content }
    end
  end

end
