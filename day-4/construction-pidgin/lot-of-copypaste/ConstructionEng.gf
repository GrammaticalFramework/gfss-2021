concrete ConstructionEng of Construction =
  open SyntaxEng, LexiconEng, ParadigmsEng  in {

  lincat
    Phrase = Phr ;
    Question = QS ;
    Command = Imp ;
    Decl = LinDecl ;

    Actor = NP ;  -- you, I
    Action = VP ; -- come, buy_food
    Object = NP ; -- food

  oper
    LinDecl : Type ;
    LinDecl = {subj : NP ; pred : VP} ;

    -- Helper function to make Cl out of Decl
    decl2cl : LinDecl -> Cl ;
    decl2cl d = mkCl d.subj d.pred ;

  lin
    -- Coercions to start category
    q2p q = mkPhr q ;
    c2p c = mkPhr (mkUtt singularImpForm c) ;
    d2p d = mkPhr (decl2cl d) ;

-- Syntactic functions
  -- : Decl -> Command ;
  d2c d = mkImp d.pred ;

  -- : Decl -> Question ;
  d2q d = mkQS (decl2cl d) ;

  -- : Actor -> Action -> Decl ;
  Pred actor action = {
   subj = actor ;
   pred = action
   } ;


-- Lexical functions
  -- Action
  Come = mkVP come_V ;
  Buy obj = SyntaxEng.mkVP
             (ParadigmsEng.mkV2 "purchase")
             obj ;

  -- Actor
  I = SyntaxEng.i_NP ;
  YouSg, YouPl, YouPol = you_NP ;

  -- Object
  Food = mkNP (mkN "food") ;
}

