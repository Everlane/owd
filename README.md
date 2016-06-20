# OWD

[![Build Status](https://api.travis-ci.org/bluebottlecoffee/owd.svg?branch=master)](https://travis-ci.org/rochers/owd) [![Code Climate](https://codeclimate.com/github/rochers/owd.svg)](https://codeclimate.com/github/rochers/owd)

The owd gem is a simple client for One World Direct's XML API.

```ruby
client = OWD::Client.new(:client_id => 123, :client_authorization => 'XXXXXXXXXX')
client.api.inventory_create(:sku => 'MY-FANCY-SKU')
client.api.order_status({ order_reference: 666 })
```

## Installation

```bash
gem install owd
```

See OWD's website at http://www.owd.com

## Tests

The test suite can be ran using `rake` or `rake test`.
