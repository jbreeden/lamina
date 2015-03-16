begin
  log = File.open('log.txt', 'w')
  V8 = Cef::V8
  V8.window[:ruby] = V8.create_function('ruby') do |arguments|
    begin
      script = arguments[:shift].apply(arguments, []).string_value
      log.puts "--Running Test--"
      log.puts script
      eval(script)
    rescue Exception => ex
      V8.create_string("Error: #{ex}")
    end
  end
rescue Exception => ex
  V8.exec "alert('Something went wrong... #{ex.class}')"
end
