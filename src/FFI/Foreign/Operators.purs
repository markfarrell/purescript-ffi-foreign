module FFI.Foreign.Operators
  ( typeof
  ) where

import Foreign (Foreign)

foreign import typeof :: Foreign -> String
