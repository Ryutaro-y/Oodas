require 'rails_helper'

RSpec.describe Ink, type: :model do
        
    describe 'バリデーションの検証' do
        it '入力値が有効な場合、登録に成功する' do
            expect(build(:ink)).to be_valid
        end

        context '入力値が空の場合のバリデーションチェック' do
            it 'インク名が空の場合、エラーになる' do
                ink = build(:ink, name: nil)
                expect(ink).not_to be_valid
            end
            
            it '色が空の場合、エラーになる' do
                ink = build(:ink, color_type: nil)
                expect(ink).not_to be_valid
            end
        end

        context '入力値が空の場合のエラーメッセージの表示' do
            it 'インク名が空の場合、エラーメッセージが表示される' do
                ink = build(:ink, name: nil)
                ink.valid?
                expect(ink.errors[:name]).to include('を入力してください。')
            end

            it '色が空の場合、エラーメッセージが表示される' do
                ink = build(:ink, color_type: nil)
                ink.valid?
                expect(ink.errors[:color_type]).to include('を入力してください。')
            end
        end

        context '入力値が重複する場合のバリデーションチェック' do
            it '既に存在するインク名の場合、エラー' do
                ink = create(:ink, name: 'R100')
                ink2 = build(:ink, name: 'R100')
                expect(ink2).not_to be_valid
            end

            it '既に存在するインク名の場合、エラーメッセージが表示される' do
                ink = create(:ink, name: 'R100')
                ink2 = build(:ink, name: 'R100')
                ink2.valid?
                expect(ink2.errors[:name]).to include('は既に登録されています。')
            end
        end
    end

    describe 'dependent: :destroyの検証' do
        it 'インクを削除するとそのインクのロケーションも削除される:' do
            location = create(:location)
            ink = build(:ink, locations: [location])
            expect{ ink.destroy }.to change{ Location.count }.by(-1)
        end
    end
end
