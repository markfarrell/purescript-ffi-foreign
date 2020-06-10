module FFI.Foreign.JSON
  ( parse
  , stringify
  ) where

import Prelude

import Data.Either (Either(..))

import Effect.Exception (Error)
import Effect.Exception as E

import Foreign (Foreign)

import FFI.Unsafe.Foreign as F
import FFI.Unsafe.Foreign.JSON as J

parse :: String -> Either Error Foreign
parse = F.try J.parse

stringify :: Foreign -> Either Error String
stringify w = do
  x <- pure $ J.stringify w
  y <- pure $ J.stringify <<< J.parse <<< J.stringify $ w
  case x == y of
    false -> Left  $ E.error "Invalid J data type."
    true  -> Right $ x
