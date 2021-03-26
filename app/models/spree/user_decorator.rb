Spree::User.class_eval do

  after_create :create_address
  after_create :send_activation_email

  state_machine :is_validate, initial: false do
    event :validate do
      transition to: true, from: false
    end
    after_transition to: true, do: :send_notif_email_validation
  end

  def send_activation_email
    # self.send_confirmation_instructions
    if self.confirmation_token.blank?
      self.confirmation_token = SecureRandom.urlsafe_base64.to_s
      self.confirmation_sent_at = DateTime.now
      self.save
    end
    AdminMailer.with(email: self.email, token: self.confirmation_token).registration_mailer.deliver_later
  end

  def email_activate
    self.unconfirmed_email  = self.confirmation_token
    self.confirmed_at       = DateTime.now
    self.confirmation_token = nil
    if self.save
      AdminMailer.with(email: self.email).activation_mailer.deliver_later
    end
  end

  def send_notif_email_validation
    AdminMailer.with(email: self.email).validation_mailer.deliver_later
  end

  def create_address
    address = Spree::Address.create(
      firstname: "John",
      lastname: "Doe",
      address1: "JL ABC",
      address2: "JL ABC2",
      city: "Jakarta",
      zipcode: "12850",
      country_id: 101,
      state_name: "DKI Jakarta", 
      phone: "0811111111"
    )
    self.default_address = address
  end
end
