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

(defsdl2enum sdl-syswm-type
  +sdl-syswm-unknown+
  +sdl-syswm-windows+
  +sdl-syswm-x11+
  +sdl-syswm-directfb+
  +sdl-syswm-cocoa+
  +sdl-syswm-uikit+
  +sdl-syswm-wayland+
  +sdl-syswm-mir+
  +sdl-syswm-winrt+
  +sdl-syswm-android+
  +sdl-syswm-vivante+
  +sdl-syswm-os2+)

(defsdl2struct sdl-syswm-info)
