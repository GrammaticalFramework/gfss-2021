# `001-prepvoc`

Here I am dreaming up some imaginary GF syntax for expressing the fact that something should be linearized differently depending on the token that follows or precedes it. I'm demonstrating it on the phenomenon of Czech preposition vocalization.

- `Prepvoc.gf` = how preposition vocalization is usually handled in GF grammars by pretending that it is agreement.

- `Prepvoc_Dream.gf` = how I would like to be able to solve it, using imaginary GF syntax that doesn't exist.

# `002-reflex`

Here I am dreaming up some imaginary GF syntax for encoding coference (anaphora), i.e. the fact that two nodes in the abstract syntax tree refer to the same thing.

- `Reflex.gf` = a typical application grammar where it would be great to be able to encode anaphora: to say whether the two `He`s corefer or don't.

- `ReflexCze.gf` = a typical concrete grammar in Czech which doesn't know whether the two `He`s coferer. (When they corefer then the second `He` should be turned into a reflexive pronoun.)

- `ReflexCze_Dream.gf` = how I would like to be able to solve it, using imaginary GF syntax that doesn't exist.
