{-# LANGUAGE DeriveGeneric #-}

module ReadGrammar where

import StringGenerator
import Turtlehead

import Data.Aeson
import Data.Text
import GHC.Generics

data ParsedGrammar = ParsedGrammar {
    rules :: [(Text, Text)],
    imap :: [(Text, Float)],
    startString :: Text,
    iters :: Int
}

