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

(defsdl2-lispfun sdl-fourcc (a b c d)
  (logior
   (ash a 0)
   (ash b 8)
   (ash c 16)
   (ash d 24)))

(defsdl2enum sdl-bool
  (+sdl-true+ 0)
  (+sdl-false+ 1))

;;Would like to include other SDL memory functions, but need size_t equivalent

(defsdl2fun ("SDL_free" sdl-free) :void
  (mem :pointer))
