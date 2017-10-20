# Ruby-Phishtank
<tt>ruby-phishtank</tt> is a straight-forward gem for accessing PhishTank's API to determine if a URL is a phishing site.

## Features
- Fetch raw data on a Phishtank phishing listing in formats (as provided by phishtank): json, xml, php.
- Parsed data methods (e.g. <tt>is_valid_phishing?</tt>, <tt>in_database?</tt> etc.).
- Phishtank DB snapshot download. Available in formats (as provided by phishtank): json, csv, xml, php_serialized.

## Requirements

* Ruby >= 1.9.3

## Installation

```shell
$ gem install whois
```

## Getting Started

First, let's require ruby-phishtank
```ruby
require 'phishtank'
```
Here are a few basic examples:

### Fetching raw data as XML
```ruby
client = Phishtank::Raw.new('ACCESS_KEY', 'xml')
raw.check_url('https://google.com')
```
<b>Available formats</b>:
* json
* xml
* php

### Using scanner for parsed data
```ruby
scanner = Phishtank::Scanner.new('ACCESS_KEY')
parsed_data = scanner.scan('https://phishingsite.com/login.php')

# Determine if phishing site
parsed_data.is_valid_phishing?

# Determine if site was verified by a phishtank community
parsed_data.is_verified?

# Determine if site was verified by a phishtank community
parsed_data.is_verified?

# Check if site is in Phishtank DB
parsed_data.in_database?
```
<b>Methods</b>:
* <tt>is_valid_phishing?</tt>
* <tt>is_verified?</tt>
* <tt>verified_at</tt>
* <tt>in_database?</tt>
* <tt>phishing_site_url</tt>
* <tt>phishtank_details_url</tt>
* <tt>phish_id</tt>

### Downloading DB snapshot
```ruby
db = Phishtank::DB.new('ACCESS_KEY', 'csv', 'gz')
result = db.download
```
<b>Available formats</b>:
* json
* csv
* xml
* php_serialized
 
<b>Available compression methods</b>:
* gz
* bz2
* <tt>nil</tt> > if no compression required
