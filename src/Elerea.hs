module Elerea (foo) where
  import Control.Monad (when, unless, join)
  import Control.Monad.Fix (fix)
  import Control.Applicative ((<*>), (<$>))
  import FRP.Elerea.Simple

  foo :: IO ()
  foo = putStrLn "Hola mundo"

{--
  foo :: IO ()
  foo = do
    (directionKey, directionKeySink) <- external (False, False, False, False)
    network <- start $ do
      player <- transfer initialPlayer (\s dK -> movePlayer s dK 10) directionKey
--}
