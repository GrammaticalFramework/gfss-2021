concrete GFSS2021Ita of GFSS2021 =
  open SyntaxIta, ParadigmsIta in {

flags coding = utf8 ;

lincat
    Phrase = Phr ;
    Recipient = NP ;
    Fact = Cl ;
    Object = NP ;
    Kind = CN ;
    Property = AP ;

lin
    hi_Phrase = mkPhr (mkUtt (mkInterj "ciao")) ;
    world_Recipient = mkNP (mkN "mondo") ;
    helloRecipientPhrase recipient = mkPhr (mkUtt (mkInterj "ciao")) (mkVoc recipient) ;
    factPhrase fact = mkPhr (mkS fact) ;
    thisKind kind = mkNP this_Det kind ;
    restaurant_Kind  = mkCN (mkN "ristorante") ;
    good_Property  = mkAP (mkA "buono") ;
    objectPropertyFact object property = mkCl object property ;
    car_Kind  = mkCN (mkN "macchina") ;
    hotel_Kind  = mkCN (mkN "albergo") ;
    dirty_Property  = mkAP (mkA "sporco") ;
    swedish_Property  = mkAP (mkA "svedese") ;
    propertyKindKind property kind = mkCN property kind ;
    questionFactPhrase fact = mkPhr (mkQS (mkQCl fact)) ;
    thoseKindObject kind = mkNP those_Det kind ;


--- this oper should be in ParadigmsIta
oper
    mkInterj : Str -> Interj = \s -> lin Interj {s = s} ;


}
