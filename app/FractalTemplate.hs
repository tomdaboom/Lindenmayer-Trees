module FractalTemplate where

import StringGenerator
import Turtlehead
import Render
import Graphics.Gloss

--Each of these needs the following four things

rules :: Rules
rules = []

imap :: InstructionTable
imap = []

startString :: String
startString = ""

iters :: Int
iters = 0