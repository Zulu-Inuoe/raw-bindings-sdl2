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

(defsdl2constant +sdl-init-timer+          #x00000001)
(defsdl2constant +sdl-init-audio+          #x00000010)
(defsdl2constant +sdl-init-video+          #x00000020)
(defsdl2constant +sdl-init-joystick+       #x00000200)
(defsdl2constant +sdl-init-haptic+         #x00001000)
(defsdl2constant +sdl-init-gamecontroller+ #x00002000)
(defsdl2constant +sdl-init-events+         #x00004000)
(defsdl2constant +sdl-init-noparachute+    #x00004000)
(defsdl2constant +sdl-init-everything+
  (logior +sdl-init-timer+
          +sdl-init-audio+
          +sdl-init-video+
          +sdl-init-events+
          +sdl-init-joystick+
          +sdl-init-haptic+
          +sdl-init-gamecontroller+))

(defsdl2fun ("SDL_Init" sdl-init) :int
  (flags :uint32))

(defsdl2fun ("SDL_InitSubSystem" sdl-init-subsystem) :int
  (flags :uint32))

(defsdl2fun ("SDL_QuitSubSystem" sdl-quit-subsystem) :void
  (flags :uint32))

(defsdl2fun ("SDL_WasInit" sdl-was-init) :uint32
  (flags :uint32))

(defsdl2fun ("SDL_Quit" sdl-quit) :void)
