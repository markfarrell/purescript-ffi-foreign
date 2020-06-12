module FFI.Foreign.Object
  ( keys
  , values
  , literal
  , entries
  , entry
  ) where

import Prelude

import Data.Either (Either)

import Data.Tuple (Tuple)
import Data.Tuple as T

import Effect.Exception (Error)

import Foreign (Foreign)

import Unsafe.Coerce as C

import FFI.Unsafe.Foreign as F

foreign import keys :: Foreign -> Array String

foreign import values :: Foreign -> Array Foreign

foreign import literal_ :: (forall a b. Tuple a b -> a) -> (forall a b. Tuple a b -> b) -> Array (Tuple String Foreign) -> Foreign

foreign import entries_ :: (forall a b. a -> b -> Tuple a b) -> Foreign -> Array (Tuple String Foreign)

literal :: Array (Tuple String Foreign) -> Foreign
literal = literal_ T.fst T.snd

entry :: forall a. String -> a -> Tuple String Foreign
entry k v = T.Tuple k $ C.unsafeCoerce v

entries :: Foreign -> Either Error (Array (Tuple String Foreign))
entries = F.try $ entries_ T.Tuple 
