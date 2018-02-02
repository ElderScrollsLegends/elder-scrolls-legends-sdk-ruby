module ElderScrollsLegends
  class Keyword
    include RestClient
    
    # Get all keywords
    #
    # @return [Array<String>]  All keywords
    def self.all
      RestClient.get('keywords').body['keywords']
    end
  end
end