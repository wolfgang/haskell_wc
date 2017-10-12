module WcText (
  getLineCount,
  getWordCount,
  getByteCount,
  getAllCounts,
  WcResult(..)) where

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

getLineCount :: String -> WcResult
getLineCount text = WcLineCount $ length $ lines text

getWordCount :: String -> WcResult
getWordCount text = WcWordCount $ length $ words text

getByteCount :: String -> WcResult
getByteCount text = WcByteCount $ length text

getAllCounts :: String -> WcResult
getAllCounts text =
  WcAllCounts lineCount wordCount byteCount
  where
    WcLineCount lineCount = getLineCount text
    WcWordCount wordCount = getWordCount text
    WcByteCount byteCount = getByteCount text
