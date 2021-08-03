concrete ReflexiveEng of Reflexive = {
  lincat
    N = Noun ;
    NP = NounPhrase ;
    VP = VerbPhrase ;

  lin
    --  : NP -> VP -> S ; -- I eat food ; you see yourself
    PredVPS np vp = {
      s = np.s ! Nom ++ vp.s ++ vp.compl ! np.a
    } ;

    -- : V2 -> NP -> VP ; -- eat food, see you
    ComplV2 v2 np = v2 ** {
      compl = \\_ => np.s ! Acc
    } ;

    -- : V2       -> VP ; -- see my/your/…self
    ReflV2 v2 = v2 ** {
      compl = reflPron
    } ;

    -- : N -> NP ; -- the cat, the cats, food
    TheSg n = {
      s = \\_ => "the" ++ n.s ! Sg ;
      a = Sg3 Inanimate
      } ;
    ThePl n = {
      s = \\_ => "the" ++ n.s ! Pl ;
      a = Pl3
      } ;
    Mass n = {
      s = \\_ => n.s ! Sg ;
      a = Sg3 Inanimate
      } ;

    -- Pronouns
    i_NP      = mkPron "I"    "me"  Sg1 ;
    youSg_NP  = mkPron "you"  "you" Sg2 ;
    he_NP     = mkPron "he"   "him" (Sg3 Masc) ;
    she_NP    = mkPron "she"  "her" (Sg3 Fem) ;
    theySg_NP = mkPron "they" "them" (Sg3 Neutr) ;
    we_NP     = mkPron "we"   "us"   Pl1 ;
    youPl_NP  = mkPron "you"  "you"  Pl2 ;
    theyPl_NP = mkPron "they" "them" Pl3 ;

    -- Lexicon

    see_V2 = mkV2 "saw" ;
    eat_V2 = mkV2 "ate" ;
    cat_N  = mkN "cat" ;
    food_N = mkN "food" ;

  param
    Agr = Sg1 | Sg2 | Sg3 Gender | Pl1 | Pl2 | Pl3 ;
    Gender = Fem | Masc | Neutr | Inanimate ;
    Case = Nom | Acc ;
    Number = Sg | Pl ;
  oper
    Noun : Type = {
      s : Number => Str
      } ;
    NounPhrase : Type = {
      s : Case => Str ;
      a : Agr
      } ;
    VerbPhrase : Type = {
      s : Str ;   -- simplification: only past tense (saw, ate)
      compl : Agr => Str ; -- myself/yourself/…
    } ;

    mkV2 : Str -> {s : Str} = \s -> {s=s} ;

    mkN : Str -> Noun = \food -> {
      s = table {
            Sg => food ;
            Pl => food + "s"}
      } ;

    mkPron : (nom, acc : Str) -> Agr -> NounPhrase = \nom,acc,agr -> {
      s = table {
           Nom => nom ;
           Acc => acc } ;
      a = agr
      } ;

    reflPron : Agr => Str = table {
      Sg1 => "myself" ;
      Pl1 => "ourselves" ;
      Sg2 => "yourself" ;
      Pl2 => "yourselves" ;
      Sg3 Fem => "herself" ;
      Sg3 Masc => "himself" ;
      Sg3 Neutr => "themself" ;
      Sg3 Inanimate => "itself" ;
      Pl3 => "themselves"
      } ;
}