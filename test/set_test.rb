# encoding: UTF-8
require 'test_helper'

class SetTest < Minitest::Test
  def test_find_returns_one_set
    VCR.use_cassette('one_set') do
      set = ElderScrollsLegends::Set.find('cs')

      assert_equal 'cs', set.id
      assert_equal '2016-04-01', set.release_date
      assert_equal 444, set.total_cards
      assert_equal 'Core Set', set.name
    end
  end
  
  def test_find_with_invalid_id_throws_exception
    VCR.use_cassette('set_invalid_id') do
      assert_raises ArgumentError do
        ElderScrollsLegends::Set.find('zzzz')
      end
    end
  end

  def test_filter_returns_sets
    VCR.use_cassette('sets_filtered') do
      sets = ElderScrollsLegends::Set.where(totalCards: 'gt400')

      set = sets[0]
      assert_equal 1, sets.length
      assert_equal 'Core Set', set.name
    end
  end
  
  def test_all_returns_all_sets
    VCR.use_cassette('all_sets') do
      stub_request(:any, "https://api.elderscrollslegends.io/v1/sets").
        to_return(:body => File.new('test/responses/sample_sets.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})
      
      stub_request(:any, "https://api.elderscrollslegends.io/v1/sets?page=2").
        to_return(:body => File.new('test/responses/no_sets.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})
        
      sets = ElderScrollsLegends::Set.all
      
      assert_equal 6, sets.length
    end
  end
end