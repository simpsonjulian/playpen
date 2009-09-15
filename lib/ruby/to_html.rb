require 'syntax'
require 'syntax/lang/ruby'
require 'syntax/convertors/html'

require 'erb'

$: << File.dirname(__FILE__)
require 'chunker'

def to_html(file)
  suffix = suffix(file)
  code_content = File.read(file)
  convertor = Syntax::Convertors::HTML.for_syntax(suffix)
  return convertor.convert(code_content)
end

def to_html_no_syntax(file)
	code = File.read(file)
	code.gsub!(/</,"&lt;")
	code.gsub!(/>/,"&gt;")
	out = '<pre name="code" class="xml">'
	out << code
	out << "</pre>"
	return out
end

def string_to_html(string)
  convertor = Syntax::Convertors::HTML.for_syntax("rb")
  return convertor.convert(string)
end

def process(file)
 template=ERB.new(File.read(file))
 out = File.new(File.join("build",file),"w+") 
 out << template.result
end

def suffix(file)
  bits = file.split(".")
  bits[bits.size - 1 ]
end

ARGV.each { |arg| process(arg) }
