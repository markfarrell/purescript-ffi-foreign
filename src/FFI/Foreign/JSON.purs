module FFI.Foreign.JSON
  ( parse
  , stringify
  ) where

import Data.Either (Either)

import Effect.Exception (Error)

import Foreign (Foreign)

import FFI.Unsafe.Foreign.JSON as J

parse :: String -> Either Error Foreign
parse = J.try J.parse

stringify :: Foreign -> String
stringify = J.stringify
