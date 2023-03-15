require 'rails_helper'

RSpec.describe Supplier, type: :model do
        
    describe 'バリデーションの検証' do
        it '入力値が有効な場合、登録に成功する' do
            expect(build(:supplier)).to be_valid
        end

        context '入力値が空の場合のバリデーションチェック' do
            it '仕入れ先名が空の場合、エラーになる' do
                supplier = build(:supplier, name: nil)
                expect(supplier).not_to be_valid
            end
            
            it 'メールアドレスが空の場合、エラーになる' do
                supplier = build(:supplier, email: nil)
                expect(supplier).not_to be_valid
            end
        end

        context '入力値が空の場合のエラーメッセージの表示' do
            it '仕入れ先名が空の場合、エラーメッセージが表示される' do
                supplier = build(:supplier, name: nil)
                supplier.valid?
                expect(supplier.errors[:name]).to include('を入力してください。')
            end

            it 'メールアドレスが空の場合、エラーメッセージが表示される' do
                supplier = build(:supplier, email: nil)
                supplier.valid?
                expect(supplier.errors[:email]).to include('を入力してください。')
            end
        end
    end
end
