{-# LANGUAGE CPP #-}
module React.Flux.Event.Foreign where

import React.Flux.Internal (HandlerArg)

#ifdef __GHCJS__

foreign import javascript unsafe
    "$1.persist()"
    js_event_persist :: HandlerArg -> IO ()

#else

js_event_persist :: HandlerArg -> IO ()
js_event_persist = undefined

#endif
