{-Code the last function using reverse function-}

myLast :: [a] -> a
myLast [] = error "empty list"
myLast x = head (reverse x)

{-Code the init function, using reverse-}
myInit :: [a] -> [a]
myInit [] = []
myInit x = reverse (tail (reverse x))


{-Code a list to Tuple, have cases for no or single elements-}
myTuple :: [a] -> (a, a)
myTuple [] = error "empty list"
myTuple [_] = error "only one item" --or [x:[]] could work as well
myTuple (x:xs) = (x, last xs)

myRange x y = if (x > y) then [0] else [x..y]
myRangeR x y = if (x > y) then [0] else if (x == y) then [x] else [x] ++ myRangeR (x+1) y
--    myRangeRecursive x y = if (x > y) then [0] else [x] ++ myRangeRecursive (x+1) y

myRangeProduct x y = if (x > y) then 0 else product [x..y]
myRecursiveProduct x y = if (x > y) then 0 else if (x == y) then y else x * (myRecursiveProduct (x+1) y)
--fac y = myRange 0 y

{-Factiorial function-}
myFactorial x = myRangeProduct 1 x

{-Recursive and non-Recursive Functions for Exponentiation-}
myExponent x y = product (replicate x y)
myRecursiveExponent x y = if y == 0 then 1 else x * myRecursiveExponent x (y-1) --(x*x)
