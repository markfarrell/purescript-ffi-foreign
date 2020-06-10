module FFI.Unsafe.Foreign
  ( try
  ) where

import Data.Either (Either(..))

import Effect.Exception (Error)

foreign import try_ :: forall a b. (Error -> Either Error b) -> (b -> Either Error b) -> (a -> b) -> a -> Either Error b

-- todo: move to separate module
try :: forall a b. (a -> b) -> a -> Either Error b
try = try_ Left Right
