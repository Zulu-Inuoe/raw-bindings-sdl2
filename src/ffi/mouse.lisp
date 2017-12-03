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

(defsdl2enum sdl-system-cursor
  +sdl-system-cursor-arrow+
  +sdl-system-cursor-ibeam+
  +sdl-system-cursor-wait+
  +sdl-system-cursor-crosshair+
  +sdl-system-cursor-waitarrow+
  +sdl-system-cursor-sizenwse+
  +sdl-system-cursor-sizenesw+
  +sdl-system-cursor-sizewe+
  +sdl-system-cursor-sizens+
  +sdl-system-cursor-sizeall+
  +sdl-system-cursor-no+
  +sdl-system-cursor-hand+)

(defsdl2enum sdl-mouse-wheel-direction
  +sdl-mousewheel-normal+
  +sdl-mousewheel-flipped+)

(defsdl2-lispfun sdl-button (x)
  (ash 1 (1- x)))

(defsdl2constant +sdl-button-left+ 1)
(defsdl2constant +sdl-button-middle+ 2)
(defsdl2constant +sdl-button-right+ 3)
(defsdl2constant +sdl-button-x1+ 4)
(defsdl2constant +sdl-button-x2+ 5)
(defsdl2constant +sdl-button-lmask+ (sdl-button +sdl-button-left+))
(defsdl2constant +sdl-button-mmask+ (sdl-button +sdl-button-middle+))
(defsdl2constant +sdl-button-rmask+ (sdl-button +sdl-button-right+))
(defsdl2constant +sdl-button-x1mask+ (sdl-button +sdl-button-x1+))
(defsdl2constant +sdl-button-x2mask+ (sdl-button +sdl-button-x2+))

(defsdl2struct sdl-cursor)

(defsdl2fun ("SDL_CaptureMouse" sdl-capture-mouse) :int
  (enabled sdl-bool))

(defsdl2fun ("SDL_CreateColorCursor" sdl-create-color-cursor) (:pointer sdl-cursor)
  (surface (:pointer sdl-surface))
  (hot-x :int)
  (hot-y :int))

(defsdl2fun ("SDL_CreateCursor" sdl-create-cursor) (:pointer sdl-cursor)
  (data (:pointer :uint8))
  (mask (:pointer :uint8))
  (w :int)
  (h :int)
  (hot-x :int)
  (hot-y :int))

(defsdl2fun ("SDL_CreateSystemCursor" sdl-create-system-cursor) (:pointer sdl-cursor)
  (id sdl-system-cursor))

(defsdl2fun ("SDL_FreeCursor" sdl-free-cursor) :void
  (cursor (:pointer sdl-cursor)))

(defsdl2fun ("SDL_GetCursor" sdl-get-cursor) (:pointer sdl-cursor))

(defsdl2fun ("SDL_GetDefaultCursor" sdl-get-default-cursor) (:pointer sdl-cursor))

(defsdl2fun ("SDL_GetGlobalMouseState" sdl-get-global-mouse-state) :uint32
  (x (:pointer :int))
  (y (:pointer :int)))

(defsdl2fun ("SDL_GetMouseFocus" sdl-get-mouse-focus) (:pointer sdl-window))

(defsdl2fun ("SDL_GetMouseState" sdl-get-mouse-state) :uint32
  (x (:pointer :int))
  (y (:pointer :int)))

(defsdl2fun ("SDL_GetRelativeMouseMode" sdl-get-relative-mouse-mode) sdl-bool)

(defsdl2fun ("SDL_GetRelativeMouseState" sdl-get-relative-mouse-state) :uint32
  (x (:pointer :int))
  (y (:pointer :int)))

(defsdl2fun ("SDL_SetCursor" sdl-set-cursor) :void
  (cursor (:pointer sdl-cursor)))

(defsdl2fun ("SDL_SetRelativeMouseMode" sdl-set-relative-mouse-mode) :int
  (enabled sdl-bool))

(defsdl2fun ("SDL_ShowCursor" sdl-show-cursor) :int
  (toggle :int))

(defsdl2fun ("SDL_WarpMouseGlobal" sdl-warp-mouse-global) :int
  (x :int)
  (y :int))

(defsdl2fun ("SDL_WarpMouseInWindow" sdl-warp-mouse-in-window) :int
  (window (:pointer sdl-window))
  (x :int)
  (y :int))
