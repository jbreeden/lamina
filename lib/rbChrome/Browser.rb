require 'ffi'

module RbChrome
  module Browser
    extend FFI::Library
    ffi_lib 'rbChrome'

    def self.url
      @url ||= "google.com"
    end

    def self.url=(newUrl)
      @url = newUrl
    end

    def self.window_title
      @window_title ||= "rb-chrome"
    end

    def self.window_title=(newTitle)
      @window_title = newTitle
    end

    def self.open
      self.rb_chrome_set_sub_process "simpleChromeProc"
      self.rb_chrome_set_url self.url
      self.rb_chrome_set_window_title self.window_title
      self.rb_chrome_start
    rescue Exception => ex
      puts "Error opening browser: #{ex}"
      raise
    end

    private

    attach_function :rb_chrome_start, [], :int, blocking: true
    attach_function :rb_chrome_set_url, [:string], :void
    attach_function :rb_chrome_set_sub_process, [:string], :void
    attach_function :rb_chrome_set_window_title, [:string], :void
  end
end
