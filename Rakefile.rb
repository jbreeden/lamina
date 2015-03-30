def in_each_repo(&block)
  %w(
    .
    ./mrbgems/mruby-apr
    ./mrbgems/mruby-cef
    ./mrbgems/mruby-nanomsg
  ).each do |component_dir|
      Dir.chdir(component_dir, &block)
    end
end

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
  desc "Check status of all component repos"
  task :status do
    in_each_repo do
        puts
        puts '---'
        puts "Git status: #{File.expand_path Dir.pwd}"
        puts '---'
        sh "git status"
    end
  end

  desc "Run `git diff` in every repo"
  task :diff do
    in_each_repo do
        puts
        puts '---'
        puts "Git diff: #{File.expand_path Dir.pwd}"
        puts '---'
        sh "git diff"
    end
  end

  desc "Run `git diff` in every repo"
  task :diff_cached do
    in_each_repo do
        puts
        puts '---'
        puts "Git diff: #{File.expand_path Dir.pwd}"
        puts '---'
        sh "git diff --cached"
    end
  end

  desc "Run `git add -u` in every repo"
  task :update do
    in_each_repo do
        puts
        puts '---'
        puts "Git update: #{File.expand_path Dir.pwd}"
        puts '---'
        sh "git add -u"
    end
  end

  desc "Run `git add -u` in every repo"
  task :commit do
    print 'Commit message: '
    msg = $stdin.gets.strip
    in_each_repo do
        puts
        puts '---'
        puts "Git commit: #{File.expand_path Dir.pwd}"
        puts '---'
        sh "git commit -m \"#{msg}\" || echo NOTHING COMMITTED"
    end
  end
end

desc "Update docs for all component repos"
task :docs do
    repo_dir = File.expand_path(Dir.pwd)
    in_each_repo do
      next unless File.exists? 'MDDOC.rb'
      puts
      puts '---'
      puts "md-doc: #{File.expand_path Dir.pwd}"
      puts '---'
      sh "ruby #{repo_dir}/md-doc.rb"
    end
end
