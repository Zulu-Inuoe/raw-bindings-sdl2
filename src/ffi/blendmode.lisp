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

(defsdl2enum sdl-blend-mode
  (+sdl-blendmode-none+ #x00000000)
  (+sdl-blendmode-blend+ #x00000001)
  (+sdl-blendmode-add+ #x00000002)
  (+sdl-blendmode-mod+ #x00000004)
  (+sdl-blendmode-invalid+ #x7FFFFFFF))

(defsdl2enum sdl-blend-operation
  (+sdl-blendoperation-add+ #x01)
  (+sdl-blendoperation-subtract+ #x02)
  (+sdl-blendoperation-rev-substract+ #x03)
  (+sdl-blendoperation-minimum+ #x04)
  (+sdl-blendoperation-maximum+ #x05))

(defsdl2enum sdl-blend-factor
  (+sdl-blendfactor-zero+ #x01)
  (+sdl-blendfactor-one+ #x02)
  (+sdl-blendfactor-src-color+ #x03)
  (+sdl-blendfactor-one-minus-src-color+ #x04)
  (+sdl-blendfactor-src-alpha+ #x05)
  (+sdl-blendfactor-one-minus-src-alpha+ #x06)
  (+sdl-blendfactor-dst-color+ #x07)
  (+sdl-blendfactor-one-minus-dst-color+ #x08)
  (+sdl-blendfactor-dst-alpha+ #x09)
  (+sdl-blendfactor-one-minus-dst-alpha+ #x0A))

(defsdl2fun ("SDL_ComposeCustomBlendMode" sdl-compose-custom-blend-mode) sdl-blend-mode
  (src-color-factor sdl-blend-factor)
  (dst-color-factor sdl-blend-factor)
  (color-operation sdl-blend-operation)
  (src-alpha-factor sdl-blend-factor)
  (dst-alpha-factor sdl-blend-factor)
  (alpha-operation sdl-blend-operation))
