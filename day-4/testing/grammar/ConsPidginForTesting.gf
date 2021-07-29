abstract ConsPidginForTesting = {
  flags startcat = Phrase ;

  cat
    Phrase ;
    Question ; Command ;
    Decl ;

    Actor ;  -- you, I
    Action ; -- come, buy_food
    Object ; -- food

    Tense ;

  fun
    Pres, Perf : Tense ;

    -- Add tense
    c2p : Command -> Phrase ;
    q2p : Tense -> Question -> Phrase ;
    d2p : Tense -> Decl -> Phrase ;

    -- Make question out of declarative
    d2q : Decl -> Question ; -- you coming -> you coming or no?

    -- Make command out of declarative
    d2c : Decl -> Command ; -- you coming -> come / kommen Sie

    Pred : Actor -> Action -> Decl ; -- you coming

    -- Actions
    We, YouSg, YouPol : Actor ;
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
