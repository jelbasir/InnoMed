$(document).on('turbolinks:load', function() {
  $("#new_message").on ("ajax:success", clearMessage)

  function clearMessage(event) {
    const data = event.detail[0]
    $('form input')[3].value = ''
  }
})
