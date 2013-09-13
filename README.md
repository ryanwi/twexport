# twexport

## Description

A Ruby library for bulk exporting Twitter user profile information. Currently supports Twitter Lists and web pages with links to twitter users.  The information is saved to CSV file.

## Requirements

  * Ruby (developed and tested on 1.9.3 and up)

## Installation

Install via RubyGems:

    gem install twexport

## Configuration

* Create an app at dev.twitter.com
* On the app details page (https://dev.twitter.com/apps/yourappid/show), click the "Create my access token" button

## Usage

With a command line

    $ irb
     > require 'twexport'


To export a Twitter List, use a combination of username and list name
```ruby
twexport = Twexport::TwitterList.new(:screen_name => "twitter", :list_slug => "team", 
  :consumer_key => "", 
  :consumer_secret => "", 
  :access_token => "", 
  :access_token_secret => "")
twexport.save('team.csv')
```

or use a list id
```ruby
twexport = Twexport::TwitterList.new(:list_id => 2031945, 
  :consumer_key => "", 
  :consumer_secret => "", 
  :access_token => "", 
  :access_token_secret => ""))
twexport.save('team.csv')
```

To export information for users listed in a web page
```ruby
twexport = Twexport::WebPage.new(:url => "http://techcrunch.com/about/", 
  :consumer_key => "", 
  :consumer_secret => "", 
  :access_token => "", 
  :access_token_secret => "")
twexport.save('tcwriters.csv')
```


## Other libraries of interest
[t - A command-line power tool for Twitter](http://sferik.github.com/t/)