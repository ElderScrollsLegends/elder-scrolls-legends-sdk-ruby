require 'elder_scrolls_legends_sdk/representers/card_set_representer'

module ElderScrollsLegends
  class CardSet
    include Roar::JSON
    include CardSetRepresenter
  
    attr_accessor :id, :name, :_self
  end
end
