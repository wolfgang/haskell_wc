module Main where

import System.Environment
import qualified WcArgs

main :: IO ()
main = do
      args <- getArgs
      let fileName = WcArgs.getFileName args
      contents <- readFile fileName
      let lineCount = getLineCount contents
      putStrLn $ (show lineCount) ++ " " ++ fileName

getLineCount contents = (length $ lines contents)
