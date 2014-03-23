FactoryGirl.define do
  factory :track, class: Musk::Track do
  end

  factory :jets_track, parent: :track do
    path File.join(ENV["MUSK_TRACKS_PATH"], "bonobo/jets.mp3")
    title "Jets"
    position 6
    artist "Bonobo"
    album "The North Borders"
    genre "Electronic"
    year 2013

    trait :loaded do
      comment "0"
    end
  end

  factory :kamakura_track, parent: :track do
    path File.join(ENV["MUSK_TRACKS_PATH"], "emancipator/kamakura.mp3")
    title "Kamakura"
    position 4
    artist "Emancipator"
    album "Safe In The Steep Cliffs"
    genre "Electronic"
    year 2010

    trait :loaded do
      comment "0"
    end
  end
end
