class OrderMailer < ApplicationMailer
    default from: 'labelprint@example.com' 

    def order_email(order)
        @order = order
        mail(to: @order.supplier.email, subject: "インクの注文でございます")
    end
end
