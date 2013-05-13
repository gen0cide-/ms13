require 'bundler/setup'
require 'stomp'

client = Stomp::Client.open "stomp://localhost:61613"
client.publish('/queue/dope', ARGV[0])
