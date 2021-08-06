resource Prepvoc = {
  param PrepVoc = Unvoc | Voc;

  oper Noun : Type = {s : Str; prepVoc : PrepVoc};
  oper bank : Noun = {s = "bance"; prepVoc = Unvoc};
  oper school : Noun = {s = "škole"; prepVoc = Voc};

  oper Adj : Type = {s : Str; prepVoc : PrepVoc};
  oper small : Adj = {s = "malé"; prepVoc = Unvoc};
  oper big : Adj = {s = "velké"; prepVoc = Voc};

  oper Prep : Type = {s : PrepVoc => Str};
  oper at : Prep = {s = table {Unvoc => "v"; Voc => "ve"}};

  oper prep_noun : Prep -> Noun -> Str = \p,n ->
    p.s!n.prepVoc --vocalize preposition if noun requires it
    ++ n.s;       --add noun
  oper prep_adj_noun : Prep -> Adj -> Noun -> Str = \p,a,n ->
    p.s!a.prepVoc --vocalize preposition if adjective requires it
    ++ a.s        --add adjective
    ++ n.s;       --add noun
};
