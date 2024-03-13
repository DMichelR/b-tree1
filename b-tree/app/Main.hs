module Main (main) where

import Lib

main :: IO ()
main = do
  let tree = foldTree "ABCDEFGHIJ"
  print tree
