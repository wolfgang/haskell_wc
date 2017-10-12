module WcText (getLineCount, getWordCount, getByteCount, getLineCountNew, WcResult(..)) where

getLineCount :: String -> Int
getLineCount text = length $ lines text

getWordCount :: String -> Int
getWordCount text = length $ words text

getByteCount :: String -> Int
getByteCount text = length text

data WcResult = WcLineCount Int deriving (Show, Eq)

getLineCountNew :: String -> WcResult
getLineCountNew text = WcLineCount $ length $ lines text
