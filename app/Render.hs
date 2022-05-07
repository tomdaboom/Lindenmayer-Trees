module Render where

import StringGenerator
import Turtlehead
import Graphics.Gloss

defaultStart :: TurtleState
defaultStart = TurtleState {
    pos = (0, 0),
    heading = 0,
    stack = []
}

getLines :: Int -> Rules -> LString -> InstructionTable -> [Line]
getLines n rules string table = runUpdates instructions defaultStart
    where 
        finalString = repeatApplyRules n rules string
        instructions = convertToInstructions table finalString

renderLine :: Line -> Picture
renderLine ((x1, y1), (x2, y2)) = Color white (Line [(x1, y1), (x2, y2)])

renderLines :: [Line] -> Picture
renderLines lines = pictures (renderLine <$> lines)



