module Turtlehead where

import StringGenerator
import Control.Monad.State.Lazy

data Instruction = Forward Float | LeftRot Float | RightRot Float | Push | Pop
    deriving (Show, Eq)

type InstructionTable = [(Symbol, [Instruction])]

type Position = (Float, Float)
type Heading = Float

type Line = (Position, Position)

data TurtleState = TurtleState {
    pos :: Position,
    heading :: Float, -- Anticlockwise rotation in radians
    stack :: [(Position, Float)]
} deriving (Show, Eq)

convertToInstructions :: InstructionTable -> LString -> [Instruction]
convertToInstructions _ []         = []
convertToInstructions table (x:xs) = case lookup x table of
    Nothing    -> convertToInstructions table xs
    Just instr -> instr ++ convertToInstructions table xs

updateTurtle :: Instruction -> State TurtleState (Maybe Line)
updateTurtle (Forward distance) = do
    currentState <- get
    let (x, y) = pos currentState
    let head   = heading currentState

    let (moveX, moveY) = (distance * cos head, distance * sin head)
    let newPos = (x + moveX, y + moveY)

    put currentState { pos = newPos }
    return $ Just ((x, y), newPos)

updateTurtle (LeftRot angle) = do
    currentState <- get
    let head = heading currentState

    put currentState { heading = head + angle }
    return Nothing

updateTurtle (RightRot angle) = do
    currentState <- get
    let head = heading currentState

    put currentState { heading = head - angle }
    return Nothing

updateTurtle Push = do
    currentState <- get
    let currentStack = stack currentState
    let currentPos = pos currentState
    let head = heading currentState

    put currentState { stack = (currentPos, head) : currentStack }
    return Nothing

updateTurtle Pop = do
    currentState <- get
    let (newPos, newHead) : newStack = stack currentState

    put currentState { pos = newPos, heading = newHead, stack = newStack }
    return Nothing

runUpdates :: [Instruction] -> TurtleState -> [Line]
runUpdates = evalState . runUpdates' 

runUpdates' :: [Instruction] -> State TurtleState [Line]
runUpdates' [] = return []
runUpdates' (i:is) = do
    line <- updateTurtle i
    lines <- runUpdates' is
    return (case line of
        Nothing -> lines
        Just line -> line : lines)
