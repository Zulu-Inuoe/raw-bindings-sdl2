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

(defsdl2type sdl-touch-id :int64)
(defsdl2type sdl-finger-id :int64)

(defsdl2struct sdl-finger
  (id sdl-finger-id)
  (x :float)
  (y :float)
  (pressure :float))

(defsdl2constant +sdl-touch-mouseid+ #xFFFFFFFF)

(defsdl2fun ("SDL_GetNumTouchDevices" sdl-get-num-touch-devices) :int)

(defsdl2fun ("SDL_GetNumTouchFingers" sdl-get-num-touch-fingers) :int
  (touch-id sdl-touch-id))

(defsdl2fun ("SDL_GetTouchDevice" sdl-get-touch-device) sdl-touch-id
  (index :int))

(defsdl2fun ("SDL_GetTouchFinger" sdl-get-touch-finger) (:pointer sdl-finger)
  (touch-id sdl-touch-id)
  (index :int))
