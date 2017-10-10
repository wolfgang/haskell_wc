module Main where

import System.Environment
import qualified WcArgs
import qualified WcText

main :: IO ()
main = do
      args <- getArgs
      case WcArgs.getAction args of
        WcArgs.CountLines -> do
          let fileName = WcArgs.getFileName args
          contents <- readFile fileName
          let lineCount = WcText.getLineCount contents
          putStrLn $ (show lineCount) ++ " " ++ fileName
        WcArgs.CountWords -> do
          let fileName = WcArgs.getFileName args
          contents <- readFile fileName
          let lineCount = WcText.getWordCount contents
          putStrLn $ (show lineCount) ++ " " ++ fileName
