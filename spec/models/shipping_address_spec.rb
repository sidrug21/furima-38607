require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '配送先の住所情報' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user: user)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品が購入できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping_address).to be_valid
      end

      it '建物名が空でも保存できること' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'クレカ情報が必須であること' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が必須であること' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能であること' do
        @purchase_shipping_address.postal_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid')

        @purchase_shipping_address.postal_code = '1234-567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid')

        @purchase_shipping_address.postal_code = '12-34567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid')

        @purchase_shipping_address.postal_code = '１２３−４５６７'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が必須であること' do
        @purchase_shipping_address.prefecture_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @purchase_shipping_address.house_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が必須であること' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上だと保存できない' do
        @purchase_shipping_address.phone_number = '090123456789' # 12桁の数字
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号に全角を含むと保存できない' do
        @purchase_shipping_address.phone_number = '０９０１２３４５６７８' # 全角数字
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
