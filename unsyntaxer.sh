#!/usr/bin/env bash

${TM_RUBY:-ruby} <<"RUBY"
  	STDIN.each_line do |line|
	  line.gsub!('<span class="punct">','')
	  line.gsub!('<span class="string">','')
	  line.gsub!('<span class="attribute">','')
	  line.gsub!('<span class="punct">','')
	  line.gsub!('<span class="tag">','')
	  line.gsub!('</span>','')
	  puts line
	end
  RUBY
${TM_RUBY}