module WcText (
  getLineCount,
  getWordCount,
  getByteCount,
  getAllCounts,
  resultToString,
  WcResult(..)) where

data WcResult = WcSingleCount Int | WcAllCounts Int Int Int deriving (Show, Eq)

resultToString :: WcResult -> String
resultToString (WcSingleCount count) = show count
resultToString (WcAllCounts lineCount wordCount byteCount) =
  " " ++ (show lineCount) ++ "  " ++ (show wordCount) ++ " " ++ (show byteCount)


getLineCount :: String -> WcResult
getLineCount text = WcSingleCount $ length $ lines text

getWordCount :: String -> WcResult
getWordCount text = WcSingleCount $ length $ words text

getByteCount :: String -> WcResult
getByteCount text = WcSingleCount $ length text

getAllCounts :: String -> WcResult
getAllCounts text =
  WcAllCounts lineCount wordCount byteCount
  where
    WcSingleCount lineCount = getLineCount text
    WcSingleCount wordCount = getWordCount text
    WcSingleCount byteCount = getByteCount text
