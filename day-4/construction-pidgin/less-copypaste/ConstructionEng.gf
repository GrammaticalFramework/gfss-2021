--# -path=../lot-of-copypaste

concrete ConstructionEng of Construction =
   ConstructionI                   -- The inherited part
   with (Syntax=SyntaxEng) **      -- instanciated with SyntaxEng
   open SyntaxEng, LexiconEng, ParadigmsEng in { -- Open modules for defining things outside the inherited part

    lin
        -- Only lexical functions need to be done here

        -- Action
        Come = mkVP come_V ;
        Buy obj = SyntaxEng.mkVP
                    (ParadigmsEng.mkV2 "purchase")
                    obj ;
        -- Object
        Food = mkNP (mkN "food") ;
   }