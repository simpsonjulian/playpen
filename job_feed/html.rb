#!/usr/bin/env ruby
require 'erb'
require 'job'
class  JobPage
	JOB_TEMPLATE = "html.erb"
	PAGE_TEMPLATE = "layout.erb"
	def initialize
	end

	def render_jobs
		job_html = ""
		Job.find.reverse.each do |job|
  		job_html << ERB.new(File.read(JOB_TEMPLATE)).result(binding)
		end
		job_html
	end

	def render_page
		content = render_jobs
		ERB.new(File.read(PAGE_TEMPLATE)).result(binding)
	end

	def self.render
		self.new.render_page
	end
end
puts JobPage.render
