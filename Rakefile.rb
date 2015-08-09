module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end
end

namespace :mruby do
  desc "Build the mruby bundled with lamina"
  task :build do
    Dir.chdir "mruby" do
      ENV['CEF_HOME'] = CEF.dir
      sh "ruby minirake"
    end

    # Hack:
    # Something is going wrong in mruby build process...
    # Not getting the .exe extensions for executables.
    # I'll try to fix this later
    if ENV['OS'] =~ /windows/i
      Dir.chdir "mruby/bin" do
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
    Dir.chdir "mruby" do
      sh "ruby minirake clean"
    end
  end
end

## Defunct
# namespace :install do
#   desc "Installs to C:\\opt\\lamina"
#   task :win => 'binaries:win' do
#     mkdir '/opt/lamina' unless Dir.exists? '/opt/lamina'
#     Dir["../binaries-win/*"].each do |f|
#       cp_r f, "/opt/lamina"
#     end
#   end
#
#   desc "Installs to /opt/lamina"
#   task :lin64 => 'binaries:lin64' do
#     mkdir '/opt/lamina' unless Dir.exists? '/opt/lamina'
#     Dir["../binaries-lin64/*"].each do |f|
#       cp_r f, "/opt/lamina"
#     end
#   end
# end

## Defunct
# desc "Update docs for all component repos"
# task :docs do
#     repo_dir = File.expand_path(Dir.pwd)
#     in_each_repo do
#       next unless File.exists? 'MDDOC.rb'
#       puts
#       puts '---'
#       puts "md-doc: #{File.expand_path Dir.pwd}"
#       puts '---'
#       sh "ruby #{repo_dir}/md-doc.rb"
#     end
# end
