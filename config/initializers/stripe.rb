Rails.configuration.stripe = {
  :publishable_key => "pk_live_oHoCF5oFuGsuT6YkRkSYLMvU",
  :secret_key      => "sk_live_6LpN31OpmXsWbE7XcxJeE75Z"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]