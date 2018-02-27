# encoding: UTF-8
require 'test_helper'

class CardTest < Minitest::Test
  def test_find_returns_one_card
    VCR.use_cassette('one_card') do
      card = ElderScrollsLegends::Card.find('1fd81123ab3eca0b29c4c19757045db9757b4f1a')

      assert_equal '1fd81123ab3eca0b29c4c19757045db9757b4f1a', card.id
      assert_equal 'Legendary', card.rarity
      assert_equal 'Creature', card.type
      assert_equal ['Dragon'], card.subtypes
      assert_equal 20, card.cost
      assert_equal 12, card.power
      assert_equal 12, card.health
      assert_equal 'hos', card.set.id
      assert_equal 'Heroes of Skyrim', card.set.name
      assert_equal 'https://api.elderscrollslegends.io/v1/sets/hos', card.set._self
      assert_equal true, card.collectible
      assert_equal 1200, card.soul_summon
      assert_equal 400, card.soul_trap
      assert_equal 'Costs 2 less for each Dragon in your discard pile. Summon: Destroy all other creatures. At the start of your turn, summon a random Dragon from your discard pile.', card.text
      assert_equal ['Neutral'], card.attributes
      assert_equal [], card.keywords
      assert_equal true, card.unique
      assert_equal 'https://images.elderscrollslegends.io/hos/alduin.png', card.image_url
    end
  end
  
  def test_find_with_invalid_id_throws_exception
    VCR.use_cassette('invalid_id') do
      assert_raises ArgumentError do
        ElderScrollsLegends::Card.find('zzzz')
      end
    end
  end

  def test_all_returns_cards
    VCR.use_cassette('all_filtered') do
      cards = ElderScrollsLegends::Card.where(type: 'creature', rarity: 'legendary', 'set.id': 'fodb')

      card = cards[0]
      assert_equal 'Creature', card.type
      assert_equal 'Legendary', card.rarity
      assert_equal 'fodb', card.set.id
    end
  end
  
  def test_all_returns_all_cards
    VCR.use_cassette('all_cards') do
      stub_request(:any, "https://api.elderscrollslegends.io/v1/cards").
        to_return(:body => File.new('test/responses/sample_cards.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})
      
      stub_request(:any, "https://api.elderscrollslegends.io/v1/cards?page=2").
        to_return(:body => File.new('test/responses/no_cards.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})
        
      cards = ElderScrollsLegends::Card.all
      
      assert_equal 4, cards.length
    end
  end
end