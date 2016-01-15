class App
  def call(env)
    if Faye::WebSocket.websocket? env
      ws = Faye::WebSocket.new(env)

      ws.on :open, method(:open)
      ws.on :message, method(:message)
      ws.on :close, method(:close)

      ws.rack_response
    else
      [200, { 'Content-Type' => 'text/plain' }, ['']]
    end
  end

  def open(event)
  end

  def message(event)
    handler = MessageHandler.new

    data = safe_json_parse

    handler.call(data)
  end

  def close(event)
  end

  private
  def safe_json_parse(data)
    JSON.parse(data) rescue {}
  end
end
