abstract LexiconLaw = BaseLaw ** {
    fun
        -- Deontic
        Should,
        Must,
        May : Modal ;

        -- Event
        Always : Event ;
        Upon : Kind -> Event ;

        -- Deadline
        Now : Deadline ;

        -- Predicates
        Notify : Pred2 ;      -- notify PDPC
        MakeAssessment : Action ; -- MWE

        -- Item
        PDPC : Item ;

        -- Kind
        Organisation : Kind ;

        -- ones used for events
        Sunrise, DataBreach, DataLeak : Kind ;

        AsSoonAsPrac : Deadline ;
}