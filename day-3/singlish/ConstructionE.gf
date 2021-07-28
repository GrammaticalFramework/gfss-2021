concrete ConstructionE of Construction =
  open SyntaxEng, ParadigmsEng  in {

  lincat
    Phrase = Phr ;
    Question = QS ;
    Command = Imp ;
    Decl = S ;

    Actor = NP ;  -- you, I
    Action = VP ; -- come, buy_food
    Object = NP ; -- food

--     lin
--       --  : Decl -> Phrase ;
--       d2p d = d ;
--       -- Question -> Phrase ;
--       q2p q = q ;

--     -- Make question out of declarative
--     -- : Decl -> Question ; -- you coming (already) -> you coming (already) or no?
--     d2q d = {s = "do" ++ d.s ++ "?"} ;

--     -- : Actor -> Action -> Decl ; -- you coming
--     presentPred actor action = {s = actor.s ++ action.s} ;

--     perfectivePred actor action = {s = actor.s ++ "have" ++ action.s} ;

--     -- Actors
--     I = ss "I" ;
--     You = ss "you" ;

--     -- Actions
--     Come = ss "come" ;

--     -- : Object -> Action ;
--     Buy obj = {s = "buy" ++ obj.s} ;

--     Food = ss "food" ;

-- oper
--  ss : Str -> {s : Str} ;
--  ss s = {s=s} ;

}

