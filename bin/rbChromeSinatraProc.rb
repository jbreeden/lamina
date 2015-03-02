require 'rbChrome'
require 'optparse'
require 'ipc'

client_script = ARGV[ARGV.length - 1]

$RB_CHROME_OPTIONS = {}

OptionParser.new do |opts|
  opts.on("--port PORT", "The port to serve from") do |port|
    $RB_CHROME_OPTIONS[:port] = port
  end

  opts.on("--ipc-port PORT", "The port to provide IPC services on") do |port|
    $RB_CHROME_OPTIONS[:ipc_port] = port
  end

  opts.on("--browser-port PORT", "The IPC port of the browser process") do |port|
    $RB_CHROME_OPTIONS[:browser_port] = port
  end
end.parse(ARGV)

IPC.listen($RB_CHROME_OPTIONS[:ipc_port])

# This is sufficient, regardless of the number of windows opened, and
# the order in which they're opened/closed. Chromium uses a process-per-site
# process model by default, where all script-connected windows for a given site
# live in the same process. So the browser process for this rb-chrome
# app will always be the same.
#
# http://www.chromium.org/developers/design-documents/process-models
IPC.die_with($RB_CHROME_OPTIONS[:browser_port])

require File.expand_path(client_script)
