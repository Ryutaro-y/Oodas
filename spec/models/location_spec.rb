require 'rails_helper'

RSpec.describe Location, type: :model do
        
    describe 'バリデーションの検証' do
        it '入力値が有効な場合、登録に成功する' do
            expect(build(:location, :with_ink_name)).to be_valid
        end

        context '入力値が空の場合のバリデーションチェック' do
            it 'ロケーション名が空の場合、エラーになる' do
                location = build(:location, name: nil)
                expect(location).not_to be_valid
            end
            
            it '段が空の場合、エラーになる' do
                location = build(:location, stage: nil)
                expect(location).not_to be_valid
            end

            it 'インク名が空の場合、エラーになる' do
                location = build(:location, :with_ink_name, ink_name: nil)
                expect(location).not_to be_valid
            end
        end

        context '入力値が空の場合のエラーメッセージの表示' do
            it 'ロケーション名が空の場合、エラーメッセージが表示される' do
                location = build(:location, name: nil)
                location.valid?
                expect(location.errors[:name]).to include('を入力してください。')
            end

            it '段が空の場合、エラーメッセージが表示される' do
                location = build(:location, stage: nil)
                location.valid?
                expect(location.errors[:stage]).to include('を入力してください。')
            end

            it 'インク名が空の場合、エラーメッセージが表示される' do
                location = build(:location, :with_ink_name, ink_name: nil)
                location.valid?
                expect(location.errors[:ink_name]).to include('を入力してください。')
            end
        end

        context '入力値が重複する場合のバリデーションチェック' do
            it '既に存在するインク名の場合、エラー' do
                location = create(:location, ink_name: 'R100')
                location2 = build(:location, ink_name: 'R100')
                expect(location2).not_to be_valid
            end

            it '既に存在するインク名の場合、エラーメッセージが表示される' do
                location = create(:location, ink_name: 'R100')
                location2 = build(:location, ink_name: 'R100')
                location2.valid?
                expect(location2.errors[:ink_name]).to include('は既に登録されています。')
            end
        end

        context '入力値が関連先のモデルに存在しない場合のエラーメッセージの表示' do
            it 'インク名が存在しない場合、エラーメッセージが表示される' do
                location = build(:location, ink: nil)
                location.valid?
                expect(location.errors[:ink]).to include('は登録されていない名前です。')
            end
        end
    end

    describe 'dependent: :destroyの検証' do
        it 'ロケーションを削除するとそれと関連する在庫も削除される:' do
            stock = create(:stock)
            location = build(:location, stocks: [stock])
            expect{ location.destroy }.to change{ Stock.count }.by(-1)
        end
    end
end
