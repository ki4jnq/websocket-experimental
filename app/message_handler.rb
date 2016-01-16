class MessageHandler
  # 'message' is a hash with a specific set of fields.
  def call(message)
    # TODO: Publish to all connected clients and push to Redis pubsub queue for so that 
    # other app servers know to do the same.
    puts message
  end
end
