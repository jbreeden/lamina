require 'drb'

module IPC

  def uri
    @uri
  end

  def self.listen(port)
    @listening ||= false
    raise "IPC service already started" if @listening
    @uri = "druby://localhost:#{port}"

    DRb.start_service(@uri, Services)

    @listening = true
  end

  def self.die_with(port, exit_code = 1)
    @juliets ||= []
    @juliets.push DRbObject.new_with_uri("druby://localhost:#{port}")
    return if @juliets.length > 1
    Thread.new do
      begin
        loop do
          @juliets.each do |juliet|
            juliet.ping
          end
          sleep 1
        end
      rescue DRb::DRbError => ex
        exit exit_code
      end
    end
  end

  # Services module's singleton methods are exposed to other processes via drb
  module Services
    def self.ping
      # Do nothing. Client will raise DRbError if this process is dead
    end
  end
end
