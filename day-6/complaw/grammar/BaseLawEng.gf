concrete BaseLawEng of BaseLaw = open Prelude, SyntaxEng, LexiconEng, ExtendEng, SentenceEng in {
  lincat
    Phrase = Text ;

    Event = LinEvent ;
    Deadline = Adv ;

    Proposition = LinProp ;
    Action = LinAction ;
    [Action] = [VPI] ; -- hack: we treat VPI as VPI2 to put the adv in
    Deontic = VP ; -- should notify PDPC

                              -- Atoms
    Item = NP ;    -- PDPC
    Kind = CN ;  -- Organisation
            -- DataBreach, DataLeak, Harm,

    Quality = Adv ; -- Significant, [as soon as practicable]

    Pred2 = V2 ; -- notify
    Modal = VV ; -- May, Shoud, Must, NoModal


  lin
    -- Build different speech acts
    -- : Proposition -> Phrase ;
--    QProp ev prop dl = mkText (mkUtt (mkQS (pr2cl ev dl prop))) questMarkPunct ;  -- makes Proposition into question phrase
    SProp ev prop dl = mkText (mkUtt (pr2s ev dl prop)) fullStopPunct ;         -- makes Proposition into statement phrase

    -- Make a Proposition
    -- : Item -> Deontic -> Proposition ;
    Pred item deontic = {subj = item ; pred = deontic} ;

    -- Make a Deontic
    --  : Modal -> Action -> Deontic ;
    ModalAction modal action = mkVP (ComplVPIVV modal action.s) action.adv ;

    -- Make Actions
    -- : Pred2 -> Item -> Action ; -- notify PDPC
    Compl pred2 item = mkAction (mkVP pred2 item) ;

    -- Modify an Action
    --  Action -> Quality -> Action ;
    ModAction action quality = action ** {
      adv = conjAdvNoAnd action.adv quality ;
    } ;

    -- Construct an Item

    ConjItem i1 i2 = mkNP and_Conj i1 i2 ;

    APlKind kind = mkNP aPl_Det kind ;
    AKind kind = mkNP a_Det kind ;
    TheSgKind kind = mkNP the_Det kind ;

    -- Lists of Actions
    BaseAction a1 a2 = BaseVPI (advVPI a1) (advVPI a2) ;
    ConsAction a as = ConsVPI (advVPI a) as ;
    ConjAction as = {s = ConjVPI and_Conj as ; adv = emptyAdv} ;

  oper
    LinEvent = {
      s : Adv ;
      isAdV : Bool
    } ;

    LinProp : Type = {
      subj : NP ;
      pred : VP
      } ;

    pr2s : LinEvent -> Adv -> LinProp -> S = \ev,dl,prop ->
      case ev.isAdV of {
        True => mkS (mkCl prop.subj (mkVP (mkVP <ev.s : AdV> prop.pred) dl)) ;
        False => ExtAdvS ev.s (mkS (mkCl prop.subj (mkVP prop.pred dl)))
      } ;

    LinAction : Type = {
      s : VPI ;    -- notify PDPC
      adv : Adv    -- as soon as actionable
      } ;

    mkAction : VP -> LinAction = \vp -> {
      s = MkVPI vp ;
      adv = emptyAdv
    } ;

    advVPI : LinAction -> VPI = \vpi ->
      let vpi2 : VPI2 = vpi.s ** {c2 = vpi.adv.s} ; -- hack: make VPI into VPI2, using Adv as the c2 field
       in ComplVPI2 vpi2 emptyNP ;

    -- Hacks, potentially unstable for RGL changes.
    -- The positive side is that if the RGL changes, we only need to change these three lines.
    -- See https://inariksit.github.io/gf/2019/02/17/beyond-API.html
    emptyNP : NP = it_NP ** {s = \\_ => []} ;
    emptyAdv : Adv = now_Adv ** {s = []} ;
    conjAdvNoAnd : Adv -> Adv -> Adv = \x,y -> x ** cc2 x y ;
}