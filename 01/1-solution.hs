import Data.List

part1 = do
  lisp <- return . (map length . group . sort) =<< readFile "input"
  return (head lisp - last lisp)
