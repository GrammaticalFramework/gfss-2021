{-   using .gf extension for syntax highlighting,  not for running (tho it will run!)


Regarding the use of ** operator

"
the syntax for 
foo ** {s = …}
means: "use foo as is, but replace its s  field with (whatever)"
" - inariksit


Comments
-- this is a single line comment

{-   
this is a block comment
-}


--  -}  <---- NO NESTED COMMENTS!


---- notes taken for Food.gf
-- define an abstract grammar named Food
abstract Food = {

  -- only 1 flag, startcat, which defines Comment to be the default starting category for parsing and generation
  flags startcat = Comment ;

  -- list of categories, of which 4 are defined
  cat
    Comment ;
    Item ;
    Kind ;
    Quality ;

  -- list of functions
{- 
  "official definitions" from gf-tutoral
  fun f : T	f is a function of type T
  Function type: A -> B -> C, read "function from A and B to C"
-}
  fun
    -- Pred function of a type which takes 2 arguments, Item, Quality, and returns a Comment
    -- Using official reading, Pred is a function from Item and Quality to Comment
    Pred : Item -> Quality -> Comment ;       -- Predication: "item is quality"

    This,
    That,
    These,
    Those : Kind -> Item ; -- Quantification: turn the Kind ("pizza") into Item ("this pizza")

    -- "modification" functions that returns same type as an input parameter
    Mod : Quality -> Kind -> Kind ;           -- Modification: "pizza" to "boring pizza"
    Very : Quality -> Quality ;               -- Enhance a Quality: "boring" to "very boring"


    Wine,
    Cheese,
    Fish,
    Pizza : Kind ;        -- list of Kinds

    Fresh,
    Warm,
    Italian,
    Boring,
    Expensive,
    Delicious : Quality ;     -- list of Qualities

}


-- notes taken for FoodEng.gf
-- define a concrete grammar FoodEng of abstract grammar Food
concrete FoodEng of Food = {
    -- lincat section to elaborate on Categories, which must be mentioned first in the cat section of the abstract grammar
    lincat
        -- Kind is defined as a type with property s, a table type where Numbers are mapped to strings
        -- and two properties, hasBoring and hasItalian (both Bool types)
        Kind = {
            s : Number => Str ;

            hasBoring,
            hasItalian : Bool
        }; -- variable number

        Quality = {
            s : Str ;
            pq : PQual -- no semicolon allowed at end of list
        };
        
        Item = {
            s : Str ;
            n : Number
        }; -- inherent parameter number

        -- TODO: further explanation on variable vs inherent number? seems to work the same to me!

        Comment = {
            s : Str
        };
    

    
    param
        -- Number is defined as a type which can be Sg or Pl
        Number = Sg | Pl ;
        
        Bool = True | False ;
        PQual = PBoring | PItalian ;
    
    lin
        -- We will start by defining the first and simple functions (Kind and Quality)
        -- Pizza : Kind
        Pizza = {
            -- we define two forms for the noun Pizza by using table
            {- this is read:
                the property s is a table where
                   "Number" Sg is mapped to "pizza", and
                   "Number" Pl is mapped to "pizzas"
            -}
            s = table {
                Sg => "pizza" ;
                Pl => "pizzas" -- no semicolon allowed at end of list
            }; 

            hasBoring = False ;
            hasItalian = False
        };

        -- Boring : Quality
        Boring = {
            s = "boring" ;
            pq = PBoring
        };

        -- Italian : Quality
        Italian = {
            s = "Italian" ;
            pq = PItalian
        };

        -- Mod : Quality -> Kind -> Kind ; -- Modification: "pizza" to "boring pizza"
        -- qual and kind are the names of the input parameters
  
        {- (1) definition of a table - this was done before PBoring and PItalian were introduced so not same as (2) now.
        Mod qual kind = 
        s = table {
            --Sg => qual.s ++ kind.s ! Sg ;
            n => qual.s ++ kind.s ! n
        };
        -}

        -- (2) alternate definition of a table
        -- the case for qual.pq is to eliminate printing of "boring boring" and "Italian Italian" in the linearizations
        -- but take note it is kinda like a hack, as in the abstract tree generation the repeat still exists
        -- iniariksit referenced to some advanced material to remove this properly from the abstract grammar
        Mod qual kind = case qual.pq of {
            PBoring => case kind.hasBoring of {
                -- A ** B operator. it means to use A as-is, but replace A.s with { }
                True => kind ** {
                    -- \\ is synctactic sugar to define 1-branch tables. "\\n => kind.s !n" is equivalent to "table { n => kind.s !n }"
                    s = \\n => kind.s ! n
                };

                False => kind ** {
                    s = \\n => qual.s ++ kind.s ! n ;
                    hasBoring = True
                }
            };
                
            PItalian => case kind.hasItalian of {
                -- also can just return the kind instead of s = \\n => kind.s ! n
                True => kind;
                
                False => kind ** {
                    s = \\n => qual.s ++ kind.s ! n ;
                    hasItalian = True
                }
            }
        };

        -- This : Kind -> Item ; -- Quantification: turn the Kind ("pizza") into Item ("this pizza")
        This kind = {
            -- When using kind, select (!) the appropriate case from the table
            s = "this" ++ kind.s ! Sg ;
            n = Sg
        };

        -- Those : Kind -> Item ; -- Quantification: turn the Kind ("pizza") into Item ("this pizza")
        Those kind = {
            s = "those" ++ kind.s ! Pl ;
            n = Pl
        };

        -- Pred : Item -> Quality -> Comment ; -- Predication: "item is quality"
        Pred item qual = {
            s = case item.n of {
                -- is and iz will parse to the same abstract Pred, but linearize will produce ioritize "is".
                Sg => item.s ++ ("is" | "iz") ++ qual.s ;
                Pl => item.s ++ "are" ++ qual.s
            }
        };

    oper
        foo : Str -> Str = \_ -> "hello";
}
