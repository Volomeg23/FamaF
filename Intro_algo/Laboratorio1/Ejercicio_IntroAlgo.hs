--rev :: [a] -> [a]

maximo2 :: [Int] -> Int
maximo2 (a:b:xs) = maximo2 ((max a b):xs)
maximo2 [x] = x

sumaPares :: [(Int, Int)] -> Int
sumaPares [] = 0
sumaPares ((a,b):xs) = a+b + sumaPares xs

binario :: [Int] -> Bool
binario [] = True
binario (x:xs)
  |x==1 = binario xs
  |x==0 = binario xs
  |otherwise = False
  
sin0 :: [Int] -> [Int]
sin0 [] = []
sin0 (x:xs)
 |x==0 = sin0 xs
 |otherwise = x:(sin0 xs)

ult :: [Int] -> Int 
ult [] = 0
ult [x] = x
ult (x:xs) = ult(xs)

rev :: [Int] -> [Int]
rev [] = []
rev xs = (xs!!((length xs) -1)): (rev (take ((length xs)-1) xs))

























