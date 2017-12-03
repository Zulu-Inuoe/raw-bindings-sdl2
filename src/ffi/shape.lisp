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

(defsdl2constant +sdl-nonshapeable-window+ -1)
(defsdl2constant +sdl-invalid-shape-argument+ -2)
(defsdl2constant +sdl-window-lacks-shape+ -3)

(defsdl2fun ("SDL_CreateShapedWindow" sdl-create-shaped-window) (:pointer sdl-window)
  (title (:string :encoding :utf-8))
  (x :uint)
  (y :uint)
  (w :uint)
  (h :uint)
  (flags :uint32))

(defsdl2fun ("SDL_IsShapedWindow" sdl-is-shaped-window) sdl-bool
  (window (:pointer sdl-window)))

(defsdl2enum window-shape-mode
  +shape-mode-default+
  +shape-mode-binarize-alpha+
  +shape-mode-reverse-binarize-alpha+
  +shape-mode-color-key+)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defsdl2-lispfun sdl-shapemodealpha (mode)
    (if (or (= mode +shape-mode-default+)
            (= mode +shape-mode-binarize-alpha+)
            (= mode +shape-mode-reverse-binarize-alpha+))
        1
        0)))

(defsdl2union sdl-window-shape-params
  (binarization-cutoff :uint8)
  (color-key sdl-color))

(defsdl2union sdl-window-shape-mode
  (mode window-shape-mode)
  (parameters sdl-window-shape-params))

(defsdl2fun ("SDL_SetWindowShape" sdl-set-window-shape) :int
  (window (:pointer sdl-window))
  (shape (:pointer sdl-surface))
  (shape-mode (:pointer sdl-window-shape-mode)))

(defsdl2fun ("SDL_GetShapedWindowMode" sdl-get-shaped-window-mode) :int
  (window (:pointer sdl-window))
  (shape-mode (:pointer sdl-window-shape-mode)))
