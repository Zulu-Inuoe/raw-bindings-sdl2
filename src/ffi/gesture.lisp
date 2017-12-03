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

(defsdl2type sdl-gesture-id :int64)

(defsdl2fun ("SDL_RecordGesture" sdl-record-gesture) :int
  (touch-id sdl-touch-id))

(defsdl2fun ("SDL_SaveAllDollarTemplates" sdl-save-all-dollar-templates) :int
  (dst (:pointer sdl-rwops)))

(defsdl2fun ("SDL_SaveDollarTemplate" sdl-save-dollar-template) :int
  (gesture-id sdl-gesture-id)
  (dst (:pointer sdl-rwops)))

(defsdl2fun ("SDL_LoadDollarTemplates" sdl-load-dollar-templates) :int
  (touch-id sdl-touch-id)
  (src (:pointer sdl-rwops)))
