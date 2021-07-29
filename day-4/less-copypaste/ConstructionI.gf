--# -path=../lot-of-copypaste

incomplete concrete ConstructionI of Construction =
  open Syntax in {

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


}