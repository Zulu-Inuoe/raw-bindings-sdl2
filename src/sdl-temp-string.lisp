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

(cffi:define-foreign-type sdl-temp-string-type ()
  ()
  (:documentation
   "Type for certain SDL functions which return a char* string meant to be freed via SDL_free().
Performs translation into a lisp string and immediately SDL_free()s the pointer, when not null.")
  (:actual-type :string)
  (:simple-parser sdl-temp-string))

(defmethod cffi:translate-from-foreign (pointer (type sdl-temp-string-type))
  (if (cffi:null-pointer-p pointer)
      ""
      (prog1 (cffi:foreign-string-to-lisp pointer :encoding :utf-8)
        (sdl-free pointer))))