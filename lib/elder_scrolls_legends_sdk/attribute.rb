module ElderScrollsLegends
  class Attribute
    include RestClient
    
    # Get all attributes
    #
    # @return [Array<String>]  All attributes
    def self.all
      RestClient.get('attributes').body['attributes']
    end
  end
end