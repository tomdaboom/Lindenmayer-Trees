{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module ReadGrammar where

import StringGenerator
import Turtlehead

import Data.Aeson
import Data.Text
import GHC.Generics
import System.IO
import qualified Data.ByteString.Lazy as B

data ParsedGrammar = ParsedGrammar {
    rules :: [(Text, Text)],
    imap :: [(Text, [(Text, Float)])],
    startString :: Text,
    iters :: Int
} deriving (Generic, Show)

instance FromJSON ParsedGrammar where
    parseJSON (Object v) = ParsedGrammar 
        <$> v .: "rules" 
        <*> v .: "imap"
        <*> v .: "startString"
        <*> v .: "iters"


readGrammar :: FilePath -> IO (Maybe ParsedGrammar)
readGrammar path = do
    byteString <- B.readFile path
    return $ decode byteString

