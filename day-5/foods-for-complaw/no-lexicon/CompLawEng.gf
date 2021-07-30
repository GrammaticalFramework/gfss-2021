concrete CompLawEng of CompLaw =
  open SyntaxEng, ParadigmsEng in {
    lincat
        Comment = Utt ;

        Item  = NP ;    -- PDPC
        Quality = Adv ; -- [as soon as practicable]
        Kind = CN ; -- Organisation
                    -- DataBreach, DataLeak, Harm,
        Action = VP ; -- notify PDPC
        Deontic = VP ; -- should notify PDPC

    lin
    -- Comment  (merging proposition and speec act)
    -- : Item -> Deontic -> Comment ;
    Pred item deontic = mkUtt (mkCl item deontic) ;

    -- Deontic
    --Should =
    Must action = mkVP must_VV action ;
    -- May : Action -> Deontic ;

    -- Action
    --  : Item -> Action ;      -- notify PDPC
    Notify item = mkVP (mkV2 "notify") item ;

    --  Action -> Quality -> Action ;
    ModAction action quality = mkVP action quality ;

    -- Item
    PDPC = mkNP (mkPN "PDPC");
    PlKind kind = mkNP aPl_Det kind ;
    AKind kind = mkNP a_Det kind ;
    TheKind kind = mkNP the_Det kind ;

    -- Kind
    Organisation = mkCN (mkN "organisation") ;
--    DataBreach, DataLeak, Harm : Kind ;

    -- Quality
    AsSoonAsPrac = ParadigmsEng.mkAdv "as soon as practicable" ;


-- Organisations should notify PDPC
-- [as soon as practicable]

}