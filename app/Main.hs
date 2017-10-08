module Main where

import System.Environment

main :: IO ()
main = do
  args <- getArgs
  mapM_ (\arg -> if arg /= "-l" then putStrLn $ "3 " ++ arg else putStr "") args
