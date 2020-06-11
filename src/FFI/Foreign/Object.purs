module FFI.Foreign.Object
  ( keys
  , values
  , literal
  , string
  , number
  , integer
  , boolean
  ) where

import Prelude

import Data.Tuple (Tuple)
import Data.Tuple as T

import Foreign (Foreign)

import Unsafe.Coerce as C

foreign import literal_ :: (forall a b. Tuple a b -> a) -> (forall a b. Tuple a b -> b) -> Array (Tuple String Foreign) -> Foreign

foreign import keys :: Foreign -> Array String

foreign import values :: Foreign -> Array Foreign

literal :: Array (Tuple String Foreign) -> Foreign
literal = literal_ T.fst T.snd

entry :: forall a. String -> a -> Tuple String Foreign
entry k v = T.Tuple k $ C.unsafeCoerce v

string :: String -> String -> Tuple String Foreign
string = entry

number :: String -> Number -> Tuple String Foreign
number = entry

integer :: String -> Int -> Tuple String Foreign
integer = entry

boolean :: String -> Boolean -> Tuple String Foreign
boolean = entry
