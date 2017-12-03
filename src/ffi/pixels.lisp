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

(defsdl2constant +sdl-pixeltype-unknown+ 0)
(defsdl2constant +sdl-pixeltype-index1+ 1)
(defsdl2constant +sdl-pixeltype-index4+ 2)
(defsdl2constant +sdl-pixeltype-index8+ 3)
(defsdl2constant +sdl-pixeltype-packed8+ 4)
(defsdl2constant +sdl-pixeltype-packed16+ 5)
(defsdl2constant +sdl-pixeltype-packed32+ 6)
(defsdl2constant +sdl-pixeltype-arrayu8+ 7)
(defsdl2constant +sdl-pixeltype-arrayu16+ 8)
(defsdl2constant +sdl-pixeltype-arrayu32+ 9)
(defsdl2constant +sdl-pixeltype-arrayf16+ 10)
(defsdl2constant +sdl-pixeltype-arrayf32+ 11)

(defsdl2constant +sdl-bitmaporder-none+ 0)
(defsdl2constant +sdl-bitmaporder-4321+ 1)
(defsdl2constant +sdl-bitmaporder-1234+ 2)

(defsdl2constant +sdl-packedorder-none+ 0)
(defsdl2constant +sdl-packedorder-xrgb+ 1)
(defsdl2constant +sdl-packedorder-rgbx+ 2)
(defsdl2constant +sdl-packedorder-argb+ 3)
(defsdl2constant +sdl-packedorder-rgba+ 4)
(defsdl2constant +sdl-packedorder-xbgr+ 5)
(defsdl2constant +sdl-packedorder-bgrx+ 6)
(defsdl2constant +sdl-packedorder-abgr+ 7)
(defsdl2constant +sdl-packedorder-bgra+ 8)

(defsdl2constant +sdl-arrayorder-none+ 0)
(defsdl2constant +sdl-arrayorder-rgb+ 1)
(defsdl2constant +sdl-arrayorder-rgba+ 2)
(defsdl2constant +sdl-arrayorder-argb+ 3)
(defsdl2constant +sdl-arrayorder-bgr+ 4)
(defsdl2constant +sdl-arrayorder-bgra+ 5)
(defsdl2constant +sdl-arrayorder-abgr+ 6)

(defsdl2constant +sdl-packedlayout-none+ 0)
(defsdl2constant +sdl-packedlayout-332+ 1)
(defsdl2constant +sdl-packedlayout-4444+ 2)
(defsdl2constant +sdl-packedlayout-1555+ 3)
(defsdl2constant +sdl-packedlayout-5551+ 4)
(defsdl2constant +sdl-packedlayout-565+ 5)
(defsdl2constant +sdl-packedlayout-8888+ 6)
(defsdl2constant +sdl-packedlayout-2101010+ 7)
(defsdl2constant +sdl-packedlayout-1010102+ 8)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defsdl2-lispfun sdl-define-pixelformat (type order layout bits bytes)
    (logior
     (ash 1 28)
     (ash type 24)
     (ash order 20)
     (ash layout 16)
     (ash bits 8)
     (ash bytes 0)))
  (defsdl2-lispfun sdl-define-pixelfourcc (a b c d)
    (sdl-fourcc a b c d)))

(defsdl2constant +sdl-pixelformat-unknown+ 0)
(defsdl2constant +sdl-pixelformat-index1lsb+
  (sdl-define-pixelformat +sdl-pixeltype-index1+ +sdl-bitmaporder-4321+ 0 1 0))
(defsdl2constant +sdl-pixelformat-index1msb+
  (sdl-define-pixelformat +sdl-pixeltype-index1+ +sdl-bitmaporder-1234+ 0 1 0))
(defsdl2constant +sdl-pixelformat-index4lsb+
  (sdl-define-pixelformat +sdl-pixeltype-index4+ +sdl-bitmaporder-4321+ 0 4 0))
(defsdl2constant +sdl-pixelformat-index4msb+
  (sdl-define-pixelformat +sdl-pixeltype-index4+ +sdl-bitmaporder-1234+ 0 4 0))
(defsdl2constant +sdl-pixelformat-index8+
  (sdl-define-pixelformat +sdl-pixeltype-index8+ 0 0 8 1))
(defsdl2constant +sdl-pixelformat-rgb332+
  (sdl-define-pixelformat +sdl-pixeltype-packed8+ +sdl-packedorder-xrgb+ +sdl-packedlayout-332+ 8 1))
