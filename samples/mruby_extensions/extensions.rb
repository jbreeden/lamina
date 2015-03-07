# def log(txt)
#   File.open('log.txt', 'a') do |log|
#     log.puts txt
#   end
# end
#
# V8 = Cef::V8
# window = V8.window
#
# log('create_undefined')
# window[:rbUndefined] = V8.create_undefined
# log('create_string')
# window[:rbString] = V8.create_string 'Hello, from mruby!'
# log('V8.exec')
# V8.exec "window.rbExecValue = 'You can execute JavaScript from your ruby extensions'"
# log('done!')

File.open('log.txt', 'w') do |log|
  begin
    throwing_on_purpose = false
    V8 = Cef::V8
    window = V8.window
    begin
      log.puts 'create_undefined'
      window[:rbUndefined] = V8.create_undefined
      log.puts 'create_null'
      window[:rbNull] = V8.create_null
      log.puts 'create_int'
      window[:rbInt] = V8.create_int 3
      log.puts 'create_string'
      window[:rbString] = V8.create_string 'Hello, from mruby!'
      log.puts 'V8.exec'
      V8.exec "rbExecValue = 'You can execute JavaScript from your Ruby code!'"
      log.puts 'done!'

      throwing_on_purpose = true
      V8.create_int 'test'
    rescue TypeError => ex
      if throwing_on_purpose
        window[:rbException] = V8.create_string ex.to_s
      else
        throw ex
      end
    end
  rescue Exception => ex
    V8.exec "alert('Something went wrong... #{ex.class}')"
  end
end
