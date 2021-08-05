concrete ReflexCze of Reflex = {
  param Case = Nom | Poss;

  lincat Person = {s : Case => Str};
  lin He = {s = table{Nom => "on"; Poss => "jeho"}};
  oper reflexivePronoun : Person = lin Person {s = table{Nom => []; Poss => "svůj"}};

  lincat Kind = {s: Str};
  lin Phone = {s = "telefon"};

  lincat Item = {s: Str};
  lin Belong person kind = {
    s = case $COREF(person, $ANCESTOR(S).subject) of {
      True => reflexivePronoun.s!Poss;
      False => person.s!Poss
    } ++ kind.s;
  };

  lincat S = {s : Str; subject : Person};
  lin Lost person item = {
    s = person.s!Nom ++ "ztratil" ++ item.s;
    subject = person;
  };
}
