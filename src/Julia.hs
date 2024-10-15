module Julia where

import CNumbers(ℂ, norma)
import Codec.Image.DevIL(Word8)

juliaSet::ℂ->[ℂ]->[Word8]
juliaSet c = map converge
  where
    converge z = itera z 0
    itera z n
      | norma z > 4 = n
      | n == 255    = n
      | otherwise   = itera (z*z + c) (n+1)
