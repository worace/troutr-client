# Angler: A Troutr Client

A simple client for interacting with the Troutr API.

## Installation

Add this line to your application's Gemfile:

    gem 'troutr_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install troutr_client

## Usage

In IRB: require 'troutr'

API Calls require an access token; initialize like so:
`c = Troutr::Client.new({:token=>"SomeSecureToken"})`

Get a feed:
`client.get_feed(display_name)`

So:
`c.get_feed("worace")`
will return the contents of worace's feed

Post a TextItem:
`client.create_text_item(display_name, post_body)`
`c.create_text_item("worace", "GOING TO THE MOUNTANS TO FISH SOME FANTASTIC TROUTS THIS WEEKEND")`

Post a LinkItem:
`client.create_link_item(display_name, link_url, optional_comment)`
`c.create_link_item("worace","http://savethetrout.org","Save the trouts!")`

Post an ImageItem
`client.create_image_item(display_name, image_url, optional_comment)`
`c.create_image_item("worace","http://www.dfg.ca.gov/fish/images/FishOnly/CaGoldTrt2.jpg","What a lovely trout!")`

Retrout an Item
`client.retrout_item(owner_display_name, item_id)`
`client.retrout_item("chefpierre", "446")`


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

