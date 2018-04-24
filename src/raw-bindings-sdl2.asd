;;;raw-bindings-sdl2 - FFI bindings to SDL2
;;;Written in 2017 by Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>
;;;
;;;To the extent possible under law, the author(s) have dedicated all copyright
;;;and related and neighboring rights to this software to the public domain
;;;worldwide. This software is distributed without any warranty.
;;;You should have received a copy of the CC0 Public Domain Dedication along
;;;with this software. If not, see
;;;<http://creativecommons.org/publicdomain/zero/1.0/>.

(defsystem #:raw-bindings-sdl2
  :name "raw-bindings-sdl2"
  :description "Bindings and minor utilities for SDL2"
  :author "Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>"
  :license "CC0 <http://creativecommons.org/publicdomain/zero/1.0/>"
  :serial t
  :components
  ((:file "package")
   (:file "macros")
   (:file "library")

   (:file "sdl-temp-string")
   (:module "ffi"
    :components
    ((:file "stdinc")

     (:file "blendmode")
     (:file "clipboard")
     (:file "cpuinfo")
     (:file "error")
     (:file "filesystem")
     (:file "hints")
     (:file "joystick")
     (:file "loadso")
     (:file "log")
     (:file "main")
     (:file "pixels")
     (:file "power")
     (:file "rect")
     (:file "rwops")
     (:file "scancode")
     (:file "timer")
     (:file "touch")
     (:file "version")

     (:file "audio")
     (:file "gamecontroller")
     (:file "haptic")
     (:file "keycode")
     (:file "surface")

     (:file "gesture")
     (:file "video")

     (:file "messagebox")
     (:file "mouse")
     (:file "keyboard")
     (:file "render")
     (:file "shape")
     (:file "syswm")

     (:file "events")

     (:file "quit")

     (:file "sdl"))))
  :depends-on
  (#:cffi
   #:defpackage-plus
   #+os-windows
   #:win32))
