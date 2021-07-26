# Community-driven cheat sheet for GF operators and keywords

## Operators and keywords

### Records

### Tables

### …

## Shell commands

### parse
Short form `p`. Example:  
`p -lang=Eng "John loves Mary"`

### linearize
Short form `l`. Examples:  
`l love john mary`  
Linearizes the tree `love john mary` to all languages.

`p -lang=Eng "John loves Mary" | l`   
Parses the English sentence "John loves Mary", linearizes to all languages.

`p -lang=Eng "John loves Mary" | l -lang=Ger`  
Parses the English sentence "John loves Mary", linearizes to German.


`p -lang=Eng "John loves Mary" | l -treebank`   
Parses the English sentence "John loves Mary", linearizes to all languages in a *treebank* format:

```haskell
Example: love john mary
ExampleEng: "John loves Mary"
ExampleGer: "Johann liebt Maria"
```

### visualize_tree
Short form `vt`. Example:  
`p -lang=Eng "John loves Mary" | vt`

Visualises the abstract syntax tree for "John loves Mary". In the Jupyter notebook, you need to prefix this command with **view**:

**view** `p -lang=Eng "John loves Mary" | vt`

### visualize_parse
Short form `vp`. Example:  
`p -lang=Eng "John loves Mary" | vp`

Visualises the English parse tree for "John loves Mary". In the Jupyter notebook, you need to prefix this command with **view**:

**view** `p -lang=Eng "John loves Mary" | vt`


### generate_random
Short form `gr`. Generates a random tree. Examples:

`gr -number=5 | l`  
Generates 5 random trees (of start category), linearizes to all languages.

`gr -cat=NP`  
Geneerates a random tree of category NP.

### generate_trees
Short form `gt`. Generates all trees of the grammar (up to certain depth). 

Examples:

`gt -cat=NP | l`  
Generates all trees of type NP, linearizes them in all languages.

`gt | l -lang=Eng`  
Generates all trees (of start category), linearizes them in English.
