require_relative "../../lib/ipc.rb"

# Setting the "juliet" port will cause this
# process to exit if the process listening
# at the indicated port stops responding
IPC.add_juliet_port(8080)

loop {
  sleep 1
}
