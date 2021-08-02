concrete LexiconLawEng of LexiconLaw = BaseLawEng **
open Prelude, ParadigmsEng, SyntaxEng, DictEng, IrregEng, ExtraEng in {
    lin
        -- Deontic
        Should = DictEng.should_VV ;
        Must = must_VV ;
        May = ExtraEng.may_VV ;

        -- Event
        Always = {
           s = always_AdV ;
           isAdV = True
           } ;

        Upon cn = {
           s = mkAdv (mkPrep "upon") (mkNP cn) ;
           isAdV = False ;
           } ;

        -- Deadline
        Now = now_Adv ;

        -- Pred2
        Notify = mkV2 "notify" ;

        -- Action
        MakeAssessment = mkAction (mkVP (mkV2 IrregEng.make_V) (mkNP a_Det (mkN "assessment"))) ;

        -- Item
        PDPC = mkNP (mkPN "PDPC") ;

        -- Kind
        Organisation = mkCN (mkN "organisation") ;
        DataBreach = mkCN (mkN "data breach") ;
        Sunrise = mkCN (mkN "sunrise") ;

        -- Quality
        AsSoonAsPrac = ParadigmsEng.mkAdv "as soon as practicable" ;
}