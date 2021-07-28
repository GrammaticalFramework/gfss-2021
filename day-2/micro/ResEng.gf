resource ResEng = {

  --- params
  param
    Number = Sg | Pl ;
    Gender = Masc | Fem | Neutr | Inanimate ;

    Agr =
      P1 Number |
      P2 Number |
      P3Sg Gender |
      P3Pl |
      Inf ;

    Case =
      Nom | -- for pronouns: I, she, they
      Acc ; --               me, her, them

  oper
    agr2num : Agr -> Number = \a -> case a of {
      P3Sg (Fem|Masc|Inanimate)
        => Sg ;
      _ => Pl
    } ;

    {- Demonstration: case expressions are syntactic sugar for tables
    agr2numTbl : Agr => Number = table {
      P3Sg (Fem|Masc|Inanimate)
        => Sg ;
      _ => Pl
    } ; -}

  reflPron : Agr => Str = table {
    P1 Sg => "myself" ;
    P1 Pl => "ourselves" ;
    P2 Sg => "yourself" ;
    P2 Pl => "yourselves" ;
    P3Sg Fem => "herself" ;
    P3Sg Masc => "himself" ;
    P3Sg Neutr => "themself" ;
    P3Sg Inanimate => "itself" ;
    P3Pl => "themselves" ;
    _ => "???"
    } ;

  --- types for the lincats
  oper
    -- bubble of (Common) Noun & Determiner
    Noun       : Type = {s : Number => Str} ;
    Determiner : Type = {s : Str ; n : Number} ;


    -- bubble of NP & VP
    Verb       : Type = {s : Number => Str} ; -- lincat of V, V2

    VerbPhrase : Type = {s : Agr => Str} ; -- lincat of VP
    NounPhrase : Type = {s : Case => Str ; a : Agr} ;

  --- lexicon constructor opers
  oper

    mkPrep : Str -> {s : Str}  ;
    mkPrep str = {s = str} ;

    mkDet : Str -> Number -> Determiner ;
    mkDet str num = {s = str ; n = num} ;

  -- Syntax for giving arguments to a fun/oper
  -- random : Str -> Str -> Str -> Str -> Str -> Str -> Str -> Str -> Str ;
  -- random' : (x1,_,_,_,_,_,_,x8 : Str) -> Str ;

--    mkPron : Str -> Str -> Agr -> NounPhrase ;
    mkPron : (nom, acc : Str) -> Agr -> NounPhrase ;
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
        Sg => str + "s" ; -- jumps, walks
        _    => str -- I jump, you jump, they jump
        }
      } ;

    mkV2 = mkV ;

    copula : Agr => Str = table {
        P1 Sg      => "am" ;  -- I am
        P3Sg Neutr => "are" ; -- they are (singular they)
        P3Sg _     => "is" ;  -- he/she/it is
        Inf => "be" ;
        _          => "are"   -- we/youSg/youPl/theyPl are
      } ;

    negation : Agr => Str = table {
        Inf        => "do" ;
        P3Sg Neutr => "don't" ; -- they don't (singular they)
        P3Sg _     => "doesn't" ;  -- he/she/it doesn't
        _          => "don't"   -- I/we/youSg/youPl/theyPl don't
      } ;

    mkAdv : Str -> {s : Str} ;
    mkAdv str = {s = str} ;

}
