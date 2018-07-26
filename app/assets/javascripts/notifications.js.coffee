class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $("[data-behavior='notifications-link']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )
  handleClick: (e) ->
    $.ajax(
      url: "/notifications/make_as_read"
      dataType: "JSON"
      method: "POST"
      success: ->
        $("[data-behavior='notifications-unread']").text(0)
    )
  handleSuccess: (data) ->
    items = $.map data, (notification) ->
      "<li class='unread'><a href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type} #{notification.notifiable.post_name}</a></li>"
    $("[data-behavior='notifications-unread']").text(items.length)
    $("[data-behavior='notifications-item']").prepend(items)
    $("[data-behavior='notifications-item']").prepend("<h5>Notifications</h5>")


jQuery ->
  new Notifications
