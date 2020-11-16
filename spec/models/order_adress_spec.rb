require 'rails_helper'

RSpec.describe OrderAdress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_adress = FactoryBot.build(:order_adress)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_adress).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_adress.postal_code = ""
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeがハイフン無いと保存できないこと' do
      @order_adress.postal_code = "3333333"
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @order_adress.prefecture_id = ""
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが0だと保存できないこと' do
      @order_adress.prefecture_id = 0
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_adress.city = ""
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_adress.house_number = ""
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameが空でも保存できること' do
      @order_adress.building_name = ""
      expect(@order_adress).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_adress.phone_number = ""
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Phone number is invalid. Input half-integer characters")
    end
    it 'phone_numberが全角数字以外だと保存できないこと' do
      @order_adress.phone_number = "１１１１１１１１１１１"
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Phone number is invalid. Input half-integer characters")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_adress.token = ""
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Token can't be blank")
    end
  end
end
