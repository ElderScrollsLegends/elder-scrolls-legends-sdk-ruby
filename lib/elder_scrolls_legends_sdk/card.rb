require 'elder_scrolls_legends_sdk/representers/card_representer'

module ElderScrollsLegends
  class Card
    include Roar::JSON
    include CardRepresenter
  
    attr_accessor :name, :rarity, :type, :subtype, :cost, :power, :health, :soul_summon,
                  :soul_trap, :text, :unique, :image_url, :id, :set, :attributes, :keywords

    # Get the resource string
    #
    # @return [String] The API resource string
    def self.Resource
      "cards"
    end
    
    # Find a single card by the card id
    #
    # @param id [String] the card id
    # @return [Card] the Card object response
    def self.find(id)
      QueryBuilder.new(Card).find(id)
    end

    # Get all cards from a query by paging through data
    #
    # @return [Array<Card>] Array of Card objects
    def self.all
      QueryBuilder.new(Card).all
    end
    
    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [Array<Card>] Array of Card objects
    def self.where(args)
      QueryBuilder.new(Card).where(args)
    end
  end
end
