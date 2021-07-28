resource ResEng = {

  --- params
  param
    Number = Sg | Pl ;
    Gender = Masc | Fem | Neutr | Inanimate ;
    Polarity = Pos | Neg ;

    Agr =             -- 9 forms needed for reflexive pronouns
      P1 Number |
      P2 Number |
      P3Sg Gender |
      P3Pl ;

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
    P3Pl => "themselves"
    } ;

  --- types for the lincats
  oper
    Noun       : Type = {s : Number => Str} ;
    Determiner : Type = {s : Str ; n : Number} ;
    NounPhrase : Type = {s : Case => Str ; a : Agr} ;

    Verb       : Type = {s : Number => Str ; inf : Str} ; -- lincat of V, V2
    -- record extension: use all fields from Verb and extend with those after **
    VerbPhrase : Type = {  -- lincat of VP
      pred  : Polarity => Agr => Str ; -- loves/doesn't love/is/isn't
      compl : Agr => Str               -- the cat/yourself/themselves
      } ;

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
        } ;
      inf = str ;
      } ;

    mkV2 = mkV ;

    copula : Agr => Str = table {
        P1 Sg      => "am" ;  -- I am
        P3Sg Neutr => "are" ; -- they are (singular they)
        P3Sg _     => "is" ;  -- he/she/it is
        _          => "are"   -- we/youSg/youPl/theyPl are
      } ;

    negCopula : Agr => Str = table {
        P1 Sg      => "am not" ;  -- I am not
        P3Sg Neutr => "aren't" ;  -- they aren't (singular they)
        P3Sg _     => "isn't" ;   -- he/she/it isn't
        _          => "aren't"    -- we/youSg/youPl/theyPl aren't
      } ;

    negation : Agr => Str = table {
        P3Sg Neutr => "don't" ; -- they don't (singular they)
        P3Sg _     => "doesn't" ;  -- he/she/it doesn't
        _          => "don't"   -- I/we/youSg/youPl/theyPl don't
      } ;

    mkAdv : Str -> {s : Str} ;
    mkAdv str = {s = str} ;

}
