class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :location
  belongs_to :delivery_time

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 40 }
    validates :explanation, length: { minimum: 7, maximum: 1000 }
    validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
    validates :category_id,  numericality: { other_than: 0, message: "can't be blank" }
    validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_fee_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :location_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :delivery_time_id, numericality: { other_than: 0, message: "can't be blank" }
  end

end
