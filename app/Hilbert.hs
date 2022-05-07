module Hilbert where

import StringGenerator
import Turtlehead
import Render
import Graphics.Gloss

--Each of these needs the following four things

rules :: Rules
rules = [
    ('A', "+BF-AFA-FB+"),
    ('B', "-AF+BFB+FA-")
    ]

imap :: InstructionTable
imap = [
    ('F', [Forward 20]),
    ('+', [LeftRot (pi/2)]),
    ('-', [RightRot (pi/2)])
    ]

startString :: String
startString = "A"

iters :: Int
iters = 6