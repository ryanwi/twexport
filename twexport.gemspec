Gem::Specification.new do |s|
  s.name = 'twexport'
  s.version = '0.0.1'
  s.date = '2013-08-14'
  s.summary = 'Bulk export Twitter profile information to CSV'
  s.description = 'Twexport enables quick access to bulk Twitter profile information to be used for your analysis needs.  
    Given a list of twitter usernames, a twitter list, or a web page with one or many links to twitter profiles, 
    Twexport can gather profile information from the Twitter API and export into a CSV file.'
  s.authors = ["Ryan Williams"]
  s.email = 'ryan@ryan-williams.net'
  s.homepage = 'https://github.com/ryanwi/twexport'
  s.files = ["lib/twexport.rb", "lib/twexport/exporter.rb", 
    "lib/twexport/twitter_list.rb", "lib/twexport/web_page.rb"]
  s.require_paths = ["lib"]
  s.license = 'MIT'
  s.add_dependency('twitter')
  s.add_dependency('nokogiri')
  s.add_development_dependency('rspec')
  s.requirements << 'Twitter API keys'
end