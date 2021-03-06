module Main where

import System.IO
import System.Environment
import qualified WcArgs
import qualified WcText

main :: IO ()
main = do
      args <- getArgs
      let fileName = WcArgs.getFileName args
      case WcArgs.getAction args of
        WcArgs.CountLines -> do
          processFile fileName WcText.getLineCount
        WcArgs.CountWords -> do
          processFile fileName WcText.getWordCount
        WcArgs.CountBytes -> do
            processFile fileName WcText.getByteCount
        WcArgs.CountAll -> do
            processFile fileName WcText.getAllCounts
        WcArgs.InvalidOption option -> do
          hPutStrLn stderr $ "wc: invalid option -- '" ++ option ++ "'"
          hPutStrLn stderr "Try 'wc --help' for more information."

processFile :: String -> (String -> WcText.WcResult) -> IO ()
processFile fileName processor = do
  contents <- readFile fileName
  putStrLn $ buildOutput (processor contents) fileName

buildOutput :: WcText.WcResult -> String -> String
buildOutput result fileName = (WcText.resultToString result) ++ " " ++ fileName
