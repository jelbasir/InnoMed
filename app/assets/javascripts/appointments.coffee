# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
  Stripe.setPublishiableKey($('meta[name="stripe-key"]').attr('content'))
  patient.setupForm()

patient = 
  setupForm: ->
    $('#new_patient').submit ->
      $('input[type=submit]').attr('disabled',true)
      patient.processCard()
      false

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expyear: $('#card_year').val() 
    Stripe.createToken(card, patient.handleStripeResponse)

  handleStripeResponse: ->
    if status == 200
      $('#patient_stripe_card_token').val(response.id)
      alert(response.id)
      $('#new_patient')[0].submit()
    else 
      alert(response.error.message)
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled',false)