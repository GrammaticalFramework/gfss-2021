resource ResEng = {

  --- params
  param
    Number = Sg | Pl ;
    VerbAgr =
      P1Sg | -- I am
      P3Sg | -- he/she/it is
      WeYouThey ;  -- we/you/they are

    Case =
      Nom | -- for pronouns: I, she, they
      Acc ; --               me, her, them


  --- types for the lincats
  oper
    -- bubble of (Common) Noun & Determiner
    Noun       : Type = {s : Number => Str} ;
    Determiner : Type = {s : Str ; n : Number} ;


    -- bubble of NP & VP
    Verb       : Type = {s : VerbAgr => Str} ; -- lincat of V, V2, VP
    NounPhrase : Type = {s : Case => Str ; a : VerbAgr} ;

  --- lexicon constructor opers
  oper

    mkPrep : Str -> {s : Str}  ;
    mkPrep str = {s = str} ;

    mkDet : Str -> Number -> Determiner ;
    mkDet str num = {s = str ; n = num} ;

  -- Syntax for giving arguments to a fun/oper
  -- random : Str -> Str -> Str -> Str -> Str -> Str -> Str -> Str -> Str ;
  -- random' : (x1,_,_,_,_,_,_,x8 : Str) -> Str ;

--    mkPron : Str -> Str -> VerbAgr -> NounPhrase ;
    mkPron : (nom, acc : Str) -> VerbAgr -> NounPhrase ;
    mkPron nom acc agr = {
      s = table {
           Nom => nom ;
           Acc => acc } ;
      a = agr
      } ;

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
        P3Sg => str + "s" ; -- jumps, walks
        _    => str -- I jump, you jump, they jump
        }
      } ;

    mkV2 = mkV ;

    wipCopula : Verb = {
      s = table {
        P1Sg => "am" ;
        P3Sg => "is" ;
        _ => "are"
        }
      } ;

    mkAdv : Str -> {s : Str} ;
    mkAdv str = {s = str} ;

}
