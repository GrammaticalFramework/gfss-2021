abstract Singlish = {

  cat
    SChat    ; DPChat ;
    SQuest   ; DPQuest ;
    SExclaim ; DPExclaim;
    S;

  fun
    addDPSChat          : SChat  -> DPChat      -> SChat  ;
    addDPSQuest         : SQuest -> DPQuest     -> SQuest ;
    addDPSExclaimChat   : SChat  -> DPExclaim   -> SExclaim ;
    addDPSExclaimQuest  : SQuest -> DPExclaim   -> SExclaim ;
    makeSChat           : SChat -> S ;
    makeSQuest          : SQuest -> S ;
    makeSExclaim        : SExclaim -> S ;

  --end
    Lah , Leh  , Liao , Lor , Mah : DPChat ;
    Ah  , Anot ,  Hor , Meh       : DPQuest ;
    Sia                           : DPExclaim;

    KenaSaboC            : SChat ;
    KenaSaboQ            : SQuest;
}