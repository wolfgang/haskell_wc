module Main where

import System.Environment
import qualified WcArgs
import qualified WcText

main :: IO ()
main = do
      args <- getArgs
      if WcArgs.getAction args == WcArgs.CountLines then do
        let fileName = WcArgs.getFileName args
        contents <- readFile fileName
        let lineCount = WcText.getLineCount contents
        putStrLn $ (show lineCount) ++ " " ++ fileName
      else
        putStrLn $ "Error: Invalid input " ++ show args
