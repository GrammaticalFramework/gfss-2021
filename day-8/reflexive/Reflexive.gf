abstract Reflexive = {
  cat
    S ;
    NP ;
    VP ;
    V2 ;
    N ;

  fun
    PredVPS : NP -> VP -> S ; -- I eat food ; you see yourself

    ComplV2 : V2 -> NP -> VP ; -- eat food, see you
    ReflV2  : V2       -> VP ; -- see my/your/…self

    i_NP, youSg_NP, he_NP, she_NP, theySg_NP,
    we_NP, youPl_NP, theyPl_NP : NP ;

    TheSg : N -> NP ; -- the cat
    ThePl : N -> NP ; -- the cats
    Mass  : N -> NP ; -- food, beer

    -- Lexicon

    see_V2, eat_V2 : V2 ;
    cat_N, food_N : N ;
}