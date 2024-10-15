# A fractal generator written in Haskell

![img](/examples/mandelbrot_1500.jpg)

_Being a language, mathematics may be used not only to inform but also, among other things, to seduce._

─Benoît Mandelbrot

## Requirements:

* [GHC 9.4.8 (The Glasgow Haskell Compiler)](https://www.haskell.org/ghc/)
* [Haskell Cabal](https://www.haskell.org/cabal/)
* Codec-Image-DevIL: `sudo apt-get install libdevil-dev`

## How to use:

1. Installation:

`cabal new-build`

2. How to use it:

`cabal new-run MandelbrotGenerator fractal-type size`

Examples:

```bash
> cabal new-run MandelbrotGenerator mandelbrot 2000
> cabal new-run MandelbrotGenerator julia-c1 3000
> cabal new-run MandelbrotGenerator julia-c2 4000
> cabal new-run MandelbrotGenerator julia-c3 5000
> cabal new-run MandelbrotGenerator julia-c4 6000
> cabal new-run MandelbrotGenerator julia-c5 7000
> cabal new-run MandelbrotGenerator julia-c6 8000
```