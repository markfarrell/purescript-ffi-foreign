module FFI.Unsafe.Foreign.JSON
  ( parse
  , stringify
  , try
  ) where

import Data.Either (Either(..))

import Effect.Exception (Error)

import Foreign (Foreign)

foreign import parse :: String -> Foreign

foreign import stringify :: Foreign -> String

foreign import try_ :: forall a b. (Error -> Either Error b) -> (b -> Either Error b) -> (a -> b) -> a -> Either Error b

-- todo: move to separate module/package
try :: forall a b. (a -> b) -> a -> Either Error b
try = try_ Left Right
