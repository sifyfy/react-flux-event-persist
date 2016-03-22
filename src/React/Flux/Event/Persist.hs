{-# LANGUAGE CPP #-}
module React.Flux.Event.Persist
    ( -- * On
      on'
      -- * Keyboard
    , onKeyDown'
    , onKeyPress'
    , onKeyUp'
      -- * Focus
    , onBlur'
    , onFocus'
      -- * Form
    , onChange'
    , onInput'
    , onSubmit'
      -- * Mouse
    , onClick'
    , onContextMenu'
    , onDoubleClick'
    , onDrag'
    , onDragEnd'
    , onDragEnter'
    , onDragExit'
    , onDragLeave'
    , onDragOver'
    , onDragStart'
    , onDrop'
    , onMouseDown'
    , onMouseEnter'
    , onMouseLeave'
    , onMouseMove'
    , onMouseOut'
    , onMouseOver'
    , onMouseUp'
      -- * Touch
    , onTouchCancel'
    , onTouchEnd'
    , onTouchMove'
    , onTouchStart'
      -- * UI
    , onScroll'
      -- * Wheel
    , onWheel'
      -- * Image
    , onLoad'
    , onError'
    ) where

import qualified React.Flux               as RF
import           React.Flux.Event.Foreign (js_event_persist)
import           System.IO.Unsafe         (unsafePerformIO)

-- | Wrapper for event.persist() in React.
unsafeWithPersist :: (RF.Event -> handler) -> RF.Event -> handler
unsafeWithPersist handler event = unsafePerformIO $ do
    js_event_persist $ RF.evtHandlerArg event
    return $ handler event

on' :: String -> (RF.Event -> handler) -> RF.PropertyOrHandler handler
on' event handler = RF.on event $ unsafeWithPersist handler

onKeyDown' :: (RF.Event -> RF.KeyboardEvent -> handler) -> RF.PropertyOrHandler handler
onKeyDown' = RF.onKeyDown . unsafeWithPersist

onKeyPress' :: (RF.Event -> RF.KeyboardEvent -> handler) -> RF.PropertyOrHandler handler
onKeyPress' = RF.onKeyPress . unsafeWithPersist

onKeyUp' :: (RF.Event -> RF.KeyboardEvent -> handler) -> RF.PropertyOrHandler handler
onKeyUp' = RF.onKeyUp . unsafeWithPersist

onBlur' :: (RF.Event -> RF.FocusEvent -> handler) -> RF.PropertyOrHandler handler
onBlur' = RF.onBlur . unsafeWithPersist

onFocus' :: (RF.Event -> RF.FocusEvent -> handler) -> RF.PropertyOrHandler handler
onFocus' = RF.onFocus . unsafeWithPersist

onChange' :: (RF.Event -> handler) -> RF.PropertyOrHandler handler
onChange' = RF.onChange . unsafeWithPersist

onInput' :: (RF.Event -> handler) -> RF.PropertyOrHandler handler
onInput' = RF.onInput . unsafeWithPersist

onSubmit' :: (RF.Event -> handler) -> RF.PropertyOrHandler handler
onSubmit' = RF.onSubmit . unsafeWithPersist

onClick' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onClick' = RF.onClick . unsafeWithPersist

onContextMenu' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onContextMenu' = RF.onContextMenu . unsafeWithPersist

onDoubleClick' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDoubleClick' = RF.onDoubleClick . unsafeWithPersist

onDrag' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDrag' = RF.onDrag . unsafeWithPersist

onDragEnd' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDragEnd' = RF.onDragEnd . unsafeWithPersist

onDragEnter' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDragEnter' = RF.onDragEnter . unsafeWithPersist

onDragExit' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDragExit' = RF.onDragExit . unsafeWithPersist

onDragLeave' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDragLeave' = RF.onDragLeave . unsafeWithPersist

onDragOver' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDragOver' = RF.onDragOver . unsafeWithPersist

onDragStart' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDragStart' = RF.onDragStart . unsafeWithPersist

onDrop' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onDrop' = RF.onDrop . unsafeWithPersist

onMouseDown' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onMouseDown' = RF.onMouseDown . unsafeWithPersist

onMouseEnter' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onMouseEnter' = RF.onMouseEnter . unsafeWithPersist

onMouseLeave' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onMouseLeave' = RF.onMouseLeave . unsafeWithPersist

onMouseMove' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onMouseMove' = RF.onMouseMove . unsafeWithPersist

onMouseOut' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onMouseOut' = RF.onMouseOut . unsafeWithPersist

onMouseOver' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onMouseOver' = RF.onMouseOver . unsafeWithPersist

onMouseUp' :: (RF.Event -> RF.MouseEvent -> handler) -> RF.PropertyOrHandler handler
onMouseUp' = RF.onMouseUp . unsafeWithPersist

onTouchCancel' :: (RF.Event -> RF.TouchEvent -> handler) -> RF.PropertyOrHandler handler
onTouchCancel' = RF.onTouchCancel . unsafeWithPersist

onTouchEnd' :: (RF.Event -> RF.TouchEvent -> handler) -> RF.PropertyOrHandler handler
onTouchEnd' = RF.onTouchEnd . unsafeWithPersist

onTouchMove' :: (RF.Event -> RF.TouchEvent -> handler) -> RF.PropertyOrHandler handler
onTouchMove' = RF.onTouchMove . unsafeWithPersist

onTouchStart' :: (RF.Event -> RF.TouchEvent -> handler) -> RF.PropertyOrHandler handler
onTouchStart' = RF.onTouchStart . unsafeWithPersist

onScroll' :: (RF.Event -> handler) -> RF.PropertyOrHandler handler
onScroll' = RF.onScroll . unsafeWithPersist

onWheel' :: (RF.Event -> RF.MouseEvent -> RF.WheelEvent -> handler) -> RF.PropertyOrHandler handler
onWheel' = RF.onWheel . unsafeWithPersist

onLoad' :: (RF.Event -> handler) -> RF.PropertyOrHandler handler
onLoad' = RF.onLoad . unsafeWithPersist

onError' :: (RF.Event -> handler) -> RF.PropertyOrHandler handler
onError' = RF.onError . unsafeWithPersist
