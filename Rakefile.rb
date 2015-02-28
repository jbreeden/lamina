$CEF_BUILDS = Dir['cef*']
$PLATFORM_CEF = case ENV['OS']
when /windows/i
  $CEF_BUILDS
    .select { |dir| dir.include? 'win' }
    .first
else
  fail 'No CEF build defined for this platform'
end

def runtime_dir
  "./runtime"
end

def clean_runtime(configuration)
  rm_r runtime_dir if Dir.exists? runtime_dir
  mkdir runtime_dir
end

def copy_cef_dlls(configuration)
  Dir["#{$PLATFORM_CEF}/#{configuration}/*dll"].each { |dll|
    cp dll, runtime_dir
  }
end

def copy_cef_resources(configuration)
  Dir["#{$PLATFORM_CEF}/Resources/*"].each { |resource|
    cp_r resource, runtime_dir
  }
end

def copy_rb_chrome_dll(configuration)
  cp "#{$PLATFORM_CEF}/rbChrome/#{configuration}/rbChrome.dll", runtime_dir
end

def copy_rb_chrome_proc_exe(configuration)
  cp "#{$PLATFORM_CEF}/rbChromeProc/#{configuration}/rbChromeProc.exe", runtime_dir
end

def copy_simple_chrome_proc_exe(configuration)
  cp "#{$PLATFORM_CEF}/simpleChromeProc/#{configuration}/simpleChromeProc.exe", runtime_dir
end

def build_task(configuration)
  desc "Build the #{configuration} configuration of the runtime"
  task :build do
    puts 'Building rbChrome runtime'
    clean_runtime(configuration)
    copy_cef_dlls(configuration)
    copy_cef_resources(configuration)
    copy_rb_chrome_dll(configuration)
    copy_rb_chrome_proc_exe(configuration)
    copy_simple_chrome_proc_exe(configuration)
  end
end

task default: 'runtime:build'

namespace :runtime do
  namespace :release do
    build_task('Release')
  end
  namespace :debug do
    build_task('Debug')
  end
end

task :clean do
  sh "git clean -fdX"
end
