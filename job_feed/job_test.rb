require 'test/unit'
require 'job'

class JobTest < Test::Unit::TestCase

  def test_should_have_a_title
		j = Job.new("Chief Cat Herder","herd cats")
		assert_equal("Chief Cat Herder",j.title)
  end

  def test_default_should_be_in_london
		assert_equal("London", Job.new("goatherd","goatsee").location)
	end

	def test_should_have_a_description
		assert_equal("Tend the goats",Job.new("goatherd","Tend the goats").description)
	end

	def test_find_should_return_array_of_jobs
		assert_equal(Job,Job.find[0].class)
	end

	def test_should_have_an_url
		assert_match(/http:/,Job.new(nil,nil).url)
	end

	def test_should_have_a_date_
		assert_equal(Time,Job.new(nil,nil).date.class)
	end

	def test_should_overrride_default_utl
		assert_equal("http://pk.com",Job.new(nil,nil,nil,nil,"http://pk.com").url)
		assert_equal("http://www.build-doctor.com/jobs",Job.new(nil,nil,nil,nil).url)
	end

end

class JobFunctionalTest < Test::Unit::TestCase

	def test_feed_should_render_xml
		assert(system("ruby feed.rb test_feed.xml"))
	end

end

