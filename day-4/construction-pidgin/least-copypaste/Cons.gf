abstract Cons = {
  flags startcat = Phrase ;

  cat
    Phrase ;
    Question ; Command ;
    Decl ;

    Actor ;  -- you, I
    Action ; -- come, buy food
    Object ; -- food

  fun
    -- Coercions to start category
    q2p : Question -> Phrase ;
    c2p : Command -> Phrase ;
    d2p : Decl -> Phrase ;

    -- Make command out of declarative
    d2c : Decl -> Command ;

    -- Make question out of declarative
    d2q : Decl -> Question ; -- you coming (already) -> you coming (already) or no?

    Pred : Actor -> Action -> Decl ; -- you coming

    -- Actors
    I, YouSg, YouPl, YouPol : Actor ;
    Teacher, Customer, Doctor, Officer, Worker : Actor ;

    -- Actions
    Come, Sleep, Walk, Play : Action ;

    -- Two ways of handling transitive verbs
    Buy, Construct, PayFor : Object -> Action ;

    Food, Flowers, Building, Toilet : Object ;

}

-- Corpus:
{-
first go buy food after go home
- "please buy food before going home"

i coming already
- "i have arrived"

you coming already or no
- "have you arrived?"

this one down already
- "it is too low"

he love to her
- "he loves her"

you (before/this day) talking buy rice
- "you said that you would buy rice"

you now talking what things
- "what are you saying"
-}
