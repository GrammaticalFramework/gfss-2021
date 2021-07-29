concrete ConsPidginForTestingS of ConsPidginForTesting = open Prelude in {

  lin
    Pres = ss "" ;
    Perf = ss "already" ;

    c2p c = c ;
    q2p t q = {s = q.s ++ t.s ++ "or not"} ;
    d2p t d = cc2 d t ;

    -- Make question out of declarative
    -- Cheat: we don't add "or no" yet, but in q2p instead
    d2q d = d ;-- you coming -> you coming or no?

    -- Make command out of declarative
    d2c d = {s = "please" ++ d.s} ;

    Pred actor action = cc2 actor action ;

    -- Actions
    We = ss "we" ;
    YouSg, YouPol = ss "you" ;
    Teacher = ss "teacher" ;
    Customer = ss "customer" ;
    Doctor = ss "doctor" ;
    Officer = ss "officer" ;
    Worker = ss "worker" ;

    -- Actions
    Come = ss "coming" ;
    Sleep = ss "sleeping" ;
    Walk = ss "walking" ;
    Play = ss "playing" ;

    -- Two ways of handling transitive verbs
    Buy o = {s = "buy" ++ o.s} ;
    Construct o = {s = "construct" ++ o.s} ;
    PayFor o = {s = "pay for" ++ o.s} ;

    Food = ss "food" ;
    Flowers = ss "flowers" ;
    Building = ss "building" ;
    Toilet = ss "toilet" ;
}
