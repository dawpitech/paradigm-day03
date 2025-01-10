{-
-- EPITECH PROJECT, 2025
-- PARADIGM-DAY03
-- File description:
-- Tree.hs
-}

data Tree a = Empty | Node (Tree a) a (Tree a)
    deriving Show

instance Functor Tree where
    fmap f Empty = Empty
    fmap f (Node l v r) = Node (fmap f l) (f v) (fmap f r)

addInTree :: Ord a => a -> Tree a -> Tree a
addInTree v Empty = Node Empty v Empty
addInTree v (Node l ev r) | v < ev    = Node (addInTree v l) ev r
                          | otherwise = Node l ev (addInTree v r)

listToTree :: Ord a => [a] -> Tree a
listToTree []     = Empty
listToTree (a:as) = addInTree a $ listToTree as
