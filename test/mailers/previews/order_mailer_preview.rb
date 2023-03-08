# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
    def order_email_preview
        # メールに渡すOrderオブジェクトを生成する
        order = Order.new(
            ink_name: 'test',
            order_quantity: 10,
            order_date: Date.today
        )
        # OrderMailerのorder_emailメソッドを呼び出し、Orderオブジェクトを渡す
        OrderMailer.order_email(order)
    end
end
