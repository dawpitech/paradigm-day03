{-
-- EPITECH PROJECT, 2025
-- PARADIGM-DAY03
-- File description:
-- Tree.hs
-}

data Tree a = Empty | Node (Tree a) a (Tree a)
    deriving Show
