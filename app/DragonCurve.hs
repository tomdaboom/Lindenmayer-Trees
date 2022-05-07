module DragonCurve where

import StringGenerator
import Turtlehead
import Render
import Graphics.Gloss

moveDist :: Float
moveDist = 40

rules :: Rules
rules = [ 
    ('F', "F+G"),
    ('G', "F-G")
    ]

imap :: InstructionTable
imap = [ 
    ('F', [Forward moveDist]), 
    ('G', [Forward moveDist]), 
    ('+', [LeftRot (pi/2)]), 
    ('-', [RightRot (pi/2)]) 
    ]

startString :: LString
startString = "F"

iters :: Int
iters = 13