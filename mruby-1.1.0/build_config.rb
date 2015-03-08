# For building libmruby.lib only (no binaries like mirb)
MRuby::Build.new('host') do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  conf.cc.flags =  conf.cc.flags[0].map { |val|
    val == "/MD" ? "/MT" : val
  }

  conf.cxx.flags =  conf.cxx.flags[0].map { |val|
    val == "/MD" ? "/MT" : val
  }

  Dir["mrbgems/*"].each do |gem_folder|
    next unless Dir.exists? gem_folder
    conf.gem :core => File.basename(gem_folder) unless gem_folder =~ /bin/
  end

  # Custom gems for this build
  conf.gem :github => 'iij/mruby-regexp-pcre'
  conf.gem :github => 'iij/mruby-dir'
  conf.gem :github => 'iij/mruby-io'
  conf.gem :github => 'iij/mruby-env'

  Dir["../mrbgems/*"].each do |gem_folder|
    conf.gem gem_folder
  end
end

## For building with the mruby binared (like mirb)
# MRuby::Build.new('host') do |conf|
#   # load specific toolchain settings
#
#   # Gets set by the VS command prompts.
#   if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
#     toolchain :visualcpp
#   else
#     toolchain :gcc
#   end
#
#   # conf.cc.flags =  conf.cc.flags[0].map { |val|
#   #   val == "/MD" ? "/MT" : val
#   # }
#   #
#   # conf.cxx.flags =  conf.cxx.flags[0].map { |val|
#   #   val == "/MD" ? "/MT" : val
#   # }
#
#   # include the default GEMs
#   conf.gembox 'full-core'
#
#   conf.gem :github => 'iij/mruby-regexp-pcre'
#   conf.gem :github => 'iij/mruby-dir'
#   conf.gem :github => 'iij/mruby-io'
#   #conf.gem :github => 'iij/mruby-env'
# end
