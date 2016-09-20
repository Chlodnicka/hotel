class Order < ApplicationRecord
  belongs_to :reservation

  attr_accessor :card_number, :card_verification

  validate :validate_card, :on => :create

  def purchase(id)
    response = GATEWAY.purchase(price_in_cents(id), credit_card, :ip => ip_address)
    reservation.update_attribute(:status, "paid") if response.success?
    response.success?
  end

  def price_in_cents(id)
    reservation = Reservation.find id
    (reservation.changed_price*100).round
  end

  private
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors[:base] << message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type => card_type,
        :number => card_number,
        :verification_value => card_verification,
        :month => card_expires_on.month,
        :year => card_expires_on.year,
        :first_name => first_name,
        :last_name => last_name
    )
  end
end
