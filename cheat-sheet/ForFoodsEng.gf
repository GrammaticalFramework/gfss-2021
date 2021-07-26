-- more typical use of GF using opers to sweeten the lin syntax (as compared to FoodEng.gf)
-- not for running, though it might run with Food.gf
-- less notes so might want to read ForFoodEng.gf first

-- take note we are referencing Food (from Food.gf), and not Foods (the abstract seems compatible enough though)
concrete FoodsEng of Food = {
flags language = en_US;

-- defining simple "property" types
param
    Number = Sg | Pl ;

-- defining function types
lincat
    Comment,
    Quality = {
        s : Str
    } ; 
    
    Kind = {
        s : Number => Str
    } ; 

    Item = {
        s : Str ;
        n : Number
    } ; 

-- read oper section below for how regNoun, noun, det, adj, copula
-- works to achieve this syntax vs "longform" in ForFoodsEng.gf
lin 
    -- Wine, Cheese, Fish, Pizza : Kind ;
    -- nouns which can turn plural with an "s" behind (wines, cheeses, pizzas)
    Wine = regNoun "wine" ;
    Cheese = regNoun "cheese" ;
    Pizza = regNoun "pizza" ;

    -- nouns with customized singular vs plural forms (first argument is singular, second is plural)
    -- check noun oper
    Fish = noun "fish" "fish" ;

    -- Fresh, Warm, Italian, Expensive, Delicious, Boring : Quality ;
    Fresh = adj "fresh" ;
    Warm = adj "warm" ;
    Italian = adj "Italian" ;
    Expensive = adj "expensive" ;
    Delicious = adj "delicious" ;
    Boring = adj "boring" ;

    -- Very : Quality -> Quality ;
    Very qual = {
        s = "very" ++ qual.s
    } ;

    -- This, That, These, Those : Kind -> Item ;
    This  = det Sg "this" ;
    That  = det Sg "that" ;
    These = det Pl "these" ;
    Those = det Pl "those" ;
    
    -- Mod : Quality -> Kind -> Kind ;
    -- no workaround using PItalian or PBoring to remove duplicate Quality in the linearization
    -- trying to do so with this many Qualities implemented (in the same way) will be too verbose anyway.
    Mod qual kind = {
        s = \\n => qual.s ++ kind.s ! n
    } ;

 
    -- Pred : Item -> Quality -> Comment ;
    -- note that "copula ! item.n" is evaluated with precedence
    Pred item qual = {
        s = item.s ++ copula ! item.n ++ qual.s
    } ;
    
  oper

    -- copula oper to simplify Pred definition (are they synonyms anyway??)
    copula:                 -- define a function named copula
    Number => Str           -- of type is a table where Number is mapped to a string
     = table {              -- as a table
        Sg => "is" ;        -- where Number "Sg" is mapped to "is"
        Pl => "are"         -- and Number "Pl" is mapped to "are"
    } ;

    -- det oper to simplify the Quantification definitions (This, That, These Those)
    -- to be used in the form   This = det Sg "this" ;
    {- TODO
        So we are missing a lock field for Kind here, and this is throwing warnings.
        https://inariksit.github.io/gf/2018/05/25/subtyping-gf.html#lock-fields - read this

        Added lin Item before the { } which works to solve for Item type parameter, but cant
        seem to find anywhere to add lin Kind in the same manner.

        Are adding names to the record types (as suggested by inariksit) the only way?
    -}
    det : Number -> Str -> Kind -> Item  = -- makes an Item from Number, a determiner and a Kind
        \n, det, noun -> lin Item {
            s = det ++ noun.s ! n ;     -- add the determiner to the appropriate Kind word
            n = n                       -- carry though the Sg / Pl form onto the Item
        } ;

    noun : Str -> Str -> Kind =         -- takes 2 strings, first being Singular form, second being Plural form and returns the Kind
        \man, men -> lin Kind {
            s = table {
                Sg => man ;
                Pl => men
            }
        } ;

    regNoun :
        Str -> Kind = \car -> noun car (car + "s") ; -- uses noun oper to define s for plural
    
    -- adj oper,  only packages the string as a Quality for better lin syntax
    adj : Str -> Quality = \qual -> lin Quality { 
        s = qual
    } ;

}
