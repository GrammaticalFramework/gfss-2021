abstract Scale = {
    flags startcat = Sequence ;
    cat
        Sequence ; Step ;
    fun
        Mod : Step -> Sequence -> Sequence ;
        Half, Whole, WholeAndHalf : Step ;
        Empty : Sequence ;
}
