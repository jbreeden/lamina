require_relative "../../lib/ipc.rb"

IPC.listen(8080)

loop {
  sleep 1
}
