module WcText (getLineCount, getWordCount, getByteCount, getLineCountNew, WcResult(..)) where

getLineCount :: String -> Int
getLineCount text = length $ lines text

getWordCount :: String -> Int
getWordCount text = length $ words text

getByteCount :: String -> Int
getByteCount text = length text

data WcResult = WcLineCount Int deriving (Eq)

instance Show WcResult where
  show (WcLineCount count) = show count

getLineCountNew :: String -> WcResult
getLineCountNew text = WcLineCount $ length $ lines text
