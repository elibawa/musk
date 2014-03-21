FactoryGirl.define do
  factory :track, class: Musk::Track do
  end

  factory :jets_track, parent: :track do
    path File.expand_path("../../tracks/bonobo/jets.mp3", __FILE__)
    title "Jets"
    position 6
    artist "Bonobo"
    album "The North Borders"
    genre "Electronic"
    year 2013
  end

  factory :kamakura_track, parent: :track do
    path File.expand_path("../../tracks/emancipator/kamakura.mp3", __FILE__)
    title "Kamakura"
    position 4
    artist "Emancipator"
    album "Safe In The Steep Cliffs"
    genre "Electronic"
    year 2010
  end
end
