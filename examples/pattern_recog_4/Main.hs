module Main where

import Data.HMM

type State = [Char]
type Event = [Char]

states' :: [State]
states' = ["w0", "w1", "w2"]

events' :: [Event]
events' = ["v0", "v1", "v2", "v3", "v4"]

initProbs' :: State -> Prob
initProbs' "w0" = 0
initProbs' "w1" = 0.4
initProbs' "w2" = 0.6

transMatrix' :: State -> State -> Prob
transMatrix' "w0" "w0" = 1
transMatrix' "w0" _ = 0
transMatrix' "w1" "w0" = 0.1
transMatrix' "w1" "w1" = 0.6
transMatrix' "w1" "w2" = 0.3
transMatrix' "w2" "w0" = 0.2
transMatrix' "w2" "w1" = 0.3
transMatrix' "w2" "w2" = 0.5

outMatrix' :: State -> Event -> Prob
outMatrix' "w0" "v0" = 1
outMatrix' "w0" _ = 0

outMatrix' "w1" "v0" = 0
outMatrix' "w1" "v1" = 0.3
outMatrix' "w1" "v2" = 0.3
outMatrix' "w1" "v3" = 0.3
outMatrix' "w1" "v4" = 0.1

outMatrix' "w2" "v0" = 0
outMatrix' "w2" "v1" = 0.7
outMatrix' "w2" "v2" = 0.2
outMatrix' "w2" "v3" = 0.1
outMatrix' "w2" "v4" = 0

myHmm = HMM states' events' initProbs' transMatrix' outMatrix'

main :: IO ()
main = print $ forward myHmm ["v4", "v1", "v2"]




