> import Data.Char

"3" = String, "even" = String, "even 3" = String

Below are answers to a, b, c of question 2.
with the exception of the first line, for defining a subFunction

> subFunction x = x+1
> topAFunction subFunction = subFunction 1
> topBFunction x = (\x -> x+1.0)
> topCFunction subFunction = subFunction
> diffs [] = []
> diffs (x:y:xs) = x - y : diffs xs
> groupByN n [] = []
> groupByN n list@(x:xs) = take n list : groupByN n (drop n list)
> intercept :: (Fractional a) => a -> a -> a
> intercept m b = -b / m
