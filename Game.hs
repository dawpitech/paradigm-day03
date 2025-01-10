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

data Mob = Mummy | Skeleton Item | Witch (Maybe Item)
    deriving (Eq, Show)

createMummy :: Mob
createMummy = Mummy

createArcher :: Mob
createArcher = Skeleton Bow

createKnight :: Mob
createKnight = Skeleton Sword

createWitch :: Mob
createWitch = Witch Nothing

createSorceress :: Mob
createSorceress = Witch $ Just MagicWand
