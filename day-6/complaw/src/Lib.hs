module Lib
    ( someFunc
    ) where

import CompLaw
import PGF hiding (Tree)
import qualified Data.Map.Strict as Map

data L4Sentence = L4S [Condition] Event [Party] Deontic Action Deadline deriving (Show, Eq, Read)
data Condition  = Condition String [String]                             deriving (Show, Eq, Read) -- Timed Automata
data Event      = Event String                                          deriving (Show, Eq, Read) -- Timed Automata
data Party      = Party String                                          deriving (Show, Eq, Read)
data Deontic    = Must | May                                            deriving (Show, Eq, Read)
data Action     = Action { name :: String
                         , params :: [Map.Map String String] }          deriving (Show, Eq, Read)
-- pay(to=bob, some=money)
-- notify(to=bob, body="you owe me money")
data Deadline = Now | Then String                                       deriving (Show, Eq, Read) -- Timed Automata

someFunc :: IO ()
someFunc = putStrLn "someFunc"
