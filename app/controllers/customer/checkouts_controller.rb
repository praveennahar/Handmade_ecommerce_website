class Customer::CheckoutsController < ApplicationController

    def index

        session = Stripe::Checkout::Session.create({
            mode: 'payment',
            # Remove the payment_method_types parameter
            # to manage payment methods in the Dashboard
            payment_method_types: ['card'],
            line_items: [{
              price_data: {
              # The currency parameter determines which
              # payment methods are used in the Checkout Session.
                currency: 'inr',
                  product_data: {
                    name: 'Total',
                  },
                  unit_amount: 200000,
                },
                quantity: 1,
              }],
              success_url: 'https://localhost:3000/customer/order_place?session_id={CHECHOUT_SESSION_ID}',
              cancel_url: 'https://example.com/cancel',
            })
            redirect_to session.url, allow_other_host: true
            

    end
    def orderplace
        @details = Stripe::Checkout::Session.retrieve(params[:session_id])
        @order = Order.first.update(transaction_id:@details.payment_intent)

    end

end
