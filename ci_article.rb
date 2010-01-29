servers = ['Team City','Ant Hill Pro','Hudson','Cruise']
platforms = ['Ruby','Perl','PHP','Python','.NET']

servers.each do |server|
  platforms.each do |platform|
    title = "Continuous Integration in #{platform} with #{server}"
    puts title
  end
end
  
  
