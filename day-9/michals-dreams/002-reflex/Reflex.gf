abstract Reflex = {
  flags startcat = S;

  cat Person;
  fun He : Person;

  cat Kind;
  fun Phone : Kind;

  cat Item;
  fun Belong : Person -> Kind -> Item; --his phone

  cat S;
  fun Lost : Person -> Item -> S; --he has lost his phone
}
