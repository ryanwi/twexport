lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = 'twexport'
  s.version = '0.1.0'
  s.date = '2014-10-09'
  s.summary = 'Export Twitter profile information to CSV'
  s.description = 'Twexport enables quick access to bulk Twitter profile information to be used for your analysis needs.
    Given a list of twitter usernames, a twitter list, or a web page with one or many links to twitter profiles,
    Twexport can gather profile information from the Twitter API and export into a CSV file.'
  s.authors = ["Ryan Williams"]
  s.email = 'ryan@ryan-williams.net'
  s.homepage = 'https://github.com/ryanwi/twexport'
  s.files = %w(LICENSE.md README.md twexport.gemspec) + Dir['lib/**/*.rb']
  s.require_paths = %w(lib)
  s.license = 'MIT'
  s.add_dependency "twitter", "~> 5.12"
  s.add_dependency "nokogiri"
  s.add_development_dependency "bundler", "~> 1.5"
  s.add_development_dependency "rspec", "~> 3.1"
  s.add_development_dependency "pry"
  s.requirements << 'Twitter API keys'
end
