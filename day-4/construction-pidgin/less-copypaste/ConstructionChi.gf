--# -path=../lot-of-copypaste

concrete ConstructionChi of Construction =
   ConstructionI                   -- The inherited part
   with (Syntax=SyntaxChi) **      -- instanciated with SyntaxChi
   open SyntaxChi, LexiconChi, ParadigmsChi in { -- Open modules for defining things outside the inherited part

    lin
        -- Only lexical functions need to be done here
        Come = mkVP come_V ;
        Buy obj = mkVP buy_V2 obj ;

        Food = mkNP (mkN "食物") ;

   }