V8 = Cef::V8
window = V8.window

window[:dir] = V8.create_object
window[:dir][:pwd] = V8.create_function 'pwd' do
  V8.create_string Dir.pwd
end

window[:dir][:entries] = V8.create_function 'entries' do |args|
  raise "dir.entries requires 1 string argument" unless args.length == 1 && args[0].is_string?
  dir = args[0].string_value
  ret = V8.eval "[]"
  Dir.entries(dir).sort.each do |entry|
    next if entry =~ /^\.{1,2}$/
    ret[:push].apply(ret, [V8.create_string(entry)])
  end
  ret
end
