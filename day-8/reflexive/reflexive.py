from nltk import grammar, parse, CFG
from nltk.parse import ShiftReduceParser



#### Helper functions

def printUngrammatical(parser, sentences):
    print("\nUngrammatical sentences: should NOT parse")
    for sent in sentences:
        print('* ' + sent)
        try:
            trees = parser.parse(sent.split())
        except Exception:
            print("No parse because ungrammatical :)")
        else:
            for tree in trees:
                print(tree)

def printGrammatical(parser, sentences):
    print("\nGrammatical sentences: should parse")
    for sent in sentences:
        print("")
        print(sent)
        try:
            trees = parser.parse(sent.split())
        except Exception:
            print("No parse though grammatical :(")
        else:
            for tree in trees:
                print(tree)



#### Test sets

sentencesGood = [
    'the cat ate food',
    'I saw the cat',
    'the cat saw me',
    'you saw yourself',
    'the cat saw itself']

sentencesBad = [
    'I saw itself',
    'the cat saw myself',
    'yourself saw the cat',
    'myself saw I']

#### Grammars

## Grammar 1: simple, overgenerating CFG
grammar1 = CFG.fromstring("""
S -> NP VP
NP -> Det N
VP -> V2 NP
Det -> 'the'
N -> 'dog' | 'cat'
V2 -> 'ate' | 'saw'
NP -> 'I' | 'me' | 'myself' | 'you' | 'yourself' | 'itself' | 'food'
""")

print(grammar1)
parser1 = parse.ShiftReduceParser(grammar1)
printGrammatical(parser1, sentencesGood)
printUngrammatical(parser1, sentencesBad)


## Grammar 2: CFG with feature structures

grammar2 = grammar.FeatureGrammar.fromstring("""
% start S
# S expansion productions
S -> NP[PER=?p] VP[PER=?p]

# NP expansion productions
NP[PER=sg1] -> 'I' | 'me' | 'myself'
NP[PER=sg2] -> 'yourself' | 'you'
NP[PER=sg3] -> 'itself' | Det N | 'food'

# VP expansion productions
VP[PER=?n] -> V2 NP[PER=?n]

# Lexicon
Det -> 'the'
N -> 'dog' | 'cat'
V2 -> 'saw' | 'ate'
""")
parser2 = parse.FeatureEarleyChartParser(grammar2)


print("\n\n\n# Grammar 2")
print(grammar2)

printGrammatical(parser2, sentencesGood)
printUngrammatical(parser2, sentencesBad)


