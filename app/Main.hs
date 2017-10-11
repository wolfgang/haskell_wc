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
        WcArgs.InvalidOption option -> do
          hPutStrLn stderr $ "wc: invalid option -- '" ++ option ++ "'"
          hPutStrLn stderr "Try 'wc --help' for more information."

processFile :: String -> (String -> Int) -> IO ()
processFile fileName processor = do
  contents <- readFile fileName
  let count = processor contents
  putStrLn $ buildOutput count fileName

buildOutput :: Int -> String -> String
buildOutput prefix fileName = (show prefix) ++ " " ++ fileName
