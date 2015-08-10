require 'fileutils'

module LaminaBinGem
  def self.dir
    File.expand_path(File.dirname(__FILE__))
  end

  def self.include_dir
    "#{self.dir}/include"
  end
end

MRuby::Gem::Specification.new('mruby-bin-lamina') do |spec|
  spec.license = 'MIT'
  spec.author  = 'Jared Breeden'
  spec.summary = 'A Chromium shell for mruby apps'

  spec.cc.include_paths << "#{LaminaGem.include_dir}"
  spec.cxx.include_paths << "#{LaminaGem.include_dir}"
  spec.cxx.include_paths << ENV['CEF_HOME']

  # Clear the tools folder so we can copy over the right file for the current platform
  FileUtils.rm_rf("#{LaminaBinGem.dir}/tools/lamina") if Dir.exists?("#{LaminaBinGem.dir}/tools/lamina")
  FileUtils.mkdir_p("#{LaminaBinGem.dir}/tools/lamina")

  if OS.windows?
    FileUtils.cp "#{LaminaBinGem.dir}/platform-bins/win/lamina.cpp", "#{LaminaBinGem.dir}/tools/lamina"
  elsif OS.mac?
    # MRuby is going to default the language standard to gnu99, we
    # need to remove this since we're actually compiling objective c
    spec.cxx.flags = spec.cxx.flags.reject { |f| f =~ /-std=/ }

    # MRuby doesn't do anything with .mm files, so I'm using .cpp and specifying the language with the -x flag
    FileUtils.cp "#{LaminaBinGem.dir}/platform-bins/mac/lamina.cpp", "#{LaminaBinGem.dir}/tools/lamina"
    spec.cxx.flags << '-x objective-c++'
    spec.linker.flags << '-framework Cocoa'
  elsif OS.linux?
    FileUtils.cp "#{LaminaBinGem.dir}/platform-bins/lin/lamina.cpp", "#{LaminaBinGem.dir}/tools/lamina"
    spec.linker.flags << '-Wl,-rpath,\'$ORIGIN\''
    spec.linker.libraries << 'X11'
  else
    raise "Unrecognized or unsupported OS"
  end

  spec.bins = ['lamina']
end
