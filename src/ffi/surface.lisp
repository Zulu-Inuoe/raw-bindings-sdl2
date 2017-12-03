;;;raw-bindings-sdl2 - FFI bindings to SDL2
;;;Written in 2017 by Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>
;;;
;;;To the extent possible under law, the author(s) have dedicated all copyright
;;;and related and neighboring rights to this software to the public domain
;;;worldwide. This software is distributed without any warranty.
;;;You should have received a copy of the CC0 Public Domain Dedication along
;;;with this software. If not, see
;;;<http://creativecommons.org/publicdomain/zero/1.0/>.

(In-package #:raw-bindings-sdl2)

(defsdl2constant +sdl-swsurface+ 0)
(defsdl2constant +sdl-prealloc+ #x00000001)
(defsdl2constant +sdl-rleaccel+ #x00000002)
(defsdl2constant +sdl-dontfree+ #x00000004)

(defsdl2struct sdl-blit-map)

(defsdl2struct sdl-surface
  (flags :uint32)
  (format (:pointer sdl-pixel-format))
  (w :int)
  (h :int)
  (pitch :int)
  (pixels :pointer)
  (userdata :pointer)
  (locked :int)
  (lock-data :pointer)
  (clip-rect sdl-rect)
  (map (:pointer sdl-blit-map))
  (refcount :int))

(defsdl2fun ("SDL_UpperBlitScaled" sdl-upper-blit-scaled) :int
  (src (:pointer sdl-surface))
  (src-rect (:pointer sdl-rect))
  (dst (:pointer sdl-surface))
  (dst-rect (:pointer sdl-rect)))

(defsdl2-lispfun sdl-blit-scaled (src src-rect dst dst-rect)
  (sdl-upper-blit-scaled src src-rect dst dst-rect))

(defsdl2fun ("SDL_UpperBlit" sdl-upper-blit) :int
  (src (:pointer sdl-surface))
  (src-rect (:pointer sdl-rect))
  (dst (:pointer sdl-surface))
  (dst-rect (:pointer sdl-rect)))

(defsdl2-lispfun sdl-blit-surface (src src-rect dst dst-rect)
  (sdl-upper-blit src src-rect dst dst-rect))

(defsdl2fun ("SDL_ConvertPixels" sdl-convert-pixels) :int
  (width :int)
  (height :int)
  (src-format :uint32)
  (src :pointer)
  (src-pitch :int)
  (dst-format :uint32)
  (dst :pointer)
  (dst-pitch :int))

(defsdl2fun ("SDL_ConvertSurface" sdl-convert-surface) (:pointer sdl-surface)
  (src (:pointer sdl-surface))
  (fmt (:pointer sdl-pixel-format))
  (flags :uint32))

(defsdl2fun ("SDL_ConvertSurfaceFormat" sdl-convert-surface-format) (:pointer sdl-surface)
  (src (:pointer sdl-surface))
  (pixel-format :uint32)
  (flags :uint32))

(defsdl2fun ("SDL_CreateRGBSurface" sdl-create-rgb-surface) (:pointer sdl-surface)
  (flags :uint32)
  (width :int)
  (height :int)
  (depth :int)
  (rmask :uint32)
  (gmask :uint32)
  (bmask :uint32)
  (amask :uint32))

(defsdl2fun ("SDL_CreateRGBSurfaceFrom" sdl-create-rgb-surface-from) (:pointer sdl-surface)
  (pixels :pointer)
  (width :int)
  (height :int)
  (depth :int)
  (pitch :int)
  (rmask :uint32)
  (gmask :uint32)
  (bmask :uint32)
  (amask :uint32))

(defsdl2fun ("SDL_CreateRGBSurfaceWithFormat" sdl-create-rgb-surface-with-format) (:pointer sdl-surface)
  (flags :uint32)
  (width :int)
  (height :int)
  (depth :int)
  (format :uint32))

(defsdl2fun ("SDL_CreateRGBSurfaceWithFormatFrom" sdl-create-rgb-surface-with-format-from) (:pointer sdl-surface)
  (pixels :pointer)
  (width :int)
  (height :int)
  (depth :int)
  (pitch :int)
  (format :uint32))

(defsdl2fun ("SDL_FillRect" sdl-fill-rect) :int
  (dst (:pointer sdl-surface))
  (rect (:pointer sdl-rect))
  (color :uint32))

(defsdl2fun ("SDL_FillRects" sdl-fill-rects) :int
  (dst (:pointer sdl-surface))
  (rects (:pointer sdl-rect))
  (count :int)
  (color :uint32))

(defsdl2fun ("SDL_FreeSurface" sdl-free-surface) :void
  (surface (:pointer sdl-surface)))

(defsdl2fun ("SDL_GetClipRect" sdl-get-clip-rect) :void
  (surface (:pointer sdl-surface))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_GetColorKey" sdl-get-color-key) :int
  (surface (:pointer sdl-surface))
  (key (:pointer :uint32)))

(defsdl2fun ("SDL_GetSurfaceAlphaMod" sdl-get-surface-alpha-mod) :int
  (surface (:pointer sdl-surface))
  (alpha (:pointer :uint8)))

(defsdl2fun ("SDL_GetSurfaceBlendMode" sdl-get-surface-blend-mode) :int
  (surface (:pointer sdl-surface))
  (blend-mode (:pointer sdl-blend-mode)))

(defsdl2fun ("SDL_GetSurfaceColorMod" sdl-get-surface-color-mod) :int
  (surface (:pointer sdl-surface))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8)))

(defsdl2fun ("SDL_LoadBMP_RW" sdl-load-bmp-rw) (:pointer sdl-surface)
  (src (:pointer sdl-rwops))
  (freesrc :int))

(defsdl2-lispfun sdl-load-bmp (file)
  (sdl-load-bmp-rw (sdl-rw-from-file file "rb") 1))

(defsdl2fun ("SDL_LockSurface" sdl-lock-surface) :int
  (surface (:pointer sdl-surface)))

(defsdl2fun ("SDL_LowerBlit" sdl-lower-blit) :int
  (src (:pointer sdl-surface))
  (src-rect (:pointer sdl-rect))
  (dst (:pointer sdl-surface))
  (dst-rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_LowerBlitScaled" sdl-lower-blit-scaled) :int
  (src (:pointer sdl-surface))
  (src-rect (:pointer sdl-rect))
  (dst (:pointer sdl-surface))
  (dst-rect (:pointer sdl-rect)))

(defsdl2-lispfun sdl-must-lock (surface)
  (if (zerop (logand (foreign-slot-value surface 'sdl-surface 'flags)
                     +sdl-rleaccel+))
      0
      1))

(defsdl2fun ("SDL_SaveBMP_RW" sdl-save-bmp-rw) :int
  (surface (:pointer sdl-surface))
  (dst (:pointer sdl-rwops))
  (freedst :int))

(defsdl2-lispfun sdl-save-bmp (surface file)
  (sdl-save-bmp-rw surface (sdl-rw-from-file file "wb") 1))

(defsdl2fun ("SDL_SetClipRect" sdl-set-clip-rect) sdl-bool
  (surface (:pointer sdl-surface))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_SetColorKey" sdl-set-color-key) :int
  (surface (:pointer sdl-surface))
  (flag :int)
  (key :uint32))

(defsdl2fun ("SDL_SetSurfaceAlphaMod" sdl-set-surface-alpha-mod) :int
  (surface (:pointer sdl-surface))
  (alpha :uint8))

(defsdl2fun ("SDL_SetSurfaceBlendMode" sdl-set-surface-blend-mode) :int
  (surface (:pointer sdl-surface))
  (blend-mode sdl-blend-mode))

(defsdl2fun ("SDL_SetSurfaceColorMod" sdl-set-surface-color-mod) :int
  (surface (:pointer sdl-surface))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(defsdl2fun ("SDL_SetSurfacePalette" sdl-set-surface-palette) :int
  (surface (:pointer sdl-surface))
  (palette (:pointer sdl-palette)))

(defsdl2fun ("SDL_SetSurfaceRLE" sdl-set-surface-rle) :int
  (surface (:pointer sdl-surface))
  (flag :int))

(defsdl2fun ("SDL_UnlockSurface" sdl-unlock-surface) :void
  (surface (:pointer sdl-surface)))
