# twexport

A Ruby library for exporting Twitter user profile information. Currently supports Twitter Lists and web pages with links to twitter users.  The information is saved to CSV file.


## Installation

* Download or clone this repository


## Configuration


## Usage


To export a Twitter List, use a combination of username and list name
```ruby
twexport = Twexport::TwitterList.new(:screen_name => "twitter", :list_slug => "team")
twexport.save('team.csv')
```

or user a list id
```ruby
twexport = Twexport::TwitterList.new(2031945)
twexport.save('team.csv')
```

To export information for users listed in a web page
```ruby
twexport = Twexport::WebPage.new("http://techcrunch.com/about/")
twexport.save('tcwriters.csv')
```


## Other libraries of interest
[t - A command-line power tool for Twitter](http://sferik.github.com/t/)