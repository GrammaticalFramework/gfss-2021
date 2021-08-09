# Summary of GF Dreams Workshop

Below is a written summary of everything discussed during the workshop, where I have tried to combine comments from all participants into a single congruous text, based on my notes and memory.

Keep on dreamin'  
John

---

> The mission of GF is to formalize the grammars of the world and make them available for computer applications.

Covering every last world language may not be possible, but this is still a valid dream and ultimately the only way to get closer to it is to continue growing the GF community. GF can have an important role to play for under-resourced languages. Implementing a language formally in GF can give it a certain level of respect, and help bootstrap the development of other resources in that language. A way of helping to disseminate GF could be contributing to Wikipedia and linking to GF grammars for different languages.

There are also a number of concrete things that we should continue to focus on in order to make it easier for people to start using GF, including:
1. Maintain the RGL core but encourage more language-specific extensions.
2. Put effort into compiling comprehensive dictionaries.
3. Be rigorous with testing to ensure high quality.
4. Provide high level APIs and development tools to make it easier to be productive without understanding lower-level details.
5. Continue to strive for high scalability at compile- and runtime.

Proper testing is important for ensuring quality, but also for helping to attract people into the community and for helping contributors to be effective in their work. However, testing things effectively is not neccessarily easy. The generality of the RGL and the fact that languages can differ so much also makes it harder to have a single standard testsuite for all resource grammars.
There have been previous attempts at establishing standardised testing methods for the RGL, including [some work by Peter Ljunglöf](https://github.com/GrammaticalFramework/gf-rgl/tree/master/unittest#readme), although they have not caught on much. The [gf-test tool](https://github.com/GrammaticalFramework/gftest) can be very effective, although it is (often unusably) slow for complex things such as entire resource grammars and is best used for testing one function at a time. Overall there is a need for more standardised tools, resources, and testing tools for resource grammar developers. This could take the form of an abstract RGL treebank which grows constantly, with both language-independent and language-specific elements.

When it comes to documentation for GF, there is a lot around although it is spread over various places. Sometimes there are overlaps, other times there are gaps, and it can be hard to find answers to questions even if they have been answered before.

It is hard to compile everything together and ensure it is always up to date, and maybe this is not a realistic goal. Just as it is easier to find help online for popular languages and frameworks, perhaps the best way of tackling the GF documentation problems is by growing the community.
Stack Overflow in particular is important here, as it is the go-to place for many programming questions. There should be more of an effort to capture and record GF questions on Stack Overflow, for example by asking real GF students in a course to ask their questions there.

The GF book is very important, although it assumes a certain knowledge of linguistics, which not all readers have. People come to GF with different backgrounds, which can make it harder to write documentation. It may be time for a new book to be written, although it should not just be another edition of the first. Rather, it should have more of a focus, such as "Computational Linguistics with GF", and come with accompanying online materials. At the same time, other forms of media, in particular videos, are ever more relevant to certain kinds of students, and it is worth investing time in those too. Videos however cannot and should not replace written media. They also take more effort to produce and keep up to date.

Good examples of modern "books" for other frameworks include:
- Programming Language Foundations in Agda (PLFA), a book as in a glorified blog: https://plfa.github.io/
- Rust's official book, which is digital and easily navigatable: https://doc.rust-lang.org/stable/book/
- Beautiful Racket: https://beautifulracket.com/

Some linguistic phenomena are difficult or awkward to model in GF, and some additional features could make it more descriptionally adequate from a linguistic perspective. In particular, sometimes there exist linearisation differences which are dictated by the linear order of tokens in a sentence, and using GF parameters and selection to model these can be very cumbersome. For example, the determiner "a/an" in English, for which the `pre` construction exists, but is rather limited. A more detailed example in Czech which is not handled by `pre` is provided. A generalisation would be to have a `pre` constuct which pattern matched not on the subsequent _string_ but on a _parameter_ of the subsequent token.

Another limitation is the inability to model co-reference (anaphora) in an abstract syntax tree, i.e. when different nodes in a tree refer to the same the real-world entity, which can play a role for example in the reflexivisation of pronouns. Currently this is left completely up to the user as a task outside of GF, but support for it could be built-in. It should be possible to implement such features without breaking GF's bidirectionality.

The subject of dynamic lexicon has come up a lot in the past and is still as relevant as ever today. There are big plans to reimagine the PGF format as a database, which allows on-the-fly updating via transactions and other typical database mechanisms. It would also allow any arbitrary metadata to be stored along with the PMCFG, crucially including the GF source code itself which would allow smart paradigms to be preserved and used in runtime lexicon generation. The idea is well thought out and should be doable in principle, but requires a major programming effort to be realised.
