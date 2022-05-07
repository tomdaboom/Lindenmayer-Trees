module FractalTree where

import StringGenerator
import Turtlehead
import Render
import Graphics.Gloss

moveDist :: Float
moveDist = 40

rules :: Rules
rules = [
    ('1', "11"),
    ('0', "1[0]0")
    ]

imap :: InstructionTable
imap = [
    ('0', [Forward moveDist]),
    ('1', [Forward moveDist]),
    ('[', [Push, LeftRot (pi/4)]),
    (']', [Pop, RightRot (pi/4)]),
    ('+', [LeftRot (pi/2)])
    ]

startString :: String
startString = "+0"

iters :: Int
iters = 5