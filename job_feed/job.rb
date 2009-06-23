require 'yaml'

class Description
	def initialize(*attrs)
		@desc = attrs
	end

	def render
		
	end
end

class Job
  attr_reader :title, :location, :description, :url, :date
	FILE = 	"jobs.yaml"
  def initialize(title,
								desc,
								date = Time.now, 
								location="London", 
								url = "http://www.build-doctor.com/jobs")
		@file = "jobs.yaml"
		@title = title
		@description = desc
		@date = date
		@location = location
		@url = url	
  end


	def self.find
		results = []
		args = []
		date = ''
		jobs =  YAML.load_file(FILE)
		jobs.each_pair do |job,details|

			#	desc = details["desc"]
			#	date = details["date"]
			#	location = details["location"]
			#	url = details["url"] if details["url"]
			#	results << Job.new(job, desc, date, location, url)
			if details["url"]
				results << Job.new(job, details["desc"], details["date"], details["location"], details["url"])
			else
				results << Job.new(job, details["desc"], details["date"], details["location"])
			end
		end
		results 
	end

	def to_s
		"job: #{@title}" + "\n" + "desc: #{@description}"
	end

end
