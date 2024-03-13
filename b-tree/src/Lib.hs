module Lib
  ( foldTree,
  )
where

data Tree a
  = Leaf
  | Node Integer (Tree a) a (Tree a)
  deriving (Show, Eq)

foldTree :: [a] -> Tree a
foldTree = foldr insert Leaf
  where
    insert x Leaf = Node 0 Leaf x Leaf
    insert x (Node h l v r)
      | height l < height r = Node h (insert x l) v r
      | height l > height r = Node h l v (insert x r)
      | otherwise = Node (1 + max (height l) (height (insert x r))) l v (insert x r)
    height Leaf = -1
    height (Node h _ _ _) = h