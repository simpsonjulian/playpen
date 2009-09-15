require 'rake/packagetask'
require 'rake/clean'

CLEAN.include('pkg')
CLEAN.include('build**/*')
CLEAN.include('cruisecontrol.log')

task :default => [ :package ]


task :blog do 
		mkdir_p("build/Html")
  	sh "/usr/bin/ruby -I lib/ruby/syntax-1.0.0/lib lib/ruby/to_html.rb Html/*.html"
	cp("xml.css","build")
end

task :package => [ :ant ]


Rake::PackageTask.new("cruise-validator", "0.1")  do |p|
   p.need_zip = true
   p.package_files.include("lib/**/*.jar")
   p.package_files.include("src/**/*")
   p.package_files.include("test/**/*")
   p.package_files.include("*")
   ["logs","Rakefile","code","bin","code","studio_3",
   	"xml.css", "cruisecontrol.log"].each {|d| p.package_files.exclude(d)}
   p.package_dir=("build")
end

task :ant do
	sh "ant cruise-validator.jar"
end	


namespace :foo do 
  task :default do 
    puts "I'm the default task in namespace foo"
  end
end
