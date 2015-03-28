def configure_mruby_nanomsg(conf)
  gem_dir = File.dirname(__FILE__)

  # Common include path (all platforms)
  conf.cc.include_paths << "#{gem_dir}/include/nanomsg"
  conf.cxx.include_paths << "#{gem_dir}/include/nanomsg"

  # Building against the static nanomsg library requires
  # defining NN_NOEXPORTS to prevent the use of __declspec(dllimport)
  # in the header files
  conf.cc.defines << "NN_NO_EXPORTS"
  conf.cxx.defines << "NN_NO_EXPORTS"

  if ENV['OS'] =~ /windows/i

    # Pre-built libraries are held under "#{gem_dir}/lib/PLATFORM"
    conf.linker.library_paths << "#{gem_dir}/lib/win"

    # I've appended the selected C runtime nanomsg was built with onto the lib file name
    conf.linker.libraries << "nanomsg_md"
    conf.linker.libraries << "Rpcrt4"
    conf.linker.libraries << "Mswsock"
  else
    raise "No mruby-nanomsg build settings configured for this platform"
  end
end

MRuby::Gem::Specification.new('mruby-nanomsg') do |spec|
  spec.license = 'MIT'
  spec.author  = 'Jared Breeden'
  spec.summary = 'Bindings to the nanomsg'
end
