# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# TODO: Use all USR's for references/hash keys
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

require 'fileutils'
require 'json'
require 'erb'
require 'pry'

$module_name = ARGV[0]
$output_dir = ARGV[1] || 'bindings'

FileUtils.rm_rf($output_dir) if Dir.exists?($output_dir)
Dir.mkdir $output_dir

$current_function = nil
$classes = {} # Includes structs
$module_functions = []
$enums = {}

at_exit do
  make_declaration_tree
  generate_bindings
end

def make_declaration_tree
  while line = $stdin.gets
    begin
      datum = JSON.parse(line)
    rescue
      $stderr.puts "Error parsing json: #{line}"
      next
    end
    begin
      case datum["kind"]
      when "ClassDecl"
        next if datum['name'].include? ' '
        cxxClass = $classes[datum["name"]] || datum
        cxxClass['fields'] ||= []
        cxxClass['member_functions'] ||= []
        $classes[datum["name"]] = cxxClass
      when "StructDecl"
        next if datum['name'].include? ' '
        cxxClass = $classes[datum["name"]] || datum
        cxxClass['fields'] ||= []
        cxxClass['member_functions'] ||= []
        $classes[datum["name"]] = cxxClass
      when "ClassTemplate"
        cxxClass = $classes[datum["name"]] || datum
        cxxClass['fields'] ||= []
        cxxClass['member_functions'] ||= []
        cxxClass['is_template'] = 'true'
        $classes[datum["name"]] = cxxClass
      when "EnumDecl"
        next if datum['name'].include? ' '
        enum = $enums[datum['name']] || datum
        enum['constants'] ||= []
        $enums[datum['name']] = enum
      when "EnumConstantDecl"
        enum = $enums[datum['member_of']]
        raise "Unkown enum #{datum['member_of']}" unless enum
        enum['constants'].push(datum)
      when "CXXMethod"
        cxxClass = $classes[datum["member_of"]]
        raise "Unkown class #{datum['member_of']}" unless cxxClass
        cxxClass['member_functions'].push(datum)
        datum['params'] ||= []
        $current_function = datum
      when "FieldDecl"
        cxxClass = $classes[datum["member_of"]]
        raise "Unkown class #{datum['member_of']}" unless cxxClass
        cxxClass["fields"].push(datum)
      when "FunctionDecl"
        datum['params'] ||= []
        $current_function = datum
        $module_functions.push(datum)
      when "ParmDecl"
        $current_function['argc'] ||= 0
        $current_function['argc'] += 1
        $current_function['params'] ||= []
        $current_function['params'].push(datum)
      end
    rescue StandardError => ex
      $stderr.puts "Error on #{datum}: #{ex}"
    end
  end
end

def generate_bindings
  # Aoiding global references in templates
  module_name = $module_name
  module_functions = $module_functions
  enums = $enums.values

  class_erb = ERB.new(File.read('class_template.erb'), nil, "-")
  module_erb = ERB.new(File.read('module_template.erb'), nil, "-")
  enums_erb = ERB.new(File.read('enums_template.erb'), nil, "-")

  if $classes.any?
    to_gen = $classes.values.reject do |c|
        c['is_template'] || (
          c['fields'].length == 0 &&
          c['member_functions'].length == 0
        )
    end
    to_gen.each do |the_class|
      the_class.instance_eval do
        File.open("#{$output_dir}/mruby_#{the_class['name'].sub('::', '_')}.cpp", "w") do |file|
          file.puts(class_erb.result binding)
        end
      end
    end
  end

  if $enums.any?
    File.open("#{$output_dir}/#{module_name}.rb", "w") do |file|
      file.puts(enums_erb.result binding)
    end
  end

  File.open("#{$output_dir}/murby_#{module_name}.cpp", "w") do |file|
    file.puts(module_erb.result binding)
  end
end
