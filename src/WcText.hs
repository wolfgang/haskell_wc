module WcText (
  getLineCount,
  getWordCount,
  getByteCount,
  getLineCountNew,
  getWordCountNew,
  getByteCountNew,
  getAllCounts,
  WcResult(..)) where

getLineCount :: String -> Int
getLineCount text = length $ lines text

getWordCount :: String -> Int
getWordCount text = length $ words text

getByteCount :: String -> Int
getByteCount text = length text

data WcResult = WcLineCount Int
                | WcWordCount Int
                | WcByteCount Int
                | WcAllCounts Int Int Int deriving (Eq)

instance Show WcResult where
  show (WcLineCount count) = show count
  show (WcWordCount count) = show count
  show (WcByteCount count) = show count
  show (WcAllCounts lineCount wordCount byteCount) =
    " " ++ (show lineCount) ++ "  " ++ (show wordCount) ++ " " ++ (show byteCount)

getLineCountNew :: String -> WcResult
getLineCountNew text = WcLineCount $ length $ lines text

getWordCountNew :: String -> WcResult
getWordCountNew text = WcWordCount $ length $ words text

getByteCountNew :: String -> WcResult
getByteCountNew text = WcByteCount $ length text

getAllCounts :: String -> WcResult
getAllCounts text = WcAllCounts (getLineCount text) (getWordCount text) (getByteCount text)
