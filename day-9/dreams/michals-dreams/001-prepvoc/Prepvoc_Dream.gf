resource Prepvoc = {
  param PrepVoc = Unvoc | Voc;

  oper Noun : Type = {s : Str; s.prepVoc : PrepVoc};
  oper bank : Noun = {s = "bance"; s.prepVoc = Unvoc};
  oper school : Noun = {s = "škole"; s.prepVoc = Voc};

  oper Adj : Type = {s : Str; s.prepVoc : PrepVoc};
  oper small : Adj = {s = "malé"; s.prepVoc = Unvoc};
  oper big : Adj = {s = "velké"; s.prepVoc = Voc};

  oper Prep : Type = {s : Str};
  oper at : Prep = {s = case $NEXT.prepVoc {Unvoc => "v"; Voc => "ve"}};

  oper prep_noun : Prep -> Noun -> Str = \p,n ->
    p.s ++ n.s;
  oper prep_adj_noun : Prep -> Adj -> Noun -> Str = \p,a,n ->
    p.s ++ a.s ++ n.s;
};
