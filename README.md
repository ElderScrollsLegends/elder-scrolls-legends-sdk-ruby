# Elder Scrolls: Legends SDK

[![Build Status](https://travis-ci.org/ElderScrollsLegends/elder-scrolls-legends-sdk-ruby.svg?branch=master)](https://travis-ci.org/ElderScrollsLegends/elder-scrolls-legends-sdk-ruby)
[![Maintainability](https://api.codeclimate.com/v1/badges/2505814ecf931870ff40/maintainability)](https://codeclimate.com/github/ElderScrollsLegends/elder-scrolls-legends-sdk-ruby/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2505814ecf931870ff40/test_coverage)](https://codeclimate.com/github/ElderScrollsLegends/elder-scrolls-legends-sdk-ruby/test_coverage)

This is the Elder Scrolls: Legends SDK Ruby implementation. It is a wrapper around the  Elder Scrolls: Legends API of [elderscrollslegends.io](https://elderscrollslegends.io/).

## Installation

Add this line to your application's Gemfile:

    gem 'elder_scrolls_legends_sdk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elder_scrolls_legends_sdk

## Usage

### Properties Per Class

#### Card

    name
    rarity
    type
    subtype
    cost
    power
    health
    soul_summon
    soul_trap
    text
    unique
    image_url
    id
    set
    attributes
    keywords

### Functions Available

#### Find a card by id

    card = ElderScrollsLegends::Card.find('1fd81123ab3eca0b29c4c19757045db9757b4f1a')

#### Filter Cards via query parameters

    cards = ElderScrollsLegends::Card.where(type: 'creature').where(subtype: 'dragon').all
    
#### Find all cards (will take awhile)

    cards = ElderScrollsLegends::Card.all
    
#### Get all cards, but only a specific page of data

    cards = ElderScrollsLegends::Card.where(page: 5).all

#### Get all Types

    types = ElderScrollsLegends::Type.all

#### Get all Subtypes

    subtypes = ElderScrollsLegends::Subtype.all

#### Get all Keywords

    keywords = ElderScrollsLegends::Keyword.all

#### Get all Attributes

    attributes = ElderScrollsLegends::Attribute.all

## Contributing

1. Fork it ( https://github.com/[my-github-username]/elder-scolls-legends-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
