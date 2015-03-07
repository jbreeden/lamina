require 'ffi'

module RbChrome
  module Browser
    extend FFI::Library
    ffi_lib 'rbChrome'

    class << self
      attr_accessor :url,
        :window_title,
        :cache_path,
        :remote_debugging_port,
        :extensions_script
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

    # Accepts an options hash with
    #   script: The JavaScript to exec, as a string
    #   window_pattern: A regex used to select windows to run the script in by name (default is /.*/)
    #   firstMatch: Script only run in first matching window if true (default is false)
    def self.execute_javascript(options)
      options[:window_pattern] = /.*/ unless options.has_key?(:window_pattern)
      options[:firstMatch] = false unless options.has_key?(:firstMatch)
      self.rb_chrome_execute_javascript(
        options[:script],
        options[:window_pattern].source,
        options[:firstMatch]
      )
    end

    def self.enable_page_titles
      self.rb_chrome_use_page_titles(true)
    end

    def self.disable_page_titles
      self.rb_chrome_use_page_titles(false)
    end

    private

    def self.check_open_preconditions
      raise "No URL specified" unless self.url
    end

    # rb-chrome uses random port numbers when starting the web server.
    # This has the unfortunate effect of (sort of) breaking localstorage.
    # Localstorage database files are named and looked up by the origin
    # of the web page - which includes the port number. So, we'll
    # rename any localhost localstorage files according to the current
    # port number.
    def self.update_localstorage
      current_port = self.url[/(localhost|127\.0\.0\.1):([0-9]+)/, 2]
      return unless self.cache_path && current_port
      Dir["#{self.cache_path}/Local Storage/*.localstorage*"].each do |path|
        if path =~ /localhost/ && !path.include?("_#{current_port}.localstorage")
          File.rename(path, path.gsub(/[0-9]+.localstorage/, "#{current_port}.localstorage"))
        end
      end
    end

    # Setting `blocking: true` means this function will release the GVL (or GIL)
    # This is required for the IPC thread to continue receiving messages.
    # This also means that no ruby code can be executed on the CEF message
    # loop without acquiring the GVL, and subsequently releasing it again.
    attach_function :rb_chrome_start, [], :int, blocking: true
    attach_function :rb_chrome_set_url, [:string], :void
    attach_function :rb_chrome_set_sub_process, [:string], :void
    attach_function :rb_chrome_set_window_title, [:string], :void
    attach_function :rb_chrome_set_cache_path, [:string], :void
    attach_function :rb_chrome_set_remote_debugging_port, [:int], :void
    attach_function :rb_chrome_execute_javascript, [:string, :string, :bool], :void
    attach_function :rb_chrome_use_page_titles, [:bool], :void
  end
end
