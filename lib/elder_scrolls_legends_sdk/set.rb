require 'elder_scrolls_legends_sdk/representers/set_representer'

module ElderScrollsLegends
  class Set
    include Roar::JSON
    include SetRepresenter
  
    attr_accessor :name, :release_date, :total_cards, :id

    # Get the resource string
    #
    # @return [String] The API resource string
    def self.Resource
      "sets"
    end
    
    # Find a single card by the set id
    #
    # @param id [String] the set id
    # @return [Set] the Set object response
    def self.find(id)
      QueryBuilder.new(Set).find(id)
    end

    # Get all set from a query by paging through data
    #
    # @return [Array<Set>] Array of Set objects
    def self.all
      QueryBuilder.new(Set).all
    end
    
    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [Array<Set>] Array of Set objects
    def self.where(args)
      QueryBuilder.new(Set).where(args)
    end
  end
end
