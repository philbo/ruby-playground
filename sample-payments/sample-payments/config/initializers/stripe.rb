Rails.configuration.stripe = {
  :secret_key => "sk_test_QWj0j5iUiBT1zT9zXCF2uWYj",
  :publishable_key => "pk_test_whI4OpwQGgxmQRLMsVqcvCeg"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]