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

    V8.window[:rbFunction] = V8.create_function "rbFunction" do |arguments|
      arg1 = arguments[:shift].call(arguments, [])
      V8.window[:alert].call(V8.window, [arg1])
    end

    V8.window[:rbTypeCheck] = V8.create_function "rbTypeCheck" do |arguments|
      arg = arguments[:shift].call(arguments, [])
      if arg.is_undefined
        V8.create_string 'is_undefined'
      elsif arg.is_null
        V8.create_string 'is_null'
      elsif arg.is_bool
        V8.create_string 'is_bool'
      elsif arg.is_int
        V8.create_string 'is_int'
      elsif arg.is_uint
        V8.create_string 'is_uint'
      elsif arg.is_double
        V8.create_string 'is_double'
      elsif arg.is_date
        V8.create_string 'is_date'
      elsif arg.is_string
        V8.create_string 'is_string'
      elsif arg.is_object
        V8.create_string 'is_object'
      elsif arg.is_array
        V8.create_string 'is_array'
      elsif arg.is_function
        V8.create_string 'is_function'
      end
    end

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
