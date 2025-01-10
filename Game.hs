{-
-- EPITECH PROJECT, 2025
-- PARADIGM-DAY03
-- File description:
-- Game.hs
-}

data Item = Sword | Bow | MagicWand
    deriving Eq

instance Show Item where
    show Sword = "sword"
    show Bow = "bow"
    show MagicWand = "magicWand" 
