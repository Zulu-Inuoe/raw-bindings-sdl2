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

(defsdl2struct sdl-point
  (x :int)
  (y :int))

(defsdl2struct sdl-rect
  (x :int)
  (y :int)
  (w :int)
  (h :int))

(defsdl2-lispfun sdl-point-in-rect (p r)
  (symbol-macrolet ((px (cffi:foreign-slot-value p 'sdl-point 'x))
                    (py (cffi:foreign-slot-value p 'sdl-point 'y))
                    (rx (cffi:foreign-slot-value r 'sdl-rect 'x))
                    (ry (cffi:foreign-slot-value r 'sdl-rect 'y))
                    (rw (cffi:foreign-slot-value r 'sdl-rect 'w))
                    (rh (cffi:foreign-slot-value r 'sdl-rect 'h)))
    (if (and (and (>= px rx) (< px (+ rx rw)))
             (and (>= py ry) (< py (+ ry rh))))
        +sdl-true+
        +sdl-false+)))

(defsdl2-lispfun sdl-rect-empty (r)
  (if (or (cffi:null-pointer-p r)
          (cffi:with-foreign-slots ((w h) r sdl-rect)
            (or (<= w 0) (<= h 0))))
      +sdl-true+
      +sdl-false+))

(defsdl2fun ("SDL_HasIntersection" sdl-has-intersection) sdl-bool
  (a (:pointer sdl-rect))
  (b (:pointer sdl-rect)))

(defsdl2fun ("SDL_IntersectRect" sdl-intersect-rect) sdl-bool
  (a (:pointer sdl-rect))
  (b (:pointer sdl-rect))
  (result (:pointer sdl-rect)))

(defsdl2fun ("SDL_UnionRect" sdl-union-rect) :void
  (a (:pointer sdl-rect))
  (b (:pointer sdl-rect))
  (result (:pointer sdl-rect)))

(defsdl2fun ("SDL_EnclosePoints" sdl-enclose-points) sdl-bool
  (points (:pointer sdl-point))
  (count :int)
  (clip (:pointer sdl-rect))
  (result (:pointer sdl-rect)))

(defsdl2fun ("SDL_IntersectRectAndLine" sdl-intersect-rect-and-line) sdl-bool
  (rect (:pointer sdl-rect))
  (x1 (:pointer :int))
  (y1 (:pointer :int))
  (x2 (:pointer :int))
  (y2 (:pointer :int)))
