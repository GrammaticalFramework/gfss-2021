concrete SinglishGloss of Singlish = {
  lin
    -- addDP s dp = {s = s.s ++ dp.s } ;


    addDPSChat ,
    addDPSQuest ,
    addDPSExclaimChat ,
    addDPSExclaimQuest  = addDP ;

    makeSChat   sChat     = sChat ;
    makeSQuest  sQuest    = sQuest ;
    makeSExclaim sExclaim = sExclaim ;

    -- Lah = ss "(passive-aggressive)" ;

    -- for Chat ends
    Lah    = ss "(to make a firm statement)"   ;
    Leh    = ss "(to make a mild statement)"   ;
    Liao   = ss "(to emphasize it is over in a statement)"  ;
    Lor    = ss "(to make a zen statement)"   ;
    Mah    = ss "(to toe a contradiction in a statement)"   ;

    -- for Question ends
    Ah      = ss "(a masked passive-agressive question)"   ;
    Anot    = ss "(a question for yes-no answer)" ;
    Hor     = ss "(a question seeking consensus)"  ;
    Meh     = ss "(a question that carries pre-conceived, sometimes condescending notion)"  ;


    -- for Exclaim end
    Sia    = ss "(to express disbelief)" ;

    KenaSaboC = ss "kena sabo" ;
    KenaSaboQ = ss "kena sabo" ;

  oper
    ss : Str -> {s : Str} = \s -> {s = s} ;
    SS : Type = {s : Str};
    addDP : SS -> SS -> SS  =  \s , dp ->   {s = s.s ++ dp.s } ;
}