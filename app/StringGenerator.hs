module StringGenerator where

type Symbol = Char
type LString = [Symbol]
type Rules = [(Char, LString)]

applyRules :: Rules -> LString -> LString
applyRules _ []         = []
applyRules rules (x : xs) = case lookup x rules of
    Nothing  -> x : applyRules rules xs
    Just sub -> sub ++ applyRules rules xs

repeatApplyRules :: Int -> Rules -> LString -> LString
repeatApplyRules 0 _ xs     = xs
repeatApplyRules n rules xs = repeatApplyRules (n-1) rules xs'
    where xs' = applyRules rules xs
