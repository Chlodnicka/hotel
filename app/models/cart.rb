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
        :cmd => '_xclick',
        :upload => 1,
        :rm => 2,
        :return => "#{Rails.application.secrets.app_host}#{return_url}",
        :amount => total_price
    }values.merge!({
                       "amount" => unit_price,
                       "item_name" => name,
                       "item_number" => id,
                       "quantity" => '1'
                   })
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?"+values.map {|k,v| "#{k}=#{v}"}.join("&")
  end
end