concrete FoodEngSilly of Food = {
    lincat
      Comment = {s : Str} ;
      Quality = {
          s : Str ;
          pq : PQual
      } ;

      Item = {s : Str ; n : Number} ;  -- Inherent Number

      Kind = {s : Number => Str ;
              hasBoring, hasItalian : Bool
             } ;     -- Variable Number

    param
      Number = Sg | Pl ;
      Bool = True | False ;
      PQual = PBoring | PItalian ;

    lin
      {- : Item ->     (argument 1)
          Quality ->    (argument 2)
         Comment       (result / return type) -}
      Pred item qual = {
          s = case item.n of {
              Sg => item.s ++ "is" ++ qual.s ;
              Pl => item.s ++ "are" ++ qual.s }
      } ;

      -- : Kind -> Item
      This kind = {
          s = "this" ++ kind.s ! Sg ;
          n = Sg
      } ;
      Those kind = {
          s = "those" ++ kind.s ! Pl ;
          n = Pl
      } ;

      -- : Quality -> Kind -> Kind
      Mod qual kind = case qual.pq of {
          PBoring => case kind.hasBoring of {
                  True => kind ;
                  False => kind ** {
                      s = \\n => qual.s ++ kind.s ! n ;
                      hasBoring = True }
          } ;
          PItalian => case kind.hasItalian of {
                  True => kind ;
                  False => kind ** {
                      s = \\n => qual.s ++ kind.s ! n ;
                      hasItalian = True}
          }
      } ;

      Boring = {s = "boring" ; pq = PBoring} ;
      Italian = {s = "Italian" ; pq = PItalian} ;  -- : Quality

      -- : Kind
      Pizza = {s =
                table {
                  Sg => "pizza" ;
                  Pl => "pizzas"
                 } ;
               hasBoring, hasItalian = False ;
              } ;

    oper

      someFun : Str -> Str = \_ -> "always hello" ;

      someTable : Number => Str =
          \\n => "always singular" ;
          -- shorthand for table {n => "always singular"} ;
          -- shorthand for table {Sg => "always singular ; Pl => "always singular"} ;
}
