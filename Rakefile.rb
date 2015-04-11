def in_each_repo(&block)
  %w(
    .
    ./mrbgems/mruby-apr
    ./mrbgems/mruby-cef
    ./mrbgems/mruby-nanomsg
    ./mrbgems/mruby-lamina
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
    if ENV['OS'] =~ /windows/i
      Dir.chdir "mruby-1.1.0/bin" do
        mv 'mirb', 'mirb.exe'
        mv 'mruby', 'mruby.exe'
        mv 'mrbc', 'mrbc.exe'
        mv 'mruby-strip', 'mruby-strip.exe'
        mv 'lamina', 'lamina.exe'
        mv 'laminaw', 'laminaw.exe'
      end
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
  task :win do
    unless Dir.exists? "../binaries-win"
      puts "Expected binaries-win folder at #{File.expand_path(File.dirname(__FILE__) + "/../binares-win")}"
      exit
    end
    rm_rf "../binaries-win/runtime"
    cp_r "./cef_runtime/win", "../binaries-win/runtime"
    Dir["./mruby-1.1.0/bin/*"].each do |f|
      cp f, "../binaries-win/runtime"
    end
    rm_rf "../binaries-win/samples"
    cp_r "./samples", "../binaries-win/samples"
  end
  
  desc "Move runtime & samples to ../binaries-lin64/"
  task :lin64 => 'mruby:build' do
    unless Dir.exists? "../binaries-lin64"
      puts "Expected binaries-lin64 folder at #{File.expand_path(File.dirname(__FILE__) + "/../binares-lin64")}"
      exit
    end
    Dir['../binaries-lin64/*'].each { |f| rm_rf f }
    mkdir '../binaries-lin64/bin'
    mkdir '../binaries-lin64/lib'
    Dir["./cef_runtime/lin64/*"].each do |f|
      if f =~ /.so$/
        cp f, '../binaries-lin64/lib/'
      else
        cp_r f, '../binaries-lin64/bin/'
      end
    end
    Dir["./mruby-1.1.0/bin/*"].each do |f|
      cp f, "../binaries-lin64/bin"
    end
    rm_rf "../binaries-lin64/samples"
    cp_r "./samples", "../binaries-lin64/samples"
  end
end

namespace :install do
  desc "Installs to /opt/lamina"
  task :lin64 => 'binaries:lin64' do
    mkdir '/opt/lamina' unless Dir.exists? '/opt/lamina'
    Dir["../binaries-lin64/*"].each do |f|
      cp_r f, "/opt/lamina"
    end
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
    in_each_repo do
        puts
        puts '---'
        puts "Git commit: #{File.expand_path Dir.pwd}"
        puts '---'
        next if `git status` =~ /nothing to commit/i
        print 'Commit message: '
        msg = $stdin.gets.strip
        sh "git commit -m \"#{msg}\" || echo NOTHING COMMITTED"
    end
  end

  desc "Run `git push` in every repo"
  task :push do
    in_each_repo do
        puts
        puts '---'
        puts "Git push: #{File.expand_path Dir.pwd}"
        puts '---'
        sh "git status"
        print 'remote: '
        remote = $stdin.gets.strip
        print 'branch: '
        branch = $stdin.gets.strip
        sh "git push #{remote} #{branch} || echo NOTHING PUSHED"
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
