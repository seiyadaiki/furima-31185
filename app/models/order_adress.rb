class OrderAdress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Input half-integer characters"}
  end

  def save
    Order.create( user_id: user_id, item_id: item_id)
    Address.create(prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end