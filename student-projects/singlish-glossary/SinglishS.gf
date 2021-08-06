concrete SinglishS of Singlish = open Prelude in {
  lin

    addDPSChat  ,
    addDPSQuest,
    addDPSExclaimChat ,
    addDPSExclaimQuest  = addDP ;

    makeSChat   sChat     = sChat ;
    makeSQuest  sQuest    = sQuest ;
    makeSExclaim sExclaim = sExclaim ;

    -- for Chat ends
    Lah    = ss "lah"   ;
    Leh    = ss "leh"   ;
    Liao   = ss "liao"  ;
    Lor    = ss "lor"   ;
    Mah    = ss "mah"   ;

    -- for Question ends
    Ah      = ss "ah"   ;
    Anot    = ss "anot" ;
    Hor     = ss "hor"  ;
    Meh     = ss "meh"  ;


    -- for Exclaim end
    Sia    = ss "sia" ;

    KenaSaboC = ss "kena sabo" ;
    KenaSaboQ = ss "kena sabo" ;

  oper
    ss : Str -> {s : Str} = \s -> {s = s} ; -- or ss : Str -> SS = \s = {s = s}

    SS : Type = {s : Str};

    -- in Prelude there is cc2 available
    cc2 : SS -> SS -> SS ;
    cc2 ss1 ss2 = {s = ss1.s ++ ss2.s};
    addDP : SS -> SS -> SS  =  \s , dp ->   {s = s.s ++ dp.s } ;

}
