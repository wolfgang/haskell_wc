module WcArgs (getFileName, getAction, WcAction(..)) where

data WcAction = CountLines | CountWords | InvalidOption String deriving (Eq, Show)

getFileName :: [String] -> String
getFileName args = args!!1

getAction :: [String] -> WcAction
getAction args
    | firstArg == "-l" = CountLines
    | firstArg == "-w" = CountWords
    | otherwise = InvalidOption $ tail firstArg
    where firstArg = args!!0
