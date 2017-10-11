module Main where

import System.IO
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
          putStrLn $ buildOutput lineCount fileName
        WcArgs.CountWords -> do
          let fileName = WcArgs.getFileName args
          contents <- readFile fileName
          let wordCount = WcText.getWordCount contents
          putStrLn $ buildOutput wordCount fileName
        WcArgs.InvalidOption option -> do
          hPutStrLn stderr $ "wc: invalid option -- '" ++ option ++ "'"
          hPutStrLn stderr "Try 'wc --help' for more information."

buildOutput :: Int -> String -> String
buildOutput prefix fileName = (show prefix) ++ " " ++ fileName
