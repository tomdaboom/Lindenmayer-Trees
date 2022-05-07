module BarnsleyFern where

import StringGenerator
import Turtlehead
import Render
import Graphics.Gloss

moveDist :: Float
moveDist = 40

rules :: Rules
rules = [
    ('X', "F+[[X]-X]-F[-FX]+X"),
    ('F', "FF")
    ]

imap :: InstructionTable
imap = [
    ('X', []),
    ('F', [Forward moveDist]),
    ('[', [Push]),
    (']', [Pop]),
    ('+', [LeftRot 0.436332]),
    ('-', [RightRot 0.436332])
    ]

startString :: String
startString = "X"

iters :: Int
iters = 6