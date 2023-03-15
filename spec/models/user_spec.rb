require 'rails_helper'

RSpec.describe User, type: :model do
        
    describe 'バリデーションの検証' do
        it '入力値が有効な場合、登録に成功する' do
            expect(build(:user)).to be_valid
        end

        context '入力値が空の場合のバリデーションチェック' do
            it '名前が空の場合、エラーになる' do
                user = build(:user, name: nil)
                expect(user).not_to be_valid
            end
            
            it 'メールアドレスが空の場合、エラーになる' do
                user = build(:user, email: nil)
                expect(user).not_to be_valid
            end

            it 'パスワードが空の場合、エラーになる' do
                user = build(:user, password_digest: nil)
                expect(user).not_to be_valid
            end
        end

        context '入力値が空の場合のエラーメッセージの表示' do
            it '名前が空の場合、エラーメッセージが表示される' do
                user = build(:user, name: nil)
                user.valid?
                expect(user.errors[:name]).to include('を入力してください。')
            end

            it 'メールアドレスが空の場合、エラーメッセージが表示される' do
                user = build(:user, email: nil)
                user.valid?
                expect(user.errors[:email]).to include('を入力してください。')
            end

            it 'パスワードが空の場合、エラーメッセージが表示される' do
                user = build(:user, password_digest: nil)
                user.valid?
                expect(user.errors[:password_digest]).to include('を入力してください。')
            end
        end

        context '入力値が重複する場合のバリデーションチェック' do
            it '既に存在するメールアドレスの場合、エラー' do
                user = create(:user, email: 'user5@example.com')
                user2 = build(:user, email: 'user5@example.com')
                expect(user2).not_to be_valid
            end

            it '既に存在するメールアドレスの場合、エラーメッセージが表示される' do
                user = create(:user, email: 'user5@example.com')
                user2 = build(:user, email: 'user5@example.com')
                user2.valid?
                expect(user2.errors[:email]).to include('は既に登録されています。')
            end
        end
    end
end
