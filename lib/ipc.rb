require 'drb'
require 'timeout'

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
            timeout (2) do
              juliet.ping
            end
          end
          sleep 1
        end
      rescue Exception => ex
        exit exit_code
      end
    end
  end

  def self.get_proc(port)
    DRbObject.new_with_uri("druby://localhost:#{port}")
  end

  # Services module's singleton methods are exposed to other processes via drb
  module Services
    def self.ping
      # Do nothing. Client will raise DRbError if this process is dead.
      # Client may also use a timeout (From `require 'timeout'`) in
      # case this process is blocking this thread for some reason
    end
  end
end
