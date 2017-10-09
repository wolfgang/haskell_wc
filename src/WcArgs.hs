module WcArgs (getFileName, getAction, WcAction(..)) where

data WcAction = CountLines deriving (Eq, Show)

getFileName :: [String] -> String
getFileName args = args!!1

getAction :: [String] -> WcAction
getAction _ = CountLines
