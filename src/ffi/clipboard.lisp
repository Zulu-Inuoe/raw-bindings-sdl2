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

(defsdl2fun ("SDL_GetClipboardText" sdl-get-clipboard-text) sdl-temp-string)

(defsdl2fun ("SDL_HasClipboardText" sdl-has-clipboard-text) sdl-bool)

(defsdl2fun ("SDL_SetClipboardText" sdl-set-clipboard-text) :int
  (text (:string :encoding :utf-8)))
