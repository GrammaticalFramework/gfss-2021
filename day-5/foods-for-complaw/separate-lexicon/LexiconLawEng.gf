concrete LexiconLawEng of LexiconLaw = BaseLawEng [Pred1, Pred2, Kind, Item, Quality, Modal] **
open ParadigmsEng, SyntaxEng, DictEng, IrregEng, ExtraEng in {
    lin
        -- Deontic
        Should = DictEng.should_VV ;
        Must = must_VV ;
        May = ExtraEng.may_VV ;

        -- Predicates
        Notify = mkV2 "notify" ;
        MakeAssessment = mkVP (mkV2 IrregEng.make_V) (mkNP a_Det (mkN "assessment")) ;

        -- Item
        PDPC = mkNP (mkPN "PDPC") ;

        -- Kind
        Organisation = mkCN (mkN "organisation") ;
--        DataBreach, DataLeak, Harm : Kind ;

        -- Quality
        AsSoonAsPrac = ParadigmsEng.mkAdv "as soon as practicable" ;
}