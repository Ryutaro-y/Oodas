require 'rails_helper'

RSpec.describe Order, type: :model do
        
    describe 'バリデーションの検証' do
        it '入力値が有効な場合、登録に成功する' do
            expect(build(:order, :with_ink_name)).to be_valid
        end

        context '入力値が空の場合のバリデーションチェック' do
            it 'インク名が空の場合、エラーになる' do
                order = build(:order, :with_ink_name, ink_name: nil)
                expect(order).not_to be_valid
            end
            
            it '注文個数が空の場合、エラーになる' do
                order = build(:order, order_quantity: nil)
                expect(order).not_to be_valid
            end
            
            it '注文日が空の場合、エラーになる' do
                order = build(:order, order_date: nil)
                expect(order).not_to be_valid
            end

            it '注文者が空の場合、エラーになる' do
                order = build(:order, user_id: nil)
                expect(order).not_to be_valid
            end
            
            it '仕入れ先が空の場合、エラーになる' do
                order = build(:order, supplier_id: nil)
                expect(order).not_to be_valid
            end
        end

        context '入力値が空の場合のエラーメッセージの表示' do
            it 'インク名が空の場合、エラーメッセージが表示される' do
                order = build(:order, :with_ink_name, ink_name: nil)
                order.valid?
                expect(order.errors[:ink_name]).to include('を入力してください。')
            end

            it '注文個数が空の場合、エラーメッセージが表示される' do
                order = build(:order, order_quantity: nil)
                order.valid?
                expect(order.errors[:order_quantity]).to include('を入力してください。')
            end

            it '注文日が空の場合、エラーメッセージが表示される' do
                order = build(:order, order_date: nil)
                order.valid?
                expect(order.errors[:order_date]).to include('を入力してください。')
            end
        end

        context '入力値が関連先のモデルに存在しない場合のエラーメッセージの表示' do
            it 'インク名が存在しない場合、エラーメッセージが表示される' do
                order = build(:order, stock: nil)
                order.valid?
                expect(order.errors[:stock]).to include('に存在しません。')
            end

            it '注文者が存在しない場合、エラーメッセージが表示される' do
                order = build(:order, user: nil)
                order.valid?
                expect(order.errors[:user]).to include('に存在しません。')
            end

            it '仕入れ先名が存在しない場合、エラーメッセージが表示される' do
                order = build(:order, supplier: nil)
                order.valid?
                expect(order.errors[:supplier]).to include('に存在しません。')
            end
        end
    end
end
