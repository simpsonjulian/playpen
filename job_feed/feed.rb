#!/usr/bin/env ruby
require 'rss/maker'
require 'job'

version = "2.0" # ["0.9", "1.0", "2.0"]
destination = "jobs.xml" # local file to write

content = RSS::Maker.make(version) do |m|
	m.channel.title = "Build Doctor London Jobs Feed"
	m.channel.link = "http://www.build-doctor.com/jobs"
	m.channel.description = "London build and deploy jobs"
	m.items.do_sort = true # sort items by date

	Job.find.each do |j|
  
		i = m.items.new_item
		i.title = j.title + ", " + j.location
		i.link = j.url
		i.description = j.description
		i.date = Time.parse(j.date)
	end
end

File.open(destination,"w") do |f|
	f.write(content)
end
