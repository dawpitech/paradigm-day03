{-
-- EPITECH PROJECT, 2025
-- PARADIGM-DAY03
-- File description:
-- Tree.hs
-}

import Data.Binary.Builder (append)

data Tree a = Empty | Node (Tree a) a (Tree a)
    deriving Show

instance Functor Tree where
    fmap f Empty = Empty
    fmap f (Node l v r) = Node (fmap f l) (f v) (fmap f r)

instance Foldable Tree where
    foldr f a Empty = a
    foldr f a b = foldr f a $ treeToList b

addInTree :: Ord a => a -> Tree a -> Tree a
addInTree v Empty = Node Empty v Empty
addInTree v (Node l ev r) | v < ev    = Node (addInTree v l) ev r
                          | otherwise = Node l ev (addInTree v r)

listToTree :: Ord a => [a] -> Tree a
listToTree = foldr addInTree Empty

treeToList :: Tree a -> [a]
treeToList Empty        = []
treeToList (Node l v r) = treeToList l ++ [v] ++ treeToList r

treeSort :: Ord a => [a] -> [a]
treeSort l = treeToList $ listToTree l
