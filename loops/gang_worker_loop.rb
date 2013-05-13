class GangWorkerLoop < Loops::Queue
  def self.initialize_loop(config)
    # do nothing
  end

  def process_message(message)
    @log.info "Received a message: #{message.body}"
    timer = 0.5 + rand(20) / 10.0
    @log.info "Processing will take #{timer} seconds."
    sleep(timer) # do something "useful" with the message :-)
    @log.info "Finished! Waiting for next job..."
  end
end

# class Methlab
#   # ....
# end

# if __FILE__ == $0
  
# end
