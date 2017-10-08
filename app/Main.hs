module Main where

import System.Environment

main :: IO ()
main = do
      args <- getArgs
      let fileName = getFileNameFromArgs args
      contents <- readFile fileName
      let lineCount = getLineCount contents
      putStrLn $ (show lineCount) ++ " " ++ fileName

getFileNameFromArgs :: [String] -> String
getFileNameFromArgs args = args!!1
getLineCount contents = (length $ lines contents)
