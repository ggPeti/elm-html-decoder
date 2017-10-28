module Html.Decoder exposing
        ( MouseEvent
        , mouseEvent
        , WheelEvent
        , wheelEvent
        , dom_delta_pixel
        , dom_delta_line
        , dom_delta_page
        , KeyboardEvent
        , keyboardEvent
        , dom_key_location_standard
        , dom_key_location_left
        , dom_key_location_right
        , dom_key_location_numpad
        , CompositionEvent
        , compositionEvent
        , Gamepad
        , gamepad
        , GamepadButton
        , gamepadButton
        , GamepadEvent
        , gamepadEvent
        , AnimationEvent
        , animationEvent
        , DeviceMotionEvent
        , deviceMotionEvent
        , DeviceOrientationEvent
        , deviceOrientationEvent
        , DeviceAcceleration
        , deviceAcceleration
        , DeviceRotationRate
        , deviceRotationRate
        )

{-| NOTE: This is a port of the original package by TheSeamau5 from 0.15 to 0.18.
Elm has, in the meantime, made it a requirement to document all exposed values and types.
I do not have the time to do that right now, therefore the filler comments.
Original documentation below.
List of Decoders made to capture DOM events. The types match their
equivalent DOM interfaces.


# Mouse Events

@docs MouseEvent, mouseEvent


# Wheel Events

@docs WheelEvent, wheelEvent, dom_delta_pixel, dom_delta_line, dom_delta_page


# Keyboard Events

@docs KeyboardEvent, keyboardEvent, dom_key_location_standard, dom_key_location_left, dom_key_location_right, dom_key_location_right, dom_key_location_numpad


# Composition Events

@docs CompositionEvent, compositionEvent


# Gamepad Events

@docs GamepadEvent, gamepadEvent, Gamepad, gamepad, GamepadButton, gamepadButton


# Animation Events

@docs AnimationEvent, animationEvent


# Device Motion / Orientation Events

@docs DeviceMotionEvent, deviceMotionEvent, DeviceOrientationEvent, deviceOrientationEvent, DeviceAcceleration, deviceAcceleration, DeviceRotationRate, deviceRotationRate

-}

import Json.Decode exposing (Decoder, map, int, bool, float, string, list)
import Json.Decode.Extra exposing ((|:))
import Json.Helpers exposing ((:=))


-----------------
-- Mouse Event --
-----------------

{-| TODO: doc
-}
type alias MouseEvent =
    { screenX : Int
    , screenY : Int
    , clientX : Int
    , clientY : Int
    , ctrlKey : Bool
    , shiftKey : Bool
    , altKey : Bool
    , metaKey : Bool
    , button : Int
    }


{-| TODO: doc
-}
mouseEvent : Decoder MouseEvent
mouseEvent =
    Json.Decode.succeed MouseEvent
        |: ("screenX" := int)
        |: ("screenY" := int)
        |: ("clientX" := int)
        |: ("clientY" := int)
        |: ("ctrlKey" := bool)
        |: ("shiftKey" := bool)
        |: ("altKey" := bool)
        |: ("metaKey" := bool)
        |: ("button" := int)



-----------------
-- Wheel Event --
-----------------


{-| TODO: doc
-}
type alias WheelEvent =
    { screenX : Int
    , screenY : Int
    , clientX : Int
    , clientY : Int
    , ctrlKey : Bool
    , shiftKey : Bool
    , altKey : Bool
    , metaKey : Bool
    , button : Int
    , deltaX : Float
    , deltaY : Float
    , deltaZ : Float
    , deltaMode : Int
    }


{-| TODO: doc
-}
wheelEvent : Decoder WheelEvent
wheelEvent =
    Json.Decode.succeed WheelEvent
        |: ("screenX" := int)
        |: ("screenY" := int)
        |: ("clientX" := int)
        |: ("clientY" := int)
        |: ("ctrlKey" := bool)
        |: ("shiftKey" := bool)
        |: ("altKey" := bool)
        |: ("metaKey" := bool)
        |: ("button" := int)
        |: ("deltaX" := float)
        |: ("deltaY" := float)
        |: ("deltaZ" := float)
        |: ("deltaMode" := int)



-- Delta Mode Code

{-| TODO: doc
-}
dom_delta_pixel : Int
dom_delta_pixel =
    0

{-| TODO: doc
-}
dom_delta_line : Int
dom_delta_line =
    1

{-| TODO: doc
-}
dom_delta_page : Int
dom_delta_page =
    2



--------------------
-- Keyboard Event --
--------------------

{-| TODO: doc
-}
type alias KeyboardEvent =
    { key : String
    , code : String
    , location : Int
    , ctrlKey : Bool
    , shiftKey : Bool
    , altKey : Bool
    , metaKey : Bool
    , repeat : Bool
    , isComposing : Bool
    }

{-| TODO: doc
-}
keyboardEvent : Decoder KeyboardEvent
keyboardEvent =
    Json.Decode.succeed KeyboardEvent
        |: ("key" := string)
        |: ("code" := string)
        |: ("location" := int)
        |: ("ctrlKey" := bool)
        |: ("shiftKey" := bool)
        |: ("altKey" := bool)
        |: ("metaKey" := bool)
        |: ("repeat" := bool)
        |: ("isComposing" := bool)



-- Key location code

{-| TODO: doc
-}
dom_key_location_standard : Int
dom_key_location_standard =
    0

{-| TODO: doc
-}
dom_key_location_left : Int
dom_key_location_left =
    1

