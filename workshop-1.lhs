Workshop 2/2/23

This is a literate Haskell file so that I can combine text and programs in one file, easily!

We are going to go over what we have covered so far,
specifically:

--  types
--  beta-reduction
--  recursion
--  list comprehensions
--  higher-order functions

I am not sure where people are in their undertanding. So
this workshop may land low or high! No problem -- don't
stress.


Here are some definitions:

> double x = 2*x
> square x = x*x
> twice f x =  f (f x)
> quad = twice double
> fourth :: Num a => a -> a
> fourth = twice square 

1. What is the type quad? Do not use ghci for this. Give
your reasons for your type.

Twice :: (a -> a) -> a -> a
double :: (Numd) => a -> a
quad :: (Num a) => a -> a

{-Type returns what is accepts after other functions or variables are applied.-}

2. What is the type of fourth? Do not use ghci for this.
Give your reasons for your type.

fourth :: Num a => a -> a

3. Check your types in ghci. If they are different,
justify the haskell type and where your assumptions
differ. (Don't worry about the typeclass context at this
point.)

{^above^}

4. Generalize the twice function above to repeat with the
following specification:

repeat f 0 x yields x
repeat f 1 x yields f x
repeat f 2 x yields f (f x)
repeat f 3 x yields f (f (f x))
and so on.

> twice' f 0 x = f x
> twice' f 1 x = f x
> twice' f n x = f (twice' f (n-1) x)

5. Here is the definition of foldl:

> foldl' f v [] = v
> foldl' f v (x:xs) = foldl' f (f v x) xs

Use foldl' to write a function product_left that computes
the product of a list of numbers (ints or floats)

> product_left f v (x:xs) = foldl' (*) v (x:xs)

6. What is the type of foldl'? (do it yourself and then
check in ghci, same as above.)

(a -> a -> a) -> a -> [a] -> a

7. Write product_left' that uses recursion.

product_left' :: Num t => p -> t -> [t] -> t
> product_left' f v (x:xs) = foldl' (*) v (x:xs)

8. What are the types of product_left and product_left'?

Num t => p -> t -> [t] -> t

9. Here is the definition of foldr:

> foldr' f v [] = v
> foldr' f v (x:xs) = f x (foldr' f v xs)

10. What is the type of foldr'? (do it yourself and then
check in ghci, same as above.)

10. Using beta-reduction show the computation of
foldl' (-) 0 [1,2,3].
foldl' (-) ((-) 0 1) [2,3]
foldl' (-) ((-)((-) 0 1) 2) [3]
foldl' (-) ((-)((-)((-) 0 1) 2) 3) []


11. Using beta-reduction show the computation of
foldr' (-) 0 [1,2,3].


12. Are they the same? Why or why not? Check your answer
in ghci and justify.

{Literally the same.}

13. Use a list comprehension and either fold to write
the sum_cube_odd (is the sum of the cubes from 1 to n).
so sum_cube_odd 5 should give use the sum of the cubes
[1,3,5] = 1 + 27 + 125

14. Write the same function using filter, map, and fold.

15. We introduced the compose operator (.). And PINH
introduced a composeList :: [a->a] -> a.  Here is a
definition of composeList.  What does composeList do?
(Use beta-reduction to demonstrate your explanation.)

> composeList' [f] x = f x
> composeList' (f:fs) x = f (composeList' fs x)

16. (Challenge!) Rewrite the composeList using the dot (.) operator and
either of the folds.

