module Main where

import Graphics.Gloss

import StringGenerator
import Turtlehead
import Render

--import DragonCurve
--import HexSierpinski
--import FractalTree
import BarnsleyFern

width, height :: Int
width = 800
height = 600

window = InWindow "Lindenmayer" (width, height) (10, 10)

background = black

renderIters :: Int -> IO ()
renderIters iters = do
    let lines = getLines iters rules startString imap
    let drawing = renderLines lines 
    display window background drawing


main :: IO ()
main = do 
    putStrLn "Rendering L-System"
    renderIters iters
    