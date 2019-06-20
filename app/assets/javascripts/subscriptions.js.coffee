
jQuery -> 
  Stripe.setPublishiableKey($('meta[name="stripe-key"]').attr('content'))
  subscription.setupForm()

subscription = 
  setupForm: ->
    $('#new_subscription').submit ->
      $('input[type=submit]').attr('disabled',true)
      subscription.processCard()
      false

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expyear: $('#card_year').val() 
    Stripe.createToken(card,subscription.handleStripeResponse)

  handleStripeResponse: ->
    if status == 200
      $('#subscription_stripe_card_token').val(response.id)
      alert(response.id)
      $('#new_patient')[0].submit()
    else 
      alert(response.error.message)
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled',false)