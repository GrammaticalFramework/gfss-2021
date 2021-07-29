incomplete concrete ConsPidginForTestingI of ConsPidginForTesting =
  open Syntax, Lexicon, WordNet, Idiom in {

  lincat
    Phrase = Phr ;
    Question = QCl ;
    Command = Utt ;
    Decl = LinDecl ;

    Actor = LinActor ;  -- you, I
    Action = VP ; -- come, buy_food
    Object = NP ; -- food

    Tense = Temp ;

  lin
    Pres = mkTemp presentTense simultaneousAnt ; -- walks
    Perf = mkTemp presentTense anteriorAnt ;     -- has walked / walking already

    -- Coercions to start category
    q2p t q = mkPhr (mkUtt (mkQS t positivePol q)) ;
    c2p c = mkPhr c ;
    d2p t d = mkPhr (mkUtt (mkS t positivePol (decl2cl d))) ;

-- Syntactic functions
    -- : Decl -> Command ;
    d2c d =
      let imp : Imp = mkImp d.pred ;
      in case d.impForm of {
          Sg2Imp  => mkUtt singularImpForm imp ;
          Pl2Imp  => mkUtt pluralImpForm imp ;
          Pol2Imp => mkUtt politeImpForm imp ;
          Sg3Imp  => Idiom.ImpP3 d.subj d.pred ; -- let him walk
          Pl1Imp  => Idiom.ImpPl1 d.pred   -- let's walk
        } ;

    -- : Decl -> Question ;
    d2q d = mkQCl (decl2cl d) ;

    -- : Actor -> Action -> Decl ;
    Pred actor action = actor ** {
        pred = action
        } ;

-- Lexical functions, or those that come from the shared RGL
    We      = {subj = we_NP ; impForm = Pl1Imp} ;
    YouSg  = {subj = you_NP ; impForm = Sg2Imp} ;
    YouPl  = {subj = youPl_NP ; impForm = Pl2Imp} ;
    YouPol = {subj = youPol_NP ; impForm = Pol2Imp} ;

-- Lexical functions, coming from WordNet

  Teacher = mkActor (teacherFem_N|teacherMasc_N) ;
  Customer = mkActor customerFem_N ;
  Doctor = mkActor doctor_1_N ;
  Officer = mkActor officer_2_N ;
  Worker = mkActor worker_1_N ;

oper
  mkActor : N -> LinActor ;
  mkActor n = {subj = mkNP the_Det n ; impForm = Sg3Imp} ;

lin
    -- Actions
  Come = mkVP come_V ;
  Sleep = mkVP sleep_1_V ;
  Walk = mkVP walk_1_V ;
  Play = mkVP play_V ;

  Buy obj = mkVP buy_1_V2  obj;
  PayFor obj = mkVP pay_for_V2 obj ;
  Construct obj = mkVP construct_1_V2 obj ;

  Food = mkNP food_1_N ;
  Flowers = mkNP aPl_Det flower_1_N ;
  Building = mkNP a_Det building_1_N ;
  Toilet = mkNP a_Det toilet_1_N ;


  oper
    LinActor : Type ;
    LinActor = {
        subj : NP ;
        impForm : MyImpForm -- Now includes also Pl1: "let us come"
        } ;

    LinDecl : Type ;
    LinDecl = LinActor ** {pred : VP} ;

    -- Helper function to make Cl out of Decl
    decl2cl : LinDecl -> Cl ;
    decl2cl d = mkCl d.subj d.pred ;

  param
    MyImpForm =  -- Custom parameter for commands:
        Sg2Imp     -- komm
      | Pl2Imp     -- kommt
      | Pol2Imp    -- kommen Sie
      | Sg3Imp     -- let him walk
      | Pl1Imp ;   -- let's walk

}