abstract CompLaw = {
    flags startcat=Comment ;
    cat
        Comment ;

        Item ;    -- PDPC
        Quality ; -- Significant, [as soon as practicable]
        Kind ; -- Organisation
               -- DataBreach, DataLeak, Harm,
        Action ; -- notify PDPC
        Deontic ; -- should notify PDPC

    fun
    -- Comment  (merging proposition and speec act)
    Pred : Item -> Deontic -> Comment ;

    -- Deontic
    Should,
    Must,
    May : Action -> Deontic ;

    -- Action
    Notify : Item -> Action ;      -- notify PDPC
    ModAction :
     Action -> Quality -> Action ; -- notify PDPC as soon as possible

    -- Item
    PDPC : Item ;
    PlKind,
     AKind,
     TheKind : Kind -> Item ;

    -- Kind
    Organisation,
    DataBreach, DataLeak, Harm : Kind ;

    -- Quality
    AsSoonAsPrac : Quality ;


-- Organisations should notify PDPC
-- [as soon as practicable]

}