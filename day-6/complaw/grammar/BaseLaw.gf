abstract BaseLaw = {
    flags startcat=Phrase ;
    cat
        Phrase ;

        Event ;   -- Extensions from day 5
        Deadline ;

        Proposition ;
        Action ;      -- notify PDPC
        [Action]{2} ;
        Deontic ;     -- should notify PDPC

                                  -- Atoms
        Item ;    -- PDPC
        Kind ;  -- Organisation
                -- DataBreach, DataLeak, Harm,

        Quality ; -- Significant, [as soon as practicable]

        Pred2 ; -- notify
        Modal ; -- May, Shoud, Must, NoModal


    fun
    QProp,  -- makes Proposition into question phrase
     SProp  -- makes Proposition into statement phrase
     : Event -> Proposition -> Deadline -> Phrase ;




    -- Make a Proposition
    Pred : Item -> Deontic -> Proposition ;

    -- Make a Deontic
    ModalAction : Modal -> Action -> Deontic ;

    -- Make Actions
    Compl : Pred2 -> Item -> Action ; -- notify PDPC

    -- Modify an Action
    ModAction :
     Action -> Quality -> Action ; -- notify PDPC as soon as practicable

    ConjAction : [Action] -> Action ;

    -- Item
    ConjItem : Item -> Item -> Item ;

    APlKind,
      AKind,
      TheSgKind : Kind -> Item ;


-- Organisations should notify PDPC
-- [as soon as practicable]

}