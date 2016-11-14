module Main where

import Data.HMM
import Data.Array

type State = [Char]
type Event = [Char]

states' :: [State]
states' = ["w1", "w2"]

events' :: [Event]
events' = ["v1", "v2", "v3", "v4"]

initProbs' :: State -> Prob
initProbs' "w1" = 0.4
initProbs' "w2" = 0.6

transMatrix' :: State -> State -> Prob
transMatrix' "w1" "w0" = 0.1
transMatrix' "w1" "w1" = 0.6
transMatrix' "w1" "w2" = 0.3
transMatrix' "w2" "w0" = 0.2
transMatrix' "w2" "w1" = 0.3
transMatrix' "w2" "w2" = 0.5

outMatrix' :: State -> Event -> Prob
outMatrix' "w1" "v1" = 0.3
outMatrix' "w1" "v2" = 0.3
outMatrix' "w1" "v3" = 0.3
outMatrix' "w1" "v4" = 0.1

outMatrix' "w2" "v1" = 0.7
outMatrix' "w2" "v2" = 0.2
outMatrix' "w2" "v3" = 0.1
outMatrix' "w2" "v4" = 0

myHmm = HMM states' events' initProbs' transMatrix' outMatrix'



main :: IO ()
main = do 
    print $ forward myHmm ["v4", "v1", "v2"]
    print $ viterbi myHmm (listArray (0,2) ["v4", "v1", "v2"])




