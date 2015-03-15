begin
  throwing_on_purpose = false
  V8 = Cef::V8
  begin
    V8.window[:rbUndefined] = V8.create_undefined
    V8.window[:rbNull] = V8.create_null
    V8.window[:rbTrue] = V8.create_bool true
    V8.window[:rbFalse] = V8.create_bool false
    V8.window[:rbTruthy] = V8.create_bool 1
    V8.window[:rbFalsy] = V8.create_bool nil
    V8.window[:rbInt] = V8.create_int 3
    V8.window[:rbFloat] = V8.create_float 4.5
    V8.window[:rbString] = V8.create_string 'Hello, from mruby!'
    V8.window[:rbObject] = V8.create_object
    V8.window[:rbObject][:myRubyClass] = V8.create_string(V8.window[:rbObject].class.to_s)
    V8.exec "rbExecValue = 'javascript string literal'"

    throwing_on_purpose = true
    V8.create_int 'test'
  rescue TypeError => ex
    if throwing_on_purpose
      V8.window[:rbException] = V8.create_string ex.to_s
    else
      throw ex
    end
  end
rescue Exception => ex
  V8.exec "alert('Something went wrong... #{ex.class}')"
end
