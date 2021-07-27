resource ResEng = {

  --- params
  param
    Number = Sg | Pl ;

  --- types for the lincats
  oper
    Noun : Type = {s : Number => Str} ;

    Determiner : Type = {s : Str ; n : Number} ;

--    NounPhrase

  --- lexicon constructor opers
  oper

    mkPrep,
      mkPron  : Str -> {s : Str}  ;

    mkDet : Str -> Number -> Determiner ;
    mkDet str num = {s = str ; n = num} ;

    mkPrep str = {s = str} ;
    mkPron str = {s = str} ;

    -- ++ : "the" ++ "cat" = "the cat"
    -- +  : "cat" + "s"    = "cats"

    mkN : Str -> Noun ;
    mkN str = {
      s = table {
        Sg => str ;
        Pl => str + "s"
        }
      } ;

    mkA : Str -> {s : Str} ;
    mkA str = {s = str} ;

    mkV : Str -> {s : Str} ;
    mkV str = {s = str} ;

    mkV2 : Str -> {s : Str} ;
    mkV2 str = {s = str} ;

    mkAdv : Str -> {s : Str} ;
    mkAdv str = {s = str} ;
}
