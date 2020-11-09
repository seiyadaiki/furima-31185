require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品がうまくいく時' do
      it 'titleとexplanation,category_id,status_id,shipping_fee_id,location_id,delivery_time_id,selling_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない場合' do
      it 'titleが空だとできない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'imageが空だとできない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'explanationが空だとできない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'expanationが6文字以下だとできない' do
        @item.explanation = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too short (minimum is 7 characters)')
      end
      it 'category_idが0だとできない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが0だとできない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shippng_fee_idが0だとできない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'location_idが0だとできない' do
        @item.location_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Location can't be blank")
      end
      it 'delivery_time_idが0だとできない' do
        @item.delivery_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'selling_priceが空だとできない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'selling_priceが299以下だとできない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is out of setting range')
      end
      it 'selling_priceが10000000以上だとできない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is out of setting range')
      end
    end
  end
end
