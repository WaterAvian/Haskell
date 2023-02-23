{-
head . tail [1,2] NOT work

tail is done which returns [2]. then 'head . [2]' doesn't make sense because '.' is for compose.

(head . tail) [1,2] works

Works. Composes function and then applies composed funciton to list

head . tail $ [1,2] works

I don't know why. $- does right side and then does left side. before removing.

head.tail $ [1,2] works

I also don't know why.
-}

--2 Define a function composeList that composes a list of functions into a single function.
composeList [x] = x
composeList (x:xs) = x . composeList xs

--3 Rewrite composeList as a fold.
foldr' f [] = []
foldr' f (x:xs) = f x (foldr' f xs)
composeListFold (x:xs) = foldr' (.) (x:xs)

--4 Recode your Hw2 stringToNum program as a composition of functions using the "dot" composition operator (.)



--5 Recode your Hw2 stringToNum program as a composition of functions using the "dot" composition operator (.)



--6 Code a function numToString, also using the composition form, that does the inverse of your stringToNum program.



-- 7 Write a function iter f x n that applies the function f n times to the initial value x. Assume that if n is zero or less then the value x is returned 
iter f x 1 = f x 
iter f x n = iter f (f x) (n-1)

-- 8. Code the function bin2int that takes a binary string of 0s and 1s and returns the value as an integer.

bin2int = foldl (\acc x -> acc * 2 + (if x == '1' then 1 else 0)) 0

-- 10 Using the functions curry and uncurry as a model, code functions curry3 and uncurry3 that work on triples rather than pairs.

curry3 f x y z = f (x, y, z)
uncurry3 f (x, y, z) = f x y z

-- 14 Define functions curryList :: ([a] -> d) -> (a -> [a] -> d) | uncurryList :: (a -> [a] -> d) -> ([a] -> d)

curryList f = (\x xs -> f $ a:as)
uncurryList f = \xas -> f (head xs) (tail xs)