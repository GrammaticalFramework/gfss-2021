module Lib
    ( someFunc
    ) where

import CompLaw
import PGF hiding (Tree)

someFunc :: IO ()
someFunc = putStrLn "someFunc"