(defsdl2constant +sdl-pixelformat-rgb444+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-xrgb+ +sdl-packedlayout-4444+ 12 2))
(defsdl2constant +sdl-pixelformat-rgb555+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-xrgb+ +sdl-packedlayout-1555+ 15 2))
(defsdl2constant +sdl-pixelformat-bgr555+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-xbgr+ +sdl-packedlayout-1555+ 15 2))
(defsdl2constant +sdl-pixelformat-argb4444+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-argb+ +sdl-packedlayout-4444+ 16 2))
(defsdl2constant +sdl-pixelformat-rgba4444+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-rgba+ +sdl-packedlayout-4444+ 16 2))
(defsdl2constant +sdl-pixelformat-abgr4444+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-abgr+ +sdl-packedlayout-4444+ 16 2))
(defsdl2constant +sdl-pixelformat-bgra4444+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-bgra+ +sdl-packedlayout-4444+ 16 2))
(defsdl2constant +sdl-pixelformat-argb1555+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-argb+ +sdl-packedlayout-1555+ 16 2))
(defsdl2constant +sdl-pixelformat-rgba5551+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-rgba+ +sdl-packedlayout-5551+ 16 2))
(defsdl2constant +sdl-pixelformat-abgr1555+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-abgr+ +sdl-packedlayout-1555+ 16 2))
(defsdl2constant +sdl-pixelformat-bgra5551+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-bgra+ +sdl-packedlayout-5551+ 16 2))
(defsdl2constant +sdl-pixelformat-rgb565+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-xrgb+ +sdl-packedlayout-565+ 16 2))
(defsdl2constant +sdl-pixelformat-bgr565+
  (sdl-define-pixelformat +sdl-pixeltype-packed16+ +sdl-packedorder-xbgr+ +sdl-packedlayout-565+ 16 2))
(defsdl2constant +sdl-pixelformat-rgb24+
  (sdl-define-pixelformat +sdl-pixeltype-arrayu8+ +sdl-arrayorder-rgb+ 0 24 3))
(defsdl2constant +sdl-pixelformat-bgr24+
  (sdl-define-pixelformat +sdl-pixeltype-arrayu8+ +sdl-arrayorder-bgr+ 0 24 3))
(defsdl2constant +sdl-pixelformat-rgb888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-xrgb+ +sdl-packedlayout-8888+ 24 4))
(defsdl2constant +sdl-pixelformat-rgbx8888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-rgbx+ +sdl-packedlayout-8888+ 24 4))
(defsdl2constant +sdl-pixelformat-bgr888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-xbgr+ +sdl-packedlayout-8888+ 24 4))
(defsdl2constant +sdl-pixelformat-bgrx8888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-bgrx+ +sdl-packedlayout-8888+ 24 4))
(defsdl2constant +sdl-pixelformat-argb8888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-argb+ +sdl-packedlayout-8888+ 32 4))
(defsdl2constant +sdl-pixelformat-rgba8888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-rgba+ +sdl-packedlayout-8888+ 32 4))
(defsdl2constant +sdl-pixelformat-abgr8888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-abgr+ +sdl-packedlayout-8888+ 32 4))
(defsdl2constant +sdl-pixelformat-bgra8888+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-bgra+ +sdl-packedlayout-8888+ 32 4))
(defsdl2constant +sdl-pixelformat-argb2101010+
  (sdl-define-pixelformat +sdl-pixeltype-packed32+ +sdl-packedorder-argb+ +sdl-packedlayout-2101010+ 32 4))

#+big-endian
(progn
  (defsdl2constant +sdl-pixelformat-rgba32+ +sdl-pixelformat-rgba8888+)
  (defsdl2constant +sdl-pixelformat-argb32+ +sdl-pixelformat-argb8888+)
  (defsdl2constant +sdl-pixelformat-bgra32+ +sdl-pixelformat-bgra8888+)
  (defsdl2constant +sdl-pixelformat-abgr32+ +sdl-pixelformat-abgr8888+))
#+little-endian
(progn
  (defsdl2constant +sdl-pixelformat-rgba32+ +sdl-pixelformat-abgr8888+)
  (defsdl2constant +sdl-pixelformat-argb32+ +sdl-pixelformat-bgra8888+)
  (defsdl2constant +sdl-pixelformat-bgra32+ +sdl-pixelformat-argb8888+)
  (defsdl2constant +sdl-pixelformat-abgr32+ +sdl-pixelformat-rgba8888+))

