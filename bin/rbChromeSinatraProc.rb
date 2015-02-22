require 'rbChrome'
require 'optparse'
require 'ipc'

$RB_CHROME_OPTIONS = {}

OptionParser.new do |opts|
  opts.on("--port PORT", "The port to serve from") do |port|
    $RB_CHROME_OPTIONS[:port] = port
  end

  opts.on("--ipc-port PORT", "The port to provide IPC services on") do |port|
    $RB_CHROME_OPTIONS[:ipc_port] = port
  end

  opts.on("--juliet-port PORT", "The port of the juliet process") do |port|
    $RB_CHROME_OPTIONS[:juliet_port] = port
  end
end.parse(ARGV)

IPC.listen($RB_CHROME_OPTIONS[:ipc_port])
IPC.add_juliet_port($RB_CHROME_OPTIONS[:juliet_port])

require "./server.rb"
