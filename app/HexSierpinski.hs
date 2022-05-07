module HexSierpinski where

import StringGenerator
import Turtlehead
import Render
import Graphics.Gloss

moveDist :: Float
moveDist = 40

rules :: Rules
rules = [ 
    ('A', "B-A-B"),
    ('B', "A+B+A")
    ]

imap :: InstructionTable
imap = [ 
    ('A', [Forward moveDist]), 
    ('B', [Forward moveDist]), 
    ('+', [LeftRot (pi/3)]), 
    ('-', [RightRot (pi/3)]) 
    ]

startString :: LString
startString = "A"

iters :: Int
iters = 8