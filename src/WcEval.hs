module WcEval (getLineCount) where

getLineCount :: String -> Int
getLineCount text = length $ lines text