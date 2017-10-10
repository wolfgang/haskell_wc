module Main where

import System.Environment
import qualified WcArgs
import qualified WcText

main :: IO ()
main = do
      args <- getArgs
      let fileName = WcArgs.getFileName args
      contents <- readFile fileName
      case WcArgs.getAction args of
        WcArgs.CountLines -> do
          let lineCount = WcText.getLineCount contents
          putStrLn $ buildOutput lineCount fileName
        WcArgs.CountWords -> do
          let wordCount = WcText.getWordCount contents
          putStrLn $ buildOutput wordCount fileName

buildOutput :: Int -> String -> String
buildOutput prefix fileName = (show prefix) ++ " " ++ fileName
