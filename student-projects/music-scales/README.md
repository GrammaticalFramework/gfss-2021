# Music Scales Grammar

## Running the program

```
gf ScaleHarmony.gf
```
run gf with the file

```
> gt -depth=7 | l | ? egrep ".+"
```
in the shell you can list all of the scales

```
> gt -depth=7 | l | ? egrep -c ".+"
```
or count the number of valid scales

## abstract 
Scales is the abstract grammar defining music scales which are a sequence of step intervals.

There are three step intervals
interval | value
-|-
Half Step | 1
Whole Step | 2
Whole and a Half Step | 3

To avoid using fractional values we assign them values as above.

## concrete 

Thus an octave has the value of 12.

In the typical western music theory for harmony, scales span an octave and have three constraints
- a half step cannot be followed by another half step
- a whole step cannot be followd by a whole and a half step and vice versa
- a whole and a half step cannot be followed by another whole and a half step

## implementation in GF

The scales are generated similar to `food.ipynb` using a `Mod` function that recurses on GF ASTs. `Mod` differs here by checking that the next step is legal and to assign `s` when a full scale that is cylically legal has been reached.

e.g. [ H , WH , H , W , W , W , H ] is a cylically illegal scale as the first and last steps if neighboured are illegal.

## Somewhat Peano Arithmetic

To keep track of the length of a sequence, a type `Number` is defined for each number from zero to twelve and an out of bounds value as well.

Each number is assigned a successor via the function `succ` in `oper`.

Addition then is defined as repeated `succ` calls.

## Improvements

### Better Peano

we can implement inverse of `succ` and define addition as a recursive function of decreasing one term while `succ` the other term repeatedly until the first term hits zero.

**Not sure if GF supports recursive functions**

## Other Harmonies

Why stick to just western music theory.

Why not jazz scales that span over 24 step intervals / 2 octaves.

Or how about your own rules for harmony; define your own legal function.

Or how about a more complex method to define harmony, e.g. instead of just looking at the last step interval why not the last two

## Music Key Concrete syntax

Given a scale and a key `C,D,E,F,G,A,B` and the sharp and flats generate the scale in a specific key.

E.g.
`[W,W,H,W,W,W,H]` is a major scale in the key of `C` would be `C -> [D,E,F,G,A,B,C]`

And also keys can be concretized in other ways, what about microtonal keys.

## Chord Progressions

Generate chord progressions, then given a scale and key, you can generate a sequence of chords.

Then u can just `gr` to generate random chords to jam along and write your new hit single