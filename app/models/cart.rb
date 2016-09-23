class Cart < ApplicationRecord
  has_many :reservations

  def total_price
    total = 0
    reservations.each do |reservation|
      total += reservation.changed_price
    end
    (total*100).ceil
  end

  def paypal_url(return_url)
    values = {
        :business => "maja.chlodnicka@student.uj.edu.pl",
        :cmd => '_cart',
        :upload => 1,
        :rm => 2,
        :return => "#{Rails.application.secrets.app_host}#{return_url}",
        :invoice => id
    }
    reservations.each_with_index do |reservation, key|
      values.merge!({
                        "amount_#{key+1}" => reservation.changed_price,
                        "item_name_#{key+1}" => reservation.room.name,
                        "item_number_#{key+1}" => reservation.room_id,
                        "quantity_#{key+1}" => 1
                    })

    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
