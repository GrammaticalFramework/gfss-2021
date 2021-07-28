# Micro resource grammar

We live programmed this grammar during the lectures on Tuesday and Wednesday.

Some takeaways:

* This and much more is available in the Resource Grammar Library (presented on Thursday), as a library to be reused in applications.
* If you want to work on applications for English, German, Japanese, Hungarian, Swahili or any of the existing ~40 RGL languages, you don't need to redo this.
* If you want to work on any of the other 6000 languages in the world (or 300 languages in Wikipedia!), you do need to think about all this! Join the GFSS on Tuesday 3rd August to hear much more about the linguistic diversity in GF.
* For those who are here for the applications, I hope you got familiar with GF syntax and conventions, and maybe some linguistic terminology too. :-P

## Homework

We didn't quite finish the MicroLangEng.gf. Consider the following:

```
MicroLang> l PredVPS (DetCN thePl_Det (UseN city_N)) (UseV walk_V)
the citys walk
MicroLang> l PredVPS (DetCN thePl_Det (UseN baby_N)) (UseV walk_V)
the babys walk
```

Why is that? Because of the following in ResEng:

https://github.com/GrammaticalFramework/gfss-2021/blob/1c9dcb20d3f990ee13507d985ccc9e11aff5708c/day-2/micro/ResEng.gf#L83-L89

The constructor oper `mkN` doesn't discriminate between different nouns, it just adds the string `s` in the end, no matter what.

Some nouns are truly irregular, like *man-men* and *child-children*. But a case like * city-cities* is regular, it just needs to be handled in the `mkN` properly.

To fix the the grammar, see [the GF tutorial](http://www.grammaticalframework.org/doc/tutorial/gf-tutorial.html#toc58) how to add pattern matching to the `mkN` paradigm!

(You can pattern match strings in `mkN`, because it is a constructor for *lexicon*. You may not pattern match in a fun that takes an argument. For more information on restricted string operations, see [my blog](https://inariksit.github.io/gf/2018/08/28/gf-gotchas.html#unsupported-token-gluing).)

<!--

```
MicroLang> l PredVPS (DetCN thePl_Det (UseN man_N)) (UseV walk_V)
the mans walk
MicroLang> l PredVPS (DetCN thePl_Det (UseN child_N)) (UseV walk_V)
the childs walk
```

-->