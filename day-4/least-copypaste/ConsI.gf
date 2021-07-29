incomplete concrete ConsI of Cons =
  open Syntax, Lexicon, WordNet in {

  lincat
    Phrase = Phr ;
    Question = QS ;
    Command = Utt ;
    Decl = LinDecl ;

    Actor = LinActor ;  -- you, I
    Action = VP ; -- come, buy_food
    Object = NP ; -- food

  oper
    LinActor : Type ;
    LinActor = {
        subj : NP ;
        impForm : ImpForm
        } ;

    LinDecl : Type ;
    LinDecl = LinActor ** {pred : VP} ;

    -- Helper function to make Cl out of Decl
    decl2cl : LinDecl -> Cl ;
    decl2cl d = mkCl d.subj d.pred ;

  lin
    -- Coercions to start category
    q2p q = mkPhr q ;
    c2p c = mkPhr c ;
    d2p d = mkPhr (decl2cl d) ;

-- Syntactic functions
    -- : Decl -> Command ;
    d2c d = mkUtt d.impForm (mkImp d.pred) ;

    -- : Decl -> Question ;
    d2q d = mkQS (decl2cl d) ;

    -- : Actor -> Action -> Decl ;
    Pred actor action = actor ** {
        pred = action
        } ;

-- Lexical functions, or those that come from the shared RGL
    I      = {subj = i_NP ; impForm = singularImpForm} ;
    YouSg  = {subj = you_NP ; impForm = singularImpForm} ;
    YouPl  = {subj = youPl_NP ; impForm = pluralImpForm} ;
    YouPol = {subj = youPol_NP ; impForm = politeImpForm} ;

-- Lexical functions, coming from WordNet

  Teacher = mkActor (teacherFem_N|teacherMasc_N) ;
  Customer = mkActor client_2_N ;
  Doctor = mkActor doctor_1_N ;
  Officer = mkActor officer_2_N ;
  Worker = mkActor worker_1_N ;

oper
  mkActor : N -> LinActor ;
  mkActor n = {subj = mkNP the_Det n ; impForm = singularImpForm} ;

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


}