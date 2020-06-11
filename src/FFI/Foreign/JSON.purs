module FFI.Foreign.JSON
  ( parse
  , stringify
  ) where

import Data.Either (Either)

import Effect.Exception (Error)

import Foreign (Foreign)

import FFI.Unsafe.Foreign as F

foreign import parse_ :: String -> Foreign

foreign import stringify :: Foreign -> String

parse :: String -> Either Error Foreign
parse = F.try parse_
