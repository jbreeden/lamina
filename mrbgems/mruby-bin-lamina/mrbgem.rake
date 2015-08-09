require 'FileUtils'

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
  spec.cxx.flags = spec.cxx.flags.reject { |f| f =~ /-std=/ }

  # Clear the tools folder so we can copy over the right file for the current platform
  FileUtils.rm_rf("#{LaminaBinGem.dir}/tools/lamina") if Dir.exists?("#{LaminaBinGem.dir}/tools/lamina")
  FileUtils.mkdir("#{LaminaBinGem.dir}/tools/lamina")

  if OS.windows?
    FileUtils.cp "#{LaminaBinGem.dir}/platform-bins/win/lamina.cpp", "#{LaminaBinGem.dir}/tools/lamina"
  elsif OS.mac?
    # MRuby doesn't do anything with .m files, so I'm using .c and specifying the language with the -x flag
    FileUtils.cp "#{LaminaBinGem.dir}/platform-bins/mac/lamina.cpp", "#{LaminaBinGem.dir}/tools/lamina"
    spec.cxx.include_paths << "/Users/jared/projects/cef-build/cef_binary_3.2171.1979_macosx64"
    spec.cxx.flags << '-x objective-c++'
    spec.linker.flags << '-framework Cocoa'
  else
    FileUtils.cp "#{LaminaBinGem.dir}/platform-bins/lin/lamina.cpp", "#{LaminaBinGem.dir}/tools/lamina"
  end

  spec.bins = ['lamina']
end
