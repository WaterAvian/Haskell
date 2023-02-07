
--1*****************************
{- #OLD ATTEMPT
flatten :: [[a]] -> [a]
flatten [] = []
flatten (x:xs)
    | x /= [] = [a | a <- xs]
    | xs = xs = x:flatten xs
-}

flatten [] = []
flatten (x:xs) = x ++ flatten xs -- ++ vs : cons?

--misc code
topFunction x = x
subFunction = 5
topFunction subFunction
--misc code

--2****************************
remdups [] = []
remdups (x:xs) = [x] ++ remdups xs
    where
        xs = [y | y<-xs, y /= x]

--3****************************
scanSum' [] = 0
scanSum' (x:xs) = x + scanSum' xs
scanSum (x:xs) = xs ++ scanSum' x

group xs 

listDiff =