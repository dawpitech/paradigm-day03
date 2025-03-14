{-
-- EPITECH PROJECT, 2025
-- PARADIGM-DAY03
-- File description:
-- Game.hs
-}

import Data.Maybe (isJust)

data Item = Sword | Bow | MagicWand
    deriving Eq

instance Show Item where
    show Sword     = "sword"
    show Bow       = "bow"
    show MagicWand = "magic wand" 

class HasItem a where
    getItem :: a -> Maybe Item
    hasItem :: a -> Bool
    hasItem a = isJust $ getItem a

data Mob = Mummy | Skeleton Item | Witch (Maybe Item)
    deriving (Eq)

instance Show Mob where
    show Mummy                    = "mummy"
    show (Skeleton Bow)           = "doomed archer"
    show (Skeleton Sword)         = "dead knight"
    show (Skeleton i)             = "skeleton holding a " ++ show i
    show (Witch Nothing)          = "witch"
    show (Witch (Just MagicWand)) = "sorceress"
    show (Witch (Just i))         = "witch holding a " ++ show i

instance HasItem Mob where
    getItem Mummy        = Nothing
    getItem (Skeleton i) = Just i
    getItem (Witch i)    = i

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

create :: String -> Maybe Mob
create "mummy"         = Just createMummy
create "doomed archer" = Just createArcher
create "dead knight"   = Just createKnight
create "witch"         = Just createWitch
create "sorceress"     = Just createSorceress
create _ = Nothing

equip :: Item -> Mob -> Maybe Mob
equip i (Skeleton _) = Just $ Skeleton i
equip i (Witch _)    = Just $ Witch (Just i)
equip _ _            = Nothing
