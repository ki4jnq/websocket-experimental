require './app/app.rb'
Dir['./middleware/*.rb'].each { |file| require file }

Faye::WebSocket.load_adapter('thin')
use FailSafe
run App.new
