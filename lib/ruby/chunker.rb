#!/usr/bin/ruby 
#
#
class Chunk
  def initialize(file,tag)
    @file = file
    @tag = tag
  end

  def process
    lines = []
    reading = false
    File.read(@file).each_line do |line|
      if ( line.match(/START #{@tag}/) ) 
        reading = true 
        next
      end
      reading = false if ( line.match(/END #{@tag}/) ) 
      lines << line if (reading == true)
    end

    return lines.to_s
      
  end
end

#puts Chunk.new("#{File.dirname(__FILE__)}/../../../infrastructure/lib/config_validator.rb","sudoers").process
# how do I syntaxify the ourput
