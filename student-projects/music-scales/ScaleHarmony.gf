concrete ScaleHarmony of Scale = { 
  lincat
    Step = { s : Str ; h : StepP} ;

    Sequence = {s, partial : Str ; latest, first : StepP ; length : Number} ;

  param
    Number = Zero | One | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Eleven | Twelve | OutOfBounds ;
    StepP = HalfP | WholeP | WholeAndHalfP | None ;
    Bool = True | False ;

  lin

    Empty = {s,partial = "" ; latest, first = None ; length = Zero} ;

    Mod step seq = 
    let afterLength = add (numOfStep step.h) seq.length in
    let newSeq = case legal ! step.h ! seq.latest of {
        True => case seq.length of {
            Zero => "[" ++ step.s ;
            _ => case afterLength of {
                Twelve => case legal ! seq.first ! step.h of { 
                    True => seq.partial ++ "," ++ step.s ++ "]" ;
                    False => Predef.nonExist
                } ;
                _ => seq.partial ++ "," ++ step.s 
            }
        } ;
        False => Predef.nonExist 
    } in
    {
      s = case afterLength of {
          Twelve => newSeq ;
          _ => ""
      } ;
      partial = newSeq ;
      latest = step.h ;
      first = case seq.first of {
          None => step.h ;
          x => x
      } ;
      length = afterLength
      } ;

    Half = { s = "H" ; h = HalfP } ;
    Whole = {s = "W" ; h = WholeP} ;
    WholeAndHalf = { s = "WH" ; h = WholeAndHalfP} ;

  oper
    numOfStep : StepP -> Number =
        \s -> case s of {
            HalfP => One ;
            WholeP => Two ;
            WholeAndHalfP => Three ;
            None => Zero 
        };
    succ : Number -> Number =
        \n -> case n of {
            Zero => One ;
            One => Two ;
            Two => Three ;
            Three => Four ;
            Four => Five ;
            Five => Six ;
            Six => Seven ;
            Seven => Eight ;
            Eight => Nine ;
            Nine => Ten ;
            Ten => Eleven ;
            Eleven => Twelve ;
            Twelve => OutOfBounds ;
            OutOfBounds => OutOfBounds
        } ;
    add : Number -> Number -> Number =
        \x, y -> case x of {
            Zero => y ;
            One => succ y ;
            Two => succ (succ y);
            Three => succ (succ (succ y));
            Four => succ (succ (succ (succ y)));
            Five => succ (succ (succ (succ (succ y))));
            Six => succ (succ (succ (succ (succ (succ y)))));
            Seven => succ (succ (succ (succ (succ (succ (succ y))))));
            Eight => succ (succ (succ (succ (succ (succ (succ (succ y)))))));
            Nine => succ (succ (succ (succ (succ (succ (succ (succ (succ y))))))));
            Ten => succ (succ (succ (succ (succ (succ (succ (succ (succ (succ y)))))))));
            Eleven => succ (succ (succ (succ (succ (succ (succ (succ (succ (succ (succ y))))))))));
            Twelve => succ (succ (succ (succ (succ (succ (succ (succ (succ (succ (succ (succ y)))))))))));
            OutOfBounds => OutOfBounds 
        };
    legal : StepP => StepP => Bool =
      table {
        HalfP => table {
          HalfP => False ;
          _ => True } ;
        WholeP => table {
          WholeAndHalfP => False ;
          _ => True } ;
        WholeAndHalfP => table {
          WholeP => False ;
          WholeAndHalfP => False ;
          _ => True } ;
        None => \\_ => True
      } ;
}
