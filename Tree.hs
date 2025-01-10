{-
-- EPITECH PROJECT, 2025
-- PARADIGM-DAY03
-- File description:
-- Tree.hs
-}

data Tree a = Empty | Node (Tree a) a (Tree a)
    deriving Show

addInTree :: Ord a => a -> Tree a -> Tree a
addInTree v Empty = Node Empty v Empty
addInTree v (Node l ev r) | v < ev    = Node (addInTree v l) ev r
                          | otherwise = Node l ev (addInTree v r)
