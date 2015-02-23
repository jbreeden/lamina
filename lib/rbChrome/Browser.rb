require 'ffi'

module RbChrome
  module Browser
    extend FFI::Library
    ffi_lib 'rbChrome'

    class << self
      attr_accessor :url, :window_title, :cache_path, :remote_debugging_port
    end

    self.window_title = "rb-chrome"

    def self.open
      check_open_preconditions
      update_localstorage
      self.rb_chrome_set_sub_process "simpleChromeProc"
      self.rb_chrome_set_url self.url
      self.rb_chrome_set_window_title self.window_title
      self.rb_chrome_set_cache_path self.cache_path
      self.rb_chrome_set_remote_debugging_port(self.remote_debugging_port) if self.remote_debugging_port
      self.rb_chrome_start
    end

    private

    def self.check_open_preconditions
      raise "No URL specified" unless self.url
    end

    # rb-chrome uses random port numbers when starting the web server.
    # This has the unfortunate effect of breaking (sorta) localstorage.
    # Localstorage database files are named and looked up by the origin
    # of the web page - which includes the port number. So, we'll
    # rename any localhost localstorage files according to the current
    # port number.
    def self.update_localstorage
      current_port = self.url[/(localhost|127\.0\.0\.1):([0-9]+)/, 2]
      return unless self.cache_path && current_port
      Dir["#{self.cache_path}/Local Storage/*.localstorage*"].each do |db|
        if db =~ /localhost/
          File.rename(db, db.gsub(/[0-9]+.localstorage/, "#{current_port}.localstorage"))
        end
      end
    end

    attach_function :rb_chrome_start, [], :int, blocking: true
    attach_function :rb_chrome_set_url, [:string], :void
    attach_function :rb_chrome_set_sub_process, [:string], :void
    attach_function :rb_chrome_set_window_title, [:string], :void
    attach_function :rb_chrome_set_cache_path, [:string], :void
    attach_function :rb_chrome_set_remote_debugging_port, [:int], :void
  end
end
