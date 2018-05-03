module Test.Main where

import Prelude

import ChocoPie (runChocoPie)
import Effect (Effect)
import Effect.Console (logShow)
import FRP.Event (Event, subscribe)

main :: Effect Unit
main = do
  logShow "This program will run and print 1"
  program

  where
    program = do
      let
        drivers =
          { a: const $ pure $ pure 1
          , b: \events ->
              void $ subscribe events \n -> do
                logShow n
          }
      runChocoPie main' drivers
    main' sources =
      { a: mempty :: Event Unit
      , b: sources.a
      }
