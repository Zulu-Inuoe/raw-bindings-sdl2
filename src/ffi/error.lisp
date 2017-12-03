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

(defsdl2fun ("SDL_SetError" sdl-set-error) :int
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_GetError" sdl-get-error) (:string :encoding :utf-8))

(defsdl2fun ("SDL_ClearError" sdl-clear-error) :void)

(defsdl2enum sdl-errorcode
  +sdl-enomem+
  +sdl-efread+
  +sdl-efwrite+
  +sdl-efseek+
  +sdl-unsupported+
  +sdl-lasterror+)

(defsdl2fun ("SDL_Error" sdl-error) :int
  (code sdl-errorcode))

(defsdl2-lispfun sdl-out-of-memory ()
  (sdl-error +sdl-enomem+))

(defsdl2-lispfun sdl-unsupported ()
  (sdl-error +sdl-unsupported+))

(defsdl2-lispfun sdl-invalid-param-error (param)
  (sdl-set-error "Parameter '%s' is invalid" (:string :encoding :utf-8) param))
