module ElderScrollsLegends
  module SetRepresenter
    include Roar::JSON

    property :name
    property :release_date, as: :releaseDate
    property :total_cards, as: :totalCards
    property :id
  end
end