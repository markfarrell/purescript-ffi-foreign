module FFI.Unsafe.Foreign.JSON
  ( parse
  , stringify
  ) where

import Foreign (Foreign)

foreign import parse :: String -> Foreign

foreign import stringify :: Foreign -> String
