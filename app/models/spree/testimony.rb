class Spree::Testimony < ApplicationRecord
  after_create :create_position

  def create_position
    self.update(position: self.id)
  end
end
