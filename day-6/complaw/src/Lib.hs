{-# LANGUAGE ViewPatterns #-}
module Lib
    ( someFunc
    ) where

import CompLaw
import PGF hiding (Tree)
import qualified Data.Map.Strict as Map

data L4Sentence = L4S L4Event [Party] L4Deontic L4Action L4Deadline deriving (Show, Eq, Read)
data Condition  = Condition String [String]                             deriving (Show, Eq, Read) -- Timed Automata
data L4Event    = L4Event String                                        deriving (Show, Eq, Read) -- Timed Automata
data Party      = Party String                                          deriving (Show, Eq, Read)
data L4Deontic  = DMust | DMay                                          deriving (Show, Eq, Read)
data L4Action   = L4Action { name :: String
                           , params :: Map.Map String String }          deriving (Show, Eq, Read)
-- pay(to=bob, some=money)
-- notify(to=bob, body="you owe me money")
data L4Deadline = L4Now | L4Then String                                       deriving (Show, Eq, Read) -- Timed Automata

event2gf (L4Event str) = Upon (LexKind str)

party2gf (Party "PDPC") = PDPC
party2gf (Party x) = TheSgKind (LexKind x)

deontic2gf DMust = LexModal "Must"
deontic2gf DMay  = LexModal "May"

action2gf (L4Action name (Map.null -> True)) = fg $ mkApp (mkCId name) []
action2gf (L4Action name (Map.toList -> [])) = fg $ mkApp (mkCId name) []

deadline2gf (L4Now)    = LexDeadline "Now"
deadline2gf (L4Then _) = LexDeadline "AsSoonAsPrac"

-- CompLaw> l SProp (Pred (TheSgKind Organisation) (ModalAction Must (Use MakeAssessment)))
-- the organisation must make an assessment .

mySentence1 :: L4Sentence
mySentence1 =
  L4S
  (L4Event "Sunrise")
  [(Party "Organisation")]
  DMust
  (L4Action "MakeAssessment" Map.empty)
  (L4Then "soon")

sentence2gf :: L4Sentence -> Expr
sentence2gf (L4S event (party:ps) l4d acts dline) =
  gf $ SProp (event2gf event) (Pred (party2gf party) (ModalAction (deontic2gf l4d) (action2gf acts))) (deadline2gf dline)
-- SProp Always (Pred PDPC (ModalAction Should MakeAssessment)) AsSoonAsPrac
  
someFunc :: IO ()
someFunc = do
  mypgf <- readPGF "src/CompLaw.pgf"
  let myeng = head $ languages mypgf
      mylin = linearise mypgf myeng (sentence2gf mySentence1)
  putStrLn mylin
  
  where linearise = linearize
