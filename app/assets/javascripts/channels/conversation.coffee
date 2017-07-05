App.conversation = App.cable.subscriptions.create "ConversationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
    conversation.find('.messages-list').find('ul').append(data['message']);

    messages_list = conversation.find('.messages-list');
    height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);

  speak: (message) ->
    @perform 'speak',  message: message

$(document).on 'submit', '.new_message', (e) ->
  e.preventDefault();
  App.conversation.speak($(this).serializeArray());
  $(this).trigger('reset');