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

(defsdl2struct sdl-rwops)

(defsdl2fun ("SDL_AllocRW" sdl-alloc-rw) (:pointer sdl-rwops))

(defsdl2fun ("SDL_FreeRW" sdl-free-rw) :void
  (area (:pointer sdl-rwops)))

(defsdl2fun ("SDL_RWFromConstMem" sdl-rw-from-const-mem) (:pointer sdl-rwops)
  (mem :pointer)
  (size :int))

(defsdl2fun ("SDL_RWFromFP" sdl-rw-from-fp) (:pointer sdl-rwops)
  (fp :pointer)
  (autoclose sdl-bool))

(defsdl2fun ("SDL_RWFromFile" sdl-rw-from-file) (:pointer sdl-rwops)
  (file (:string :encoding :utf-8))
  (mode (:string :encoding :utf-8)))


(defsdl2fun ("SDL_RWFromMem" sdl-rw-from-mem) (:pointer sdl-rwops)
  (mem :pointer)
  (size :int))
