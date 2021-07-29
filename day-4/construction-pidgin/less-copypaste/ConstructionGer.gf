--# -path=../lot-of-copypaste

concrete ConstructionGer of Construction =
   ConstructionI                   -- The inherited part
   with (Syntax=SyntaxGer) **      -- instanciated with SyntaxGer
   open SyntaxGer, LexiconGer, ParadigmsGer in { -- Open modules for defining things outside the inherited part

    lin
        -- Only lexical functions need to be done here
        Come = mkVP come_V ;
        Buy obj = mkVP buy_V2 obj ;

        Food = mkNP (mkN "Essen") ;

   }