module WcArgs (getFileName) where

getFileName :: [String] -> String
getFileName args = args!!1