(defsdl2constant +sdl-pixelformat-yv12+ (sdl-define-pixelfourcc (char-code #\Y) (char-code #\V) (char-code #\1) (char-code #\2)))
(defsdl2constant +sdl-pixelformat-iyuv+ (sdl-define-pixelfourcc (char-code #\I) (char-code #\Y) (char-code #\U) (char-code #\V)))
(defsdl2constant +sdl-pixelformat-yuy2+ (sdl-define-pixelfourcc (char-code #\Y) (char-code #\U) (char-code #\Y) (char-code #\2)))
(defsdl2constant +sdl-pixelformat-uyvy+ (sdl-define-pixelfourcc (char-code #\U) (char-code #\Y) (char-code #\V) (char-code #\Y)))
(defsdl2constant +sdl-pixelformat-yvyu+ (sdl-define-pixelfourcc (char-code #\Y) (char-code #\V) (char-code #\Y) (char-code #\U)))
(defsdl2constant +sdl-pixelformat-nv12+ (sdl-define-pixelfourcc (char-code #\N) (char-code #\V) (char-code #\1) (char-code #\2)))
(defsdl2constant +sdl-pixelformat-nv21+ (sdl-define-pixelfourcc (char-code #\N) (char-code #\V) (char-code #\2) (char-code #\1)))

(defsdl2struct sdl-color
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(defsdl2struct sdl-palette
  (ncolors :int)
  (colors (:pointer sdl-color))
  (version :uint32)
  (refcount :int))

(defsdl2struct sdl-pixel-format
  (format :uint32)
  (palette (:pointer sdl-palette))
  (bits-per-pixel :uint8)
  (bytes-per-pixel :uint8)
  (padding :uint8 :count 2)
  (rmask :uint32)
  (gmask :uint32)
  (bmask :uint32)
  (amask :uint32)
  (rloss :uint8)
  (gloss :uint8)
  (bloss :uint8)
  (aloss :uint8)
  (rshift :uint8)
  (gshift :uint8)
  (bshift :uint8)
  (ashift :uint8)
  (refcount :int)
  (next (:pointer (:struct sdl-pixel-format))))

(defsdl2fun ("SDL_GetPixelFormatName" sdl-get-pixel-format-name) (:string :encoding :utf-8)
  (format :uint32))

(defsdl2fun ("SDL_PixelFormatEnumToMasks" sdl-pixel-format-enum-to-masks) sdl-bool
  (format :uint32)
  (bpp (:pointer :int))
  (rmask (:pointer :uint32))
  (gmask (:pointer :uint32))
  (bmask (:pointer :uint32))
  (amask (:pointer :uint32)))

(defsdl2fun ("SDL_AllocFormat" sdl-alloc-format) (:pointer sdl-pixel-format)
  (pixel-format :uint32))

(defsdl2fun ("SDL_FreeFormat" sdl-free-format) :void
  (format (:pointer sdl-pixel-format)))

(defsdl2fun ("SDL_AllocPalette" sdl-alloc-palette) (:pointer sdl-palette)
  (ncolors :int))

(defsdl2fun ("SDL_SetPixelFormatPalette" sdl-set-pixel-format-palette) :int
  (format (:pointer sdl-pixel-format))
  (palette (:pointer sdl-palette)))

(defsdl2fun ("SDL_SetPaletteColors" sdl-set-palette-colors) :int
  (palette (:pointer sdl-palette))
  (colors (:pointer sdl-color))
  (firstcolor :int)
  (ncolors :int))

(defsdl2fun ("SDL_FreePalette" sdl-free-palette) :void
  (palette (:pointer sdl-palette)))

(defsdl2fun ("SDL_MapRGB" sdl-map-rgb) :uint32
  (format (:pointer sdl-pixel-format))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(defsdl2fun ("SDL_MapRGBA" sdl-map-rgba) :uint32
  (format (:pointer sdl-pixel-format))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(defsdl2fun ("SDL_GetRGB" sdl-get-rgb) :void
  (pixel :uint32)
  (format (:pointer sdl-pixel-format))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8)))

(defsdl2fun ("SDL_GetRGBA" sdl-get-rgba) :void
  (pixel :uint32)
  (format (:pointer sdl-pixel-format))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8))
  (a (:pointer :uint8)))

(defsdl2fun ("SDL_CalculateGammaRamp" sdl-calculate-gamma-ramp) :void
  (gamma :float)
  (ramp (:pointer :uint16)))
