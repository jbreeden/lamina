require 'rbChrome'
require 'optparse'
require 'ipc'

client_script = ARGV[ARGV.length - 1]

$RB_CHROME_OPTIONS = {
  url: "www.google.com"
}

OptionParser.new do |opts|
  opts.banner = "Usage: rb-chrome"

  opts.on("--url URL", "The url to load on startup") do |url|
    $RB_CHROME_OPTIONS[:url] = url
  end

  opts.on("--ipc-port PORT", "The port to provide IPC services on") do |port|
    $RB_CHROME_OPTIONS[:ipc_port] = port
  end
end.parse(ARGV)

module IPC::Services
  def self.execute_javascript(options)
    RbChrome::Browser.execute_javascript options
  end
end

IPC.listen($RB_CHROME_OPTIONS[:ipc_port])

RbChrome::Browser.url = $RB_CHROME_OPTIONS[:url]
if File.exists? client_script
  require client_script
end
RbChrome::Browser.open
