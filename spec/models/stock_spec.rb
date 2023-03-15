require 'rails_helper'

RSpec.describe Stock, type: :model do
        
    describe 'バリデーションの検証' do
        it '入力値が有効な場合、登録に成功する' do
            expect(build(:stock, :with_ink_name)).to be_valid
        end

        context '入力値が空の場合のバリデーションチェック' do
            it 'インク名が空の場合、エラーになる' do
                stock = build(:stock, :with_ink_name, ink_name: nil)
                expect(stock).not_to be_valid
            end
            
            it '色が空の場合、エラーになる' do
                stock = build(:stock, color_type: nil)
                expect(stock).not_to be_valid
            end
            
            it 'ロケーション名が空の場合、エラーになる' do
                stock = build(:stock, location_name: nil)
                expect(stock).not_to be_valid
            end

            it '段が空の場合、エラーになる' do
                stock = build(:stock, stage: nil)
                expect(stock).not_to be_valid
            end
            
            it '在庫数が空の場合、エラーになる' do
                stock = build(:stock, quantity: nil)
                expect(stock).not_to be_valid
            end

            it '管理者が空の場合、エラーになる' do
                stock = build(:stock, user_id: nil)
                expect(stock).not_to be_valid
            end
        end

        context '入力値が空の場合のエラーメッセージの表示' do
            it 'インク名が空の場合、エラーメッセージが表示される' do
                stock = build(:stock, :with_ink_name, ink_name: nil)
                stock.valid?
                expect(stock.errors[:ink_name]).to include('を入力してください。')
            end

            it '色が空の場合、エラーメッセージが表示される' do
                stock = build(:stock, color_type: nil)
                stock.valid?
                expect(stock.errors[:color_type]).to include('を入力してください。')
            end

            it 'ロケーション名が空の場合、エラーメッセージが表示される' do
                stock = build(:stock, location_name: nil)
                stock.valid?
                expect(stock.errors[:location_name]).to include('を入力してください。')
            end

            it '段が空の場合、エラーメッセージが表示される' do
                stock = build(:stock, location_name: nil)
                stock.valid?
                expect(stock.errors[:location_name]).to include('を入力してください。')
            end

            it '在庫数が空の場合、エラーメッセージが表示される' do
                stock = build(:stock, location_name: nil)
                stock.valid?
                expect(stock.errors[:location_name]).to include('を入力してください。')
            end
        end

        context '入力値が重複する場合のバリデーションチェック' do
            it '既に存在するインク名の場合、エラー' do
                stock = create(:stock, ink_name: 'R100')
                stock2 = build(:stock, ink_name: 'R100')
                expect(stock2).not_to be_valid
            end

            it '既に存在するインク名の場合、エラーメッセージが表示される' do
                stock = create(:stock, ink_name: 'R100')
                stock2 = build(:stock, ink_name: 'R100')
                stock2.valid?
                expect(stock2.errors[:ink_name]).to include('は既に登録されています。')
            end
        end

        context '入力値が関連先のモデルに存在しない場合のエラーメッセージの表示' do
            it 'インク名が存在しない場合、エラーメッセージが表示される' do
                stock = build(:stock, location: nil)
                stock.valid?
                expect(stock.errors[:location]).to include('に存在しません。')
            end

            it '注文者が存在しない場合、エラーメッセージが表示される' do
                stock = build(:stock, user: nil)
                stock.valid?
                expect(stock.errors[:user]).to include('に存在しません。')
            end
        end
    end
end
