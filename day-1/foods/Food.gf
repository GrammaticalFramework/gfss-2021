-- (c) 2009 Aarne Ranta under LGPL

abstract Food = {
  flags startcat = Comment ;
  cat
    Comment ;  -- Start category
    Item ;
    Kind ;     -- "nouns"
    Quality ;  -- "adjectives"
  fun
    Pred :
      Item -> Quality -> Comment ;       -- Predication: "item is quality"


    This, That, These, Those :
      Kind -> Item ; -- Quantification: turn the Kind ("pizza") into Item ("this pizza")

    Mod :
     Quality -> Kind -> Kind ;  -- Modification: "pizza" to "boring pizza"

    Wine, Cheese, Fish, Pizza : Kind ;        -- list of Kinds

    Very : Quality -> Quality ;               -- Enhance a Quality: "boring" to "very boring"
    Fresh, Warm, Italian, Boring,
         Expensive, Delicious : Quality ;     -- list of Qualities
}
