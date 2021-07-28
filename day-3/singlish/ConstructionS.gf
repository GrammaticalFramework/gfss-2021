concrete ConstructionS of Construction = {

---  lincat
    -- Phrase ;
    -- Question ; Command ;
    -- Decl ;

    -- Actor ;  -- you, I
    -- Action ; -- come, buy_food
    -- Object ; -- food

    lin
      --  : Decl -> Phrase ;
      d2p d = d ;
      -- Question -> Phrase ;
      q2p q = q ;

    -- Make question out of declarative
    -- : Decl -> Question ; -- you coming (already) -> you coming (already) or no?
    d2q d = {s = d.s ++ "or no"} ;

    -- : Actor -> Action -> Decl ; -- you coming
    presentPred actor action = {s = actor.s ++ action.s} ;

    perfectivePred actor action = {s = actor.s ++ action.s ++ "already"} ;

    -- Actors
    I = ss "I" ;
    You = ss "you" ;

    -- Actions
    Come = ss "coming" ;

    -- : Object -> Action ;
    Buy obj = {s = "buying" ++ obj.s} ;

    Food = ss "food" ;

oper
 ss : Str -> {s : Str} ;
 ss s = {s=s} ;

}

