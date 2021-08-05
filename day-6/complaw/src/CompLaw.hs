module CompLaw where

import PGF hiding (Tree)

----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> Expr
  fg :: Expr -> a

newtype GString = GString String deriving Show

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

newtype GInt = GInt Int deriving Show

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

newtype GFloat = GFloat Double deriving Show

instance Gf GFloat where
  gf (GFloat x) = mkFloat x
  fg t =
    case unFloat t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

data Action =
   Compl Pred2 Item 
 | ConjAction ListAction 
 | MakeAssessment 
 | ModAction Action Quality 
  deriving Show

data Deadline =
   LexDeadline String
  deriving Show

data Deontic = ModalAction Modal Action 
  deriving Show

data Event =
   Upon Kind 
 | LexEvent String
  deriving Show

data Item =
   AKind Kind 
 | APlKind Kind 
 | ConjItem Item Item 
 | PDPC 
 | TheSgKind Kind 
  deriving Show

data Kind =
   LexKind String
  deriving Show

newtype ListAction = ListAction [Action] deriving Show

data Modal =
   LexModal String
  deriving Show

data Phrase =
   QProp Event Proposition Deadline 
 | SProp Event Proposition Deadline 
  deriving Show

data Pred2 = Notify 
  deriving Show

data Proposition = Pred Item Deontic 
  deriving Show

data Quality


instance Gf Action where
  gf (Compl x1 x2) = mkApp (mkCId "Compl") [gf x1, gf x2]
  gf (ConjAction x1) = mkApp (mkCId "ConjAction") [gf x1]
  gf MakeAssessment = mkApp (mkCId "MakeAssessment") []
  gf (ModAction x1 x2) = mkApp (mkCId "ModAction") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Compl" -> Compl (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "ConjAction" -> ConjAction (fg x1)
      Just (i,[]) | i == mkCId "MakeAssessment" -> MakeAssessment 
      Just (i,[x1,x2]) | i == mkCId "ModAction" -> ModAction (fg x1) (fg x2)


      _ -> error ("no Action " ++ show t)

instance Gf Deadline where
  gf (LexDeadline x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexDeadline (showCId i)
      _ -> error ("no Deadline " ++ show t)

instance Gf Deontic where
  gf (ModalAction x1 x2) = mkApp (mkCId "ModalAction") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ModalAction" -> ModalAction (fg x1) (fg x2)


      _ -> error ("no Deontic " ++ show t)

instance Gf Event where
  gf (Upon x1) = mkApp (mkCId "Upon") [gf x1]
  gf (LexEvent x) = mkApp (mkCId x) []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Upon" -> Upon (fg x1)

      Just (i,[]) -> LexEvent (showCId i)
      _ -> error ("no Event " ++ show t)

instance Gf Item where
  gf (AKind x1) = mkApp (mkCId "AKind") [gf x1]
  gf (APlKind x1) = mkApp (mkCId "APlKind") [gf x1]
  gf (ConjItem x1 x2) = mkApp (mkCId "ConjItem") [gf x1, gf x2]
  gf PDPC = mkApp (mkCId "PDPC") []
  gf (TheSgKind x1) = mkApp (mkCId "TheSgKind") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "AKind" -> AKind (fg x1)
      Just (i,[x1]) | i == mkCId "APlKind" -> APlKind (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ConjItem" -> ConjItem (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "PDPC" -> PDPC 
      Just (i,[x1]) | i == mkCId "TheSgKind" -> TheSgKind (fg x1)


      _ -> error ("no Item " ++ show t)

instance Gf Kind where
  gf (LexKind x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexKind (showCId i)
      _ -> error ("no Kind " ++ show t)

instance Gf ListAction where
  gf (ListAction [x1,x2]) = mkApp (mkCId "BaseAction") [gf x1, gf x2]
  gf (ListAction (x:xs)) = mkApp (mkCId "ConsAction") [gf x, gf (ListAction xs)]
  fg t =
    ListAction (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseAction" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsAction" -> fg x1 : fgs x2


      _ -> error ("no ListAction " ++ show t)

instance Gf Modal where
  gf (LexModal x) = mkApp (mkCId x) []

  fg t =
    case unApp t of

      Just (i,[]) -> LexModal (showCId i)
      _ -> error ("no Modal " ++ show t)

instance Gf Phrase where
  gf (QProp x1 x2 x3) = mkApp (mkCId "QProp") [gf x1, gf x2, gf x3]
  gf (SProp x1 x2 x3) = mkApp (mkCId "SProp") [gf x1, gf x2, gf x3]

  fg t =
    case unApp t of
      Just (i,[x1,x2,x3]) | i == mkCId "QProp" -> QProp (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "SProp" -> SProp (fg x1) (fg x2) (fg x3)


      _ -> error ("no Phrase " ++ show t)

instance Gf Pred2 where
  gf Notify = mkApp (mkCId "Notify") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Notify" -> Notify 


      _ -> error ("no Pred2 " ++ show t)

instance Gf Proposition where
  gf (Pred x1 x2) = mkApp (mkCId "Pred") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Pred" -> Pred (fg x1) (fg x2)


      _ -> error ("no Proposition " ++ show t)

instance Show Quality

instance Gf Quality where
  gf _ = undefined
  fg _ = undefined




