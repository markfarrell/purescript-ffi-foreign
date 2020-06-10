module FFI.Foreign.Object
  ( keys
  , values
  ) where

import Foreign (Foreign)

foreign import keys :: Foreign -> Array String

foreign import values :: Foreign -> Array Foreign
