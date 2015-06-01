$apr_dir = File.expand_path "../../../vendor/apr-1.5.1/include"
$cef_dir = File.expand_path "../../../vendor/cef_binary_3.2171.1979_windows32"
$nn_dir = File.expand_path "../../../vendor/nanomsg-0.5-beta/src"

def generate_bindings(module_name, output_dir)
  IO.popen("ruby mruby_bindings.rb #{module_name} #{output_dir}", 'w') do |io|
    File.open('declarations.json', 'r') do |file|
      while line = file.gets
        io.puts line
      end
    end
  end
end

namespace :scrape do
  desc "Generate ldjson file for apr headers"
  task :apr do
    File.delete "declarations.json" if File.exists? 'declarations.json'
    Dir["#{$apr_dir}/*.h"].each do |header|
      sh "\"./Debug/c2lsjson.exe\" -x c++ -I #{$apr_dir} -I C:/projects/lamina/dev/mrbgems/mruby-apr/include/apr/win #{$apr_dir}/#{File.basename(header)} >> declarations.json"
    end

  end

  desc "Generate ldjson file for cef headers"
  task :cef do
    File.delete "declarations.json" if File.exists? 'declarations.json'
    Dir["#{$cef_dir}/include/*.h"].each do |header|
      sh "\"./Debug/c2lsjson.exe\" -x c++ -I #{$cef_dir}  #{$cef_dir}/include/#{File.basename(header)} >> declarations.json"
    end
  end

  desc "Generate ldjson file for nanomsg headers"
  task :nanomsg do
    File.delete "declarations.json" if File.exists? 'declarations.json'
    Dir["#{$nn_dir}/**/*.h"].each do |header|
      sh "\"./Debug/c2lsjson.exe\" -x c++ -I #{$nn_dir} #{header} >> declarations.json"
    end
  end
end

namespace :bindings do
  desc "Generates bindings for APR"
  task :apr => ['scrape:apr'] do
    generate_bindings('APR', 'apr_bindings')
  end

  desc "Generates bindings for CEF"
  task :cef => ['scrape:cef'] do
    generate_bindings('Cef', 'cef_bindings')
  end

  desc "Generates bindings for CEF"
  task :nanomsg => ['scrape:nanomsg'] do
    generate_bindings('NN', 'nanomsg_bindings')
  end
end
