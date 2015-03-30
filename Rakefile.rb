namespace :mruby do
  desc "Build the mruby bundled with lamina"
  task :build do
    Dir.chdir "mruby-1.1.0" do
      sh "ruby minirake"
    end

    # Hack:
    # Something is going wrong in mruby build process...
    # Not getting the .exe extensions for executables.
    # I'll try to fix this later
    Dir.chdir "mruby-1.1.0/bin" do
      mv 'mirb', 'mirb.exe'
      mv 'mruby', 'mruby.exe'
      mv 'mrbc', 'mrbc.exe'
      mv 'mruby-strip', 'mruby-strip.exe'
      mv 'lamina', 'lamina.exe'
    end
  end

  desc "Clean the mruby bundled with lamina"
  task :clean do
    Dir.chdir "mruby-1.1.0" do
      sh "ruby minirake clean"
    end
  end
end

namespace :binaries do
  desc "Move runtime & samples to ../binaries-win/"
  task :win => 'mruby:build' do
    unless Dir.exists? "../binaries-win"
      puts "Expected binaries-win branch at #{File.expand_path(File.dirname(__FILE__) + "/../binares-win")}"
    end
    rm_rf "../binaries-win/runtime"
    cp_r "./cef_runtime", "../binaries-win/runtime"
    Dir["./mruby-1.1.0/bin/*"].each do |f|
      cp f, "../binaries-win/runtime"
    end
    rm_rf "../binaries-win/samples"
    cp_r "./samples", "../binaries-win/samples"
  end
end

namespace :git do
  task :status do
    ['.',
      './mrbgems/mruby-apr',
      './mrbgems/mruby-cef',
      './mrbgems/mruby-nanomsg'].each do |repo_dir|
        Dir.chdir(repo_dir) do
          puts
          puts '---'
          puts "Git status: #{File.expand_path Dir.pwd}"
          puts '---'
          sh "git status"
        end
      end
  end
end
