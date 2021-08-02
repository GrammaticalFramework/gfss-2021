concrete LexiconLawEng of LexiconLaw = BaseLawEng **
open ParadigmsEng, SyntaxEng, DictEng, IrregEng, ExtraEng, ExtendEng in {
    lin
        -- Deontic
        Should = DictEng.should_VV ;
        Must = must_VV ;
        May = ExtraEng.may_VV ;

        -- Event
        Always = always_AdV ;

        Upon cn = lin AdV (mkAdv (mkPrep "upon") (mkNP cn)) ;

        -- Deadline
        Now = now_Adv ;

        -- Pred2
        Notify = mkV2 "notify" ;

        -- Action
        MakeAssessment = {
          s = MkVPI (mkVP (mkV2 IrregEng.make_V) (mkNP a_Det (mkN "assessment"))) ;
          adv = emptyAdv
          } ;

        -- Item
        PDPC = mkNP (mkPN "PDPC") ;

        -- Kind
        Organisation = mkCN (mkN "organisation") ;
        DataBreach = mkCN (mkN "data breach") ;
        Sunrise = mkCN (mkN "sunrise") ;

        -- Quality
        AsSoonAsPrac = ParadigmsEng.mkAdv "as soon as practicable" ;
}