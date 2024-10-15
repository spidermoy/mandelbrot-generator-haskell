module Main where

import System.Environment(getArgs)
import Codec.Image.DevIL(Word8, ilInit, writeImage)
import Data.Array.Unboxed(UArray, listArray)

import CNumbers(c1, c2, c3, c4, c5, c6, plano)
import Julia(juliaSet)
import Mandelbrot(mandelbrotSet)

type Image = UArray (Int, Int, Int) Word8

main::IO ()
main = do
  putStrLn "SIMPLE FRACTAL GENERATOR"
  args <- getArgs
  case args of
    (fractal_type : input_size : _) ->
      if fractal_type `elem` ["mandelbrot","julia-c1","julia-c2","julia-c3","julia-c4","julia-c5","julia-c6"]
      then do
        putStrLn $ "\tfractal type: " ++ fractal_type
        putStrLn $ "\timage size: " ++ input_size ++ " x " ++ input_size ++ " pixels"
        ilInit
        let image_size = read input_size
            size       = ((0,0,0), (image_size-1, image_size-1, 3))
            pixels     = ((case fractal_type of
                            "mandelbrot" -> mandelbrotSet
                            "julia-c1"   -> juliaSet c1
                            "julia-c2"   -> juliaSet c2
                            "julia-c3"   -> juliaSet c3
                            "julia-c4"   -> juliaSet c4
                            "julia-c5"   -> juliaSet c5
                            "julia-c6"   -> juliaSet c6
                            _            -> const []) . plano)
                            (fromIntegral image_size)
            image      = listArray size [p | p <- pixels, _ <- [0 .. 3]] :: Image
        putStrLn "generating image..."
        writeImage (fractal_type ++ "_" ++ input_size ++ ".jpg") image
        putStrLn "done"
      else putStrLn "Invalid option"
    _ -> putStrLn "Invalid option"