{-| TODO: doc
-}
dom_key_location_right : Int
dom_key_location_right =
    2

{-| TODO: doc
-}
dom_key_location_numpad : Int
dom_key_location_numpad =
    3



-- Composition Event

{-| TODO: doc
-}
type alias CompositionEvent =
    { data : String }

{-| TODO: doc
-}
compositionEvent : Decoder CompositionEvent
compositionEvent =
    Json.Decode.succeed CompositionEvent
        |: ("data" := string)



-----------------
-- Touch Event --
-----------------
-- TODO: Figure out getter problem for touch lists
{- }
   type alias Touch =
     { identifier  : Int
     , screenX     : Int
     , screenY     : Int
     , clientX     : Int
     , clientY     : Int
     , pageX       : Int
     , pageY       : Int
     }

   touch : Decoder Touch
   touch =
     Touch
       |:    "identifier" := int
       |: ("screenX"    := int)
       |: ("screenY"    := int)
       |: ("clientX"    := int)
       |: ("clientY"    := int)
       |: ("pageX"      := int)
       |: ("pageY"      := int)


   type alias TouchEvent =
     { touches         : List Touch
     , targetTouches   : List Touch
     , changedTouches  : List Touch
     , altKey    : Bool
     , metaKey   : Bool
     , ctrlKey   : Bool
     , shiftKey  : Bool
     }


   touchEvent : Decoder TouchEvent
   touchEvent =
     TouchEvent
       |: ("touches"        := list touch)
       |: ("targetTouches"  := list touch)
       |: ("changedTouches" := list touch)
       |: ("altKey"         := bool)
       |: ("metaKey"        := bool)
       |: ("ctrlKey"        := bool)
       |: ("shiftKey"       := bool)
-}
-------------------
-- Gamepad Event --
-------------------

{-| TODO: doc
-}
type alias Gamepad =
    { id : String
    , index : Int
    , connected : Bool
    , timestamp : Float
    , mapping : String
    , axes : List Float
    , buttons : List GamepadButton
    }

{-| TODO: doc
-}
gamepad : Decoder Gamepad
gamepad =
    Json.Decode.succeed Gamepad
        |: ("id" := string)
        |: ("index" := int)
        |: ("connected" := bool)
        |: ("timestamp" := float)
        |: ("mapping" := string)
        |: ("axes" := list float)
        |: ("buttons" := list gamepadButton)

{-| TODO: doc
-}
type alias GamepadButton =
    { pressed : Bool
    , value : Float
    }

{-| TODO: doc
-}
gamepadButton : Decoder GamepadButton
gamepadButton =
    Json.Decode.succeed GamepadButton
        |: ("pressed" := bool)
        |: ("value" := float)

{-| TODO: doc
-}
type alias GamepadEvent =
    { gamepad : Gamepad }

{-| TODO: doc
-}
gamepadEvent : Decoder GamepadEvent
gamepadEvent =
    Json.Decode.succeed GamepadEvent
        |: ("gamepad" := gamepad)



---------------------
-- Animation Event --
---------------------

{-| TODO: doc
-}
type alias AnimationEvent =
    { animationName : String
    , elapsedTime : Float
    , pseudoElement : String
    }

{-| TODO: doc
-}
animationEvent : Decoder AnimationEvent
animationEvent =
    Json.Decode.succeed AnimationEvent
        |: ("animationName" := string)
        |: ("elapsedTime" := float)
        |: ("pseudoElement" := string)



-------------------------
-- Device Motion Event --
-------------------------

{-| TODO: doc
-}
type alias DeviceMotionEvent =
    { acceleration : DeviceAcceleration
    , accelerationIncludingGravity : DeviceAcceleration
    , rotationRate : DeviceRotationRate
    , interval : Float
    }

{-| TODO: doc
-}
deviceMotionEvent : Decoder DeviceMotionEvent
deviceMotionEvent =
    Json.Decode.succeed DeviceMotionEvent
        |: ("acceleration" := deviceAcceleration)
        |: ("accelerationIncludingGravity" := deviceAcceleration)
        |: ("rotationRate" := deviceRotationRate)
        |: ("interval" := float)

{-| TODO: doc
-}
type alias DeviceOrientationEvent =
    { alpha : Float
    , beta : Float
    , gamma : Float
    , absolute : Bool
    }

{-| TODO: doc
-}
deviceOrientationEvent : Decoder DeviceOrientationEvent
deviceOrientationEvent =
    Json.Decode.succeed DeviceOrientationEvent
        |: ("alpha" := float)
        |: ("beta" := float)
        |: ("gamma" := float)
        |: ("absolute" := bool)

{-| TODO: doc
-}
type alias DeviceAcceleration =
    { x : Float
    , y : Float
    , z : Float
    }

{-| TODO: doc
-}
deviceAcceleration : Decoder DeviceAcceleration
deviceAcceleration =
    Json.Decode.succeed DeviceAcceleration
        |: ("x" := float)
        |: ("y" := float)
        |: ("z" := float)

{-| TODO: doc
-}
type alias DeviceRotationRate =
    { alpha : Float
    , beta : Float
    , gamma : Float
    }

{-| TODO: doc
-}
deviceRotationRate : Decoder DeviceRotationRate
deviceRotationRate =
    Json.Decode.succeed DeviceRotationRate
        |: ("alpha" := float)
        |: ("beta" := float)
        |: ("gamma" := float)
