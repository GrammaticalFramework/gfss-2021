resource ResEng = {

  --- params
  param
    Number = Sg | Pl ;

  --- types for the lincats
  oper
    Noun : Type = {s : Number => Str} ;

    NounPhrase,
    Determiner : Type
      = {s : Str ; n : Number} ;

    Verb : Type = {s : Number => Str} ;

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

    mkV,
    mkV2 : Str -> Verb ;
    mkV str = {
      s = table {
        Sg => str + "s" ;
        Pl => str
        }
      } ;

    mkV2 = mkV ;

    wipCopula : Verb = {
      s = table {
        Sg => "is" ;
        Pl => "are"
        }
      } ;

    mkAdv : Str -> {s : Str} ;
    mkAdv str = {s = str} ;



}
