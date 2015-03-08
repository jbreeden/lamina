$CEF_BUILDS = Dir['cef*']
if ENV['OS'] =~ /windows/i
  $PLATFORM = :windows
  $PLATFORM_CEF = $CEF_BUILDS
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

def copy_lamina_exe(configuration)
  if $PLATFORM == :windows
    cp "VisualStudioProjects/Lamina/#{configuration}/lamina.exe", runtime_dir
  else
    fail "No lamina exe defined for this platform"
  end
end

def build_task(configuration)
  desc "Build the #{configuration} configuration of the runtime"
  task :build do
    clean_runtime(configuration)
    copy_cef_dlls(configuration)
    copy_cef_resources(configuration)
    copy_lamina_exe(configuration)
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

namespace :mruby do
  task :build do
    Dir.chdir "mruby-1.1.0" do
      sh "ruby minirake"
    end
  end

  task :clean do
    Dir.chdir "mruby-1.1.0" do
      sh "ruby minirake clean"
    end
  end
end

task :clean do
  sh "git clean -fd"
end
