abstract LexiconLaw = BaseLaw [Pred1, Pred2, Kind, Item, Quality, Modal] ** {
    fun
        -- Deontic
        Should,
        Must,
        May : Modal ;

        -- Event
        Always : Event ;

        -- Deadline
        Now : Deadline ;

        -- Predicates
        Notify : Pred2 ;      -- notify PDPC
        MakeAssessment : Pred1 ; -- MWE

        -- Item
        PDPC : Item ;

        -- Kind
        Organisation,
        DataBreach, DataLeak, Harm : Kind ;

        -- Quality
        AsSoonAsPrac : Quality ;
}