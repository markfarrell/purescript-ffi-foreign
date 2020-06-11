module FFI.Unsafe.Foreign
  ( try
  ) where

import Data.Either (Either)
import Data.Either as E

import Effect.Exception (Error)

foreign import try_ :: forall a b. (Error -> Either Error b) -> (b -> Either Error b) -> (a -> b) -> a -> Either Error b

-- todo: move to separate module/package
try :: forall a b. (a -> b) -> a -> Either Error b
try = try_ E.Left E.Right
