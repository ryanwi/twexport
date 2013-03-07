# twexport

A Ruby library for exporting Twitter user profile information. Currently supports Twitter Lists and web pages with links to twitter users.  The information is saved to CSV file.


## Installation

* Download or clone this repository


## Configuration

* Create an app at dev.twitter.com
* On the app details page (https://dev.twitter.com/apps/yourappid/show), click the "Create my access token" button
* Copy the Consumer key, Consumer secret, Access token, Access Token secret and put them in the config/app.yml.example
* Rename config/app.yml.example to config/app.yml


## Usage

With a command line

    $ cd twexport
    $ irb
    1.9.3p392 :001 > require './lib/twexport'


To export a Twitter List, use a combination of username and list name
```ruby
twexport = Twexport::TwitterList.new(:screen_name => "twitter", :list_slug => "team")
twexport.save('team.csv')
```

or use a list id
```ruby
twexport = Twexport::TwitterList.new(:list_id => 2031945)
twexport.save('team.csv')
```

To export information for users listed in a web page
```ruby
twexport = Twexport::WebPage.new("http://techcrunch.com/about/")
twexport.save('tcwriters.csv')
```


## Other libraries of interest
[t - A command-line power tool for Twitter](http://sferik.github.com/t/)