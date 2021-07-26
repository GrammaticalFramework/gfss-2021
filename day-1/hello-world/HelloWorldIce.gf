concrete HelloWorldIce of HelloWorld = {
    lincat
        Greeting = Str ; -- start category, final, not open

        Recipient = LinRecipient ;

    param
        Number = Sg | Pl ;
        Gender = F | M ;
        -- Two alternative syntaxes for a param that consists of multiple params
        -- 1) using a record
        Agr = Ag {n : Number ; g : Gender} ;

        -- 2) no record
        --Agr = Ag Number Gender ;

    lin
        World   = mkRecipient "heimur" Sg M ;
        Friends = mkRecipient "vinir" Pl M ;
        Mother = mkRecipient "mamma" Sg F ;
        Sisters = mkRecipient "systur" Pl F ;

        -- This linearisation uses the version of Agr with record
        Hello rec = case rec.a of {
            Ag {n=Sg ; g=M} => "sæll" ++ rec.s ;
            Ag {n=Pl ; g=M} => "sælir" ++ rec.s ;
            Ag {n=Sg ; g=F} => "sæl" ++ rec.s ;
            Ag {n=Pl ; g=F} => "sælar" ++ rec.s
        } ;

    oper
        LinRecipient : Type = {s : Str ; a : Agr} ;

        mkRecipient : Str ->         -- argument 1
                      Number ->      -- argument 2
                      Gender ->      -- argument 3
                      LinRecipient ; -- return type
        mkRecipient str num gen = {s=str ; a = Ag {n=num ; g =gen}} ;


}
