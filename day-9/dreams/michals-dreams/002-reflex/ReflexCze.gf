concrete ReflexCze of Reflex = {
  param Case = Nom | Poss;

  lincat Person = {s : Case => Str};
  lin He = {s = table{Nom => "on"; Poss => "jeho"}};

  lincat Kind = {s: Str};
  lin Phone = {s = "telefon"};

  lincat Item = {s: Str};
  lin Belong person kind = {
    s = person.s!Poss ++ kind.s;
  };

  lincat S = {s : Str};
  lin Lost person item = {
    s = person.s!Nom ++ "ztratil" ++ item.s;
  };
}
