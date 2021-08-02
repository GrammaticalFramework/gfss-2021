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

data GAction =
   GCompl GPred2 GItem 
 | GConjAction GListAction 
 | GModAction GAction GQuality 
 | GUse GPred1 
  deriving Show

data GDeontic = GModalAction GModal GAction 
  deriving Show

data GItem =
   GAKind GKind 
 | GAPlKind GKind 
 | GConjItem GItem GItem 
 | GPDPC 
 | GTheSgKind GKind 
  deriving Show

data GKind =
   GDataBreach 
 | GDataLeak 
 | GHarm 
 | GOrganisation 
  deriving Show

newtype GListAction = GListAction [GAction] deriving Show

data GModal =
   GMay 
 | GMust 
 | GShould 
  deriving Show

data GPhrase =
   GQProp GProposition 
 | GSProp GProposition 
  deriving Show

data GPred1 = GMakeAssessment 
  deriving Show

data GPred2 = GNotify 
  deriving Show

data GProposition = GPred GItem GDeontic 
  deriving Show

data GQuality = GAsSoonAsPrac 
  deriving Show


instance Gf GAction where
  gf (GCompl x1 x2) = mkApp (mkCId "Compl") [gf x1, gf x2]
  gf (GConjAction x1) = mkApp (mkCId "ConjAction") [gf x1]
  gf (GModAction x1 x2) = mkApp (mkCId "ModAction") [gf x1, gf x2]
  gf (GUse x1) = mkApp (mkCId "Use") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Compl" -> GCompl (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "ConjAction" -> GConjAction (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ModAction" -> GModAction (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Use" -> GUse (fg x1)


      _ -> error ("no Action " ++ show t)

instance Gf GDeontic where
  gf (GModalAction x1 x2) = mkApp (mkCId "ModalAction") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ModalAction" -> GModalAction (fg x1) (fg x2)


      _ -> error ("no Deontic " ++ show t)

instance Gf GItem where
  gf (GAKind x1) = mkApp (mkCId "AKind") [gf x1]
  gf (GAPlKind x1) = mkApp (mkCId "APlKind") [gf x1]
  gf (GConjItem x1 x2) = mkApp (mkCId "ConjItem") [gf x1, gf x2]
  gf GPDPC = mkApp (mkCId "PDPC") []
  gf (GTheSgKind x1) = mkApp (mkCId "TheSgKind") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "AKind" -> GAKind (fg x1)
      Just (i,[x1]) | i == mkCId "APlKind" -> GAPlKind (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ConjItem" -> GConjItem (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "PDPC" -> GPDPC 
      Just (i,[x1]) | i == mkCId "TheSgKind" -> GTheSgKind (fg x1)


      _ -> error ("no Item " ++ show t)

instance Gf GKind where
  gf GDataBreach = mkApp (mkCId "DataBreach") []
  gf GDataLeak = mkApp (mkCId "DataLeak") []
  gf GHarm = mkApp (mkCId "Harm") []
  gf GOrganisation = mkApp (mkCId "Organisation") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "DataBreach" -> GDataBreach 
      Just (i,[]) | i == mkCId "DataLeak" -> GDataLeak 
      Just (i,[]) | i == mkCId "Harm" -> GHarm 
      Just (i,[]) | i == mkCId "Organisation" -> GOrganisation 


      _ -> error ("no Kind " ++ show t)

instance Gf GListAction where
  gf (GListAction [x1,x2]) = mkApp (mkCId "BaseAction") [gf x1, gf x2]
  gf (GListAction (x:xs)) = mkApp (mkCId "ConsAction") [gf x, gf (GListAction xs)]
  fg t =
    GListAction (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseAction" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsAction" -> fg x1 : fgs x2


      _ -> error ("no ListAction " ++ show t)

instance Gf GModal where
  gf GMay = mkApp (mkCId "May") []
  gf GMust = mkApp (mkCId "Must") []
  gf GShould = mkApp (mkCId "Should") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "May" -> GMay 
      Just (i,[]) | i == mkCId "Must" -> GMust 
      Just (i,[]) | i == mkCId "Should" -> GShould 


      _ -> error ("no Modal " ++ show t)

instance Gf GPhrase where
  gf (GQProp x1) = mkApp (mkCId "QProp") [gf x1]
  gf (GSProp x1) = mkApp (mkCId "SProp") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "QProp" -> GQProp (fg x1)
      Just (i,[x1]) | i == mkCId "SProp" -> GSProp (fg x1)


      _ -> error ("no Phrase " ++ show t)

instance Gf GPred1 where
  gf GMakeAssessment = mkApp (mkCId "MakeAssessment") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "MakeAssessment" -> GMakeAssessment 


      _ -> error ("no Pred1 " ++ show t)

instance Gf GPred2 where
  gf GNotify = mkApp (mkCId "Notify") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Notify" -> GNotify 


      _ -> error ("no Pred2 " ++ show t)

instance Gf GProposition where
  gf (GPred x1 x2) = mkApp (mkCId "Pred") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Pred" -> GPred (fg x1) (fg x2)


      _ -> error ("no Proposition " ++ show t)

instance Gf GQuality where
  gf GAsSoonAsPrac = mkApp (mkCId "AsSoonAsPrac") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "AsSoonAsPrac" -> GAsSoonAsPrac 


      _ -> error ("no Quality " ++ show t)


