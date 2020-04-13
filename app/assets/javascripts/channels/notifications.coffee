App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
      # Called when the subscription has been terminated by the server
  received: (data) ->
      if data['notification']
        $('[data-behavior~=notices]').prepend(data['notification'])
      if data['success']
        alert data['success']
