module Main where

import System.Environment
import qualified WcArgs
import qualified WcText

main :: IO ()
main = do
      args <- getArgs
      let fileName = WcArgs.getFileName args
      contents <- readFile fileName
      let lineCount = WcText.getLineCount contents
      putStrLn $ (show lineCount) ++ " " ++ fileName
