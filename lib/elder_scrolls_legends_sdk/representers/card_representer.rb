require 'elder_scrolls_legends_sdk/representers/card_set_representer'
require 'elder_scrolls_legends_sdk/card_set'

module ElderScrollsLegends
  module CardRepresenter
    include Roar::JSON

    property :name
    property :rarity
    property :type
    property :subtype
    property :cost
    property :power
    property :health
    property :soul_summon, as: :soulSummon
    property :soul_trap, as: :soulTrap
    property :text
    property :unique
    property :image_url, as: :imageUrl
    property :id
    property :set, extend: CardSetRepresenter, class: CardSet
    collection :attributes
    collection :keywords
  end
end