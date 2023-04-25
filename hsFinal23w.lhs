
For this final:
Here are the "Do not"s:
  1.  Do not use the types from Vscode, if you  are using Vscode. 
  2.  Do not use ghci to confirm your types or code.
  3.  Do not search the web for answers.
  4.  Do not collaborate.
Here are the "Do"s:
  1.  Explain your reasoning if you are unsure
  2.  You may use any resource on the syllabus (homework solutions, lecture notes,
      examples, etc.)
  3.  Turn in what you complete in 2 hours.
  4.  You may turn in a revision to be completed by Friday at midnight.
  5.  If you do turn in a revision, you may use ghci. BUT if you do, explain your
      results and how you understand what ghci is telling you. Don't just give me
      the ghci type or computations! I am not testing ghci.

Partial credit is always an option so try to express your reasoning if you are doubtful.


> import Prelude hiding (const, or, any, map)


1.
  (a) (5) Give the Haskell polymorphic type for the map function over lists.

> map   :: (a -> b) -> [a] -> [b]

map takes a function (a -> b) and a list [a] and returns the result of applying [b], I believe.

  (b) (5) Give Haskell code for the map function over lists using recursion.

  map f [] = []
  map f (x:xs) = f x : map f xs

  (c) (5) Give Haskell code for the map function over lists using list
      comprehension.

  map f list@(x:xs) = [f x | x <- list]




2.
  (a) (5) Give the Haskell polymorphic type for the (.) composition operator.

> (.)   :: (a -> b) -> (c -> d) -> (a -> b -> c -> d -> f)

  (.) combines two functions (a -> b) -> (c -> d) and outputs a function of (a -> b -> c -> d -> f) where f is the final result of all the applications


  (b) (5) Give the Haskell code definition for the (.) composition operator.

  (.) x y = x y

(extra credit: give 3 different definitions.
i) using just function application,
ii) using the $ operator
iii) using a lambda term)





3. Give the Haskell polymorphic types of the following functions.

  (a) (5)

> const  :: a -> b -> a

> const x _ =  x

Self evident

  (b) (5)

> or     :: (Foldable a) => a -> Bool 

> or = foldr (||) False

it's foldable and applies || to each fold with false, returning a Bool. 

  (c) (5)

> any    :: (p -> Bool) -> [p] -> Bool || (p->Bool) -> (f -> [p]) -> Bool

> any p = or . (map p)


  (d) (5)

> ms     :: (a -> b) -> [a] -> Bool

> ms p g = any p . map g




4. Consider the following binary tree data type.

> data Tree a = Nil | Node a (Tree a) (Tree a)
>           deriving (Eq, Read,Show)

  (a) (5) Give the Haskell polymorphic type for mapT, the map function over the
      binary tree data type above.

> mapT    :: (a -> b) -> Tree a -> Tree b

I think. 

  (b) (5) Give a Haskell code definition for the mapT function.


> mapT _ Nil = Nil
> mapT f (Node x L R) = Node (f x) (mapT f L) (mapT f R)




  (c) (5) Give the Haskell polymorphic type for foldrT, a foldr function over
      the binary tree data type above. Note that it doesn't have to conform to Foldable,
      BUT your type must be consistent with your definition ion part (d).

> foldrT   :: (a -> b -> b) -> b -> Tree a -> b


  (d) (5) Give a Haskell code definition for the foldrT function.
      

> foldrT _ accum Nil = accum
> foldrT f accum (Node x L R) = f x (foldrT f (foldrT f acc R) L)


I think this is correct according to my note examples, which it should be. accumulator is passed all the way down before rebounding.

5. Set Abstract Data type in Haskell. Read all parts of this question before
   you answer any part of the question so you can make sure all parts of the
   code for your Set ADT implementation are consistent.

  (a) (5) What is the most essential property of Abstract Data Types in computer
      science? Name or clearly and succinctly describe the property.

  Abstract data types allow for blackbox manipulation as the specific data type (length, form, size) is not defined.
  This allows for Systems to create operations on ADT's without being confined to one data type.


  (b) (5) Code Haskell export controls for a Set abstract data type that gives
      a user of the module the ability to create an empty set, insert an
      element in a set, delete an element in a set, and test if an element is
      a member of a set. Your module MUST obey the essential property of
      abstract data types.

  Do we get a skip? I skip this. I don't understand the question.



  (c) (5) Give an appropriate type definition for the your Set abstract data
      type assuming an unordered list implementation.

  data Thing t = This t | Nothing

  (d) (10) Fill in the Haskell polymorphic types and Haskell code for the Set
      abstract data type assuming an unordered list implementation.

      Again, your module MUST obey the essential property of abstract data
      types.

> empty          :: Set a

> empty _ = Set []
>
>
>

> insert         :: a -> Set b -> Set a

> insert x (Set xs) = Set x:xs
>
>
>
>


> member         :: a -> Set b -> Bool

> member x (Set xs) = elem x xs
>
>
>
>


> delete         :: a -> Set a -> Set a

> delete x (Set xs) = Set [y | y <- xs, y /=  x]
>
>
>
>


6. Consider the following General Tree data type.

> data GTree a = GNil | GNode a [GTree a]


  (a) (5) Give the Haskell polymorphic type for a mapGT function over GTree.

> mapGT       :: (a -> b) -> GTree a -> GTree b

  (b) (5) Give a code definition for the mapGT function over GTree.


> mapGT _ GNil = GNil
> mapGT f (GNode x tree) = GNode (f x) mapGT f tree