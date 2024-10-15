module Mandelbrot where

import CNumbers(ℂ, norma)
import Codec.Image.DevIL(Word8)

mandelbrotSet::[ℂ]->[Word8]
mandelbrotSet = map converge
  where
    converge c = itera c 0 where
      itera z n
        | norma z > 4 = n
        | n == 255    = n
        | otherwise   = itera (z*z + c) (n+1)
