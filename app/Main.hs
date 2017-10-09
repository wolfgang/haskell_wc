module Main where

import System.Environment
import qualified WcArgs
import qualified WcEval

main :: IO ()
main = do
      args <- getArgs
      let fileName = WcArgs.getFileName args
      contents <- readFile fileName
      let lineCount = WcEval.getLineCount contents
      putStrLn $ (show lineCount) ++ " " ++ fileName
