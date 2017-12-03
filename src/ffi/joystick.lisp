;;;raw-bindings-sdl2 - FFI bindings to SDL2
;;;Written in 2017 by Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>
;;;
;;;To the extent possible under law, the author(s) have dedicated all copyright
;;;and related and neighboring rights to this software to the public domain
;;;worldwide. This software is distributed without any warranty.
;;;You should have received a copy of the CC0 Public Domain Dedication along
;;;with this software. If not, see
;;;<http://creativecommons.org/publicdomain/zero/1.0/>.

(in-package #:raw-bindings-sdl2)

(defsdl2struct sdl-joystick)

(defsdl2struct sdl-joystick-guid
  (data :uint8 :count 16))

(defsdl2type sdl-joystick-id :int32)

(defsdl2enum sdl-joystick-type
  +sdl-joystick-type-unknown+
  +sdl-joystick-type-gamecontroller+
  +sdl-joystick-type-wheel+
  +sdl-joystick-type-arcade-stick+
  +sdl-joystick-type-flight-stick+
  +sdl-joystick-type-dance-pad+
  +sdl-joystick-type-guitar+
  +sdl-joystick-type-drum-kit+
  +sdl-joystick-type-arcade-pad+
  +sdl-joystick-type-throttle+)

(defsdl2enum sdl-joystick-power-level
  (+sdl-joystick-power-unknown+ -1)
  +sdl-joystick-power-empty+
  +sdl-joystick-power-low+
  +sdl-joystick-power-medium+
  +sdl-joystick-power-full+
  +sdl-joystick-power-wired+
  +sdl-joystick-power-max+)

(defsdl2fun ("SDL_NumJoysticks" sdl-num-joysticks) :int)

(defsdl2fun ("SDL_JoystickNameForIndex" sdl-joystick-name-for-index) (:string :encoding :utf-8)
  (device-index :int))

#+fsbv
(defsdl2fun ("SDL_JoystickGetDeviceGUID" sdl-joystick-get-device-guid) sdl-joystick-guid
  (device-index :int))

(defsdl2fun ("SDL_JoystickGetDeviceVendor" sdl-joystick-get-device-vendor) :uint16
  (device-index :int))

(defsdl2fun ("SDL_JoystickGetDeviceProduct" sdl-joystick-get-device-product) :uint16
  (device-index :int))

(defsdl2fun ("SDL_JoystickGetDeviceProductVersion" sdl-joystick-get-device-product-version) :uint16
  (device-index :int))

(defsdl2fun ("SDL_JoystickGetDeviceType" sdl-joystick-get-device-type) sdl-joystick-type
  (device-index :int))

(defsdl2fun ("SDL_JoystickGetDeviceInstanceID" sdl-joystick-get-device-instance-id) sdl-joystick-id
  (device-index :int))

(defsdl2fun ("SDL_JoystickOpen" sdl-joystick-open) (:pointer sdl-joystick)
  (device-index :int))

(defsdl2fun ("SDL_JoystickFromInstanceID"sdl-joystick-from-instance-id) (:pointer sdl-joystick)
  (joyid sdl-joystick-id))

(defsdl2fun ("SDL_JoystickName" sdl-joystick-name) (:string :encoding :utf-8)
  (joystick (:pointer sdl-joystick)))

#+fsbv
(defsdl2fun ("SDL_JoystickGetGUID" sdl-joystick-get-guid) sdl-joystick-guid
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickGetVendor" sdl-joystick-get-vendor) :uint16
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickGetProduct" sdl-joystick-get-product) :uint16
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickGetProductVersion" sdl-joystick-get-product-version) :uint16
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickGetType" sdl-joystick-get-type) sdl-joystick-type
  (joystick (:pointer sdl-joystick)))

#+fsbv
(defsdl2fun ("SDL_JoystickGetGUIDString" sdl-joystick-get-guid-string) :void
  (guid sdl-joystick-guid)
  (psz-guid (:pointer :char))
  (cb-guid :int))

#+fsbv
(defsdl2fun ("SDL_JoystickGetGUIDFromString" sdl-joystick-get-guid-from-string) sdl-joystick-guid
  (pch-guid (:pointer :char)))

(defsdl2fun ("SDL_JoystickGetAttached" sdl-joystick-get-attached) sdl-bool
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickInstanceID" sdl-joystick-instance-id) sdl-joystick-id
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickNumAxes" sdl-joystick-num-axes) :int
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickNumBalls" sdl-joystick-num-balls) :int
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickNumHats" sdl-joystick-num-hats) :int
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickNumButtons" sdl-joystick-num-buttons) :int
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickUpdate" sdl-joystick-update) :void)

(defsdl2fun ("SDL_JoystickEventState" sdl-joystick-event-state) :int
  (state :int))

(defsdl2constant +sdl-joystick-axis-max+ 32767)
(defsdl2constant +sdl-joystick-axis-min+ -32768)

(defsdl2fun ("SDL_JoystickGetAxis" sdl-joystick-get-axis) :int16
  (joystick (:pointer sdl-joystick))
  (axis :int))

(defsdl2fun ("SDL_JoystickGetAxisInitialState" sdl-joystick-get-axis-initial-state) sdl-bool
  (joystick (:pointer sdl-joystick))
  (axis :int)
  (state (:pointer :int16)))

(defsdl2constant +sdl-hat-centered+    #x00)
(defsdl2constant +sdl-hat-up+          #x01)
(defsdl2constant +sdl-hat-right+       #x02)
(defsdl2constant +sdl-hat-down+        #x04)
(defsdl2constant +sdl-hat-left+        #x08)
(defsdl2constant +sdl-hat-rightup+     (logior +sdl-hat-right+ +sdl-hat-up+))
(defsdl2constant +sdl-hat-rightdown+   (logior +sdl-hat-right+ +sdl-hat-down+))
(defsdl2constant +sdl-hat-leftup+      (logior +sdl-hat-left+ +sdl-hat-up+))
(defsdl2constant +sdl-hat-leftdown+    (logior +sdl-hat-left+ +sdl-hat-down+))

(defsdl2fun ("SDL_JoystickGetHat" sdl-joystick-get-hat) :uint8
  (joystick (:pointer sdl-joystick))
  (hat :int))

(defsdl2fun ("SDL_JoystickGetBall" sdl-joystick-get-ball) :int
  (joystick (:pointer sdl-joystick))
  (ball :int)
  (dx (:pointer :int))
  (dy (:pointer :int)))

(defsdl2fun ("SDL_JoystickGetButton" sdl-joystick-get-button) :uint8
  (joystick (:pointer sdl-joystick))
  (button :int))

(defsdl2fun ("SDL_JoystickClose" sdl-joystick-close) :void
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_JoystickCurrentPowerLevel" sdl-joystick-current-power-level) sdl-joystick-power-level
  (joystick (:pointer sdl-joystick)))
