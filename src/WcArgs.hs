module WcArgs (getFileName, getAction, WcAction(..)) where

data WcAction =   CountLines
                | CountWords
                | CountBytes
                | CountAll
                | InvalidOption String deriving (Eq, Show)

getFileName :: [String] -> String
getFileName args = if length args==2 then args!!1 else args!!0

getAction :: [String] -> WcAction
getAction args
    | firstArg == "-l" = CountLines
    | firstArg == "-w" = CountWords
    | firstArg == "-c" = CountBytes
    | firstArg == "" = CountAll
    | otherwise = InvalidOption $ tail firstArg
    where firstArg = if length args==2 then args!!0 else ""
