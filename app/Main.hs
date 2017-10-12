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
          processFileNew fileName WcText.getLineCountNew
        WcArgs.CountWords -> do
          processFileNew fileName WcText.getWordCountNew
        WcArgs.CountBytes -> do
            processFileNew fileName WcText.getByteCountNew
        WcArgs.CountAll -> do
            processFile fileName countAll
        WcArgs.InvalidOption option -> do
          hPutStrLn stderr $ "wc: invalid option -- '" ++ option ++ "'"
          hPutStrLn stderr "Try 'wc --help' for more information."

processFileNew :: String -> (String -> WcText.WcResult) -> IO ()
processFileNew fileName processor = do
  contents <- readFile fileName
  let result = processor contents
  putStrLn $ buildOutput (show result) fileName

countAll :: String -> String
countAll contents =
  let
    lineCount = WcText.getLineCount contents
    wordCount = WcText.getWordCount contents
    byteCount = WcText.getByteCount contents
  in " " ++ (show lineCount) ++ "  " ++ (show wordCount) ++ " " ++ (show byteCount)

processFile :: String -> (String -> String) -> IO ()
processFile fileName processor = do
  contents <- readFile fileName
  let count = processor contents
  putStrLn $ buildOutput count fileName

buildOutput :: String -> String -> String
buildOutput prefix fileName = prefix ++ " " ++ fileName
