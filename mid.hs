unknown9 [] = []
unknown9 (x:xs) = (a , x) : b
    where
        a = length $ x : takeWhile (==x) xs
        b = unknown9 (dropWhile (==x) xs)

unknown8 [] = []
unknown8 (x:xs) = (length $ x : takeWhile (==x) xs, x) : unknown8 (dropWhile (==x) xs)

unknown7 xs = all (\(x,y) -> (x<=y)) (zip xs (tail xs))

unknown6 m n = take m (map ($ n) . map (*) $ [1..])
unknown6' m n = take m (map (\f -> f n) . map (*) $ [1..])
unknown6'' m n = take m ((map (\f -> f n) . map (*)) [1..])

unknown5 p = foldr (\x xs -> if p x then x:xs else xs) []

unknown4 ys = not . any (`elem` ys)

unknown3 xs = \ys -> [(x,y) | x <- xs, y <- ys, x < y ]

unknown2 p as = [ a | a <- as, p a]