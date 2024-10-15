module CNumbers where

type ℝ = Double
newtype ℂ = Punto (ℝ, ℝ)

instance Show ℂ where
  show (Punto p) = show p

instance Num ℂ where
  (+) (Punto (a, b)) (Punto (c, d)) = Punto (a+c, b+d)
  (*) (Punto (a, b)) (Punto (c, d)) = Punto (a*c - b*d, a*d + b*c)

norma::ℂ->ℝ
norma (Punto (a,b)) = a*a + b*b

c1::ℂ
c1 = Punto (-0.74543, 0.11301)

c2::ℂ
c2 = Punto (-0.8 ,0.156)

c3::ℂ
c3 = Punto (-0.75,0.11)

c4::ℂ
c4 = Punto (-0.1, 0.651)

c5::ℂ
c5 = Punto (-0.7269, 0.1889)

c6::ℂ
c6 = Punto (0.285, -0.01)

plano::ℝ->[ℂ]
plano n = [Punto ((4*j)/(n-1) - 2 , (4*i)/(n-1) - 2) | i <- [0 .. n-1], j <- [0 .. n-1]]
