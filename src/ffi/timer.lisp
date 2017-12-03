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

(defsdl2fun ("SDL_GetTicks" sdl-get-ticks) :uint32)

(defsdl2-lispfun sdl-ticks-passed (a b)
  (if (<= (- b a) 0)
      1
      0))

(defsdl2fun ("SDL_GetPerformanceCounter" sdl-get-performance-counter) :uint64)

(defsdl2fun ("SDL_GetPerformanceFrequency" sdl-get-performance-frequency) :uint64)

(defsdl2fun ("SDL_Delay" sdl-delay) :void
  (ms :uint32))

(defsdl2type sdl-timer-callback :pointer)

(defsdl2type sdl-timer-id :int)

(defsdl2fun ("SDL_AddTimer" sdl-add-timer) sdl-timer-id
  (interval :uint32)
  (callback sdl-timer-callback)
  (param :pointer))

(defsdl2fun ("SDL_RemoveTimer" sdl-remove-timer) sdl-bool
  (id sdl-timer-id))
