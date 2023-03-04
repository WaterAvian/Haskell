--data BinT = Data Int | Left BinT | Right BinT deriving (show)
--f = Data 5
--s = Left (Data 4) --how to reference?
--type class
--surface $ Circle 2

--1 Define a Binary Tree data type (BinT t) with values stored at both leaves and internal nodes. Write the following map and foldr functions on your binary tree data type. Be sure to include tests for your code in your handin.
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

x = Node (Leaf 5) (Leaf 3)
xx = Node x 2 (Leaf 4)

--1.a mapT - applies a function to every value node in the tree.
mapT f (Leaf x::Tree) = Leaf (f x)
mapT f (Node t1 v t2::Tree) = Node (mapT f t1) (f v) (mapT f t2)

--1.b foldrT - folds up all elements in a binary tree with an associative operator (like (+) or (*) but not (-) and not (/) ).
foldrT _ (Leaf x) = x  
foldrT f (Node t1 v t2) = (foldrT f t1) `f` v `f` (foldrT f t2)

--2 Define an Expression Tree algebraic data (Expr t) with constructors Add, Sub, Mul, Div that stand for the corresponding arithmetic operators.

data Expr x = Value x | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr deriving (Show)

--3 Code a simple evaluator over Int (or Num t) expression trees that returns an Int (or more generally a Num t). Test your evaluator, including a test for divide-by-zero. You get to decide how you want to handle divide-by-zero for this first evaluator version.
eval (Value x) = x
eval (Add x y) = (eval x) + (eval y)
eval (Sub x y) = (eval x) - (eval y)
eval (Mul x y) = (eval x) * (eval y)
eval (Div x y) = (eval x) / (eval y)

--4 Now convert the evaluator to a function that checks for divide by zero and returns an "Either a b" type. A divide by zero should return an error string in the "Left" constructor value and a correct calculation should return the result in the "Right" constructor value.
--data Divzero a = Nothing | Just a

eval' (Div x 0) = Nothing