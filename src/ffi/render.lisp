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

(defsdl2enum sdl-renderer-flags
  (+sdl-renderer-software+ #x00000001)
  (+sdl-renderer-accelerated+ #x00000002)
  (+sdl-renderer-presentvsync+ #x00000004)
  (+sdl-renderer-targettexture+ #x00000008))

(defsdl2struct sdl-renderer-info
  (name (:pointer :char))
  (flags :uint32)
  (num-texture-formats :uint32)
  (texture-formats :uint32 :count 16)
  (max-texture-width :int)
  (max-texture-height :int))

(defsdl2enum sdl-texture-access
  +sdl-textureaccess-static+
  +sdl-textureaccess-streaming+
  +sdl-textureaccess-target+)

(defsdl2enum sdl-texture-modulate
  (+sdl-texturemodulate-none+ #x00000000)
  (+sdl-texturemodulate-color+ #x00000001)
  (+sdl-texturemodulate-alpha+ #x00000002))

(defsdl2enum sdl-renderer-flip
  (+sdl-flip-none+ #x00000000)
  (+sdl-flip-horizontal+ #x00000001)
  (+sdl-flip-vertical+ #x00000002))

(defsdl2struct sdl-renderer)

(defsdl2struct sdl-texture)

(defsdl2fun ("SDL_GetNumRenderDrivers" sdl-get-num-render-drivers) :int)

(defsdl2fun ("SDL_GetRenderDriverInfo" sdl-get-render-driver-info) :int
  (index :int)
  (info (:pointer sdl-renderer-info)))

(defsdl2fun ("SDL_CreateWindowAndRenderer" sdl-create-window-and-renderer) :int
  (width :int)
  (height :int)
  (window-flags :uint32)
  (window (:pointer (:pointer sdl-window)))
  (renderer (:pointer (:pointer sdl-renderer))))

(defsdl2fun ("SDL_CreateRenderer" sdl-create-renderer) (:pointer sdl-renderer)
  (window (:pointer  sdl-window))
  (index :int)
  (flags :uint32))

(defsdl2fun ("SDL_CreateSoftwareRenderer" sdl-create-software-renderer) (:pointer sdl-renderer)
  (surface (:pointer sdl-surface)))

(defsdl2fun ("SDL_GetRenderer" sdl-get-renderer) (:pointer sdl-renderer)
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_GetRendererInfo" sdl-get-renderer-info) :int
  (renderer (:pointer sdl-renderer))
  (info (:pointer sdl-renderer-info)))

(defsdl2fun ("SDL_GetRendererOutputSize" sdl-getrenderer-output-size) :int
  (renderer (:pointer sdl-renderer))
  (w :int)
  (h :int))

(defsdl2fun ("SDL_CreateTexture" sdl-create-texture) (:pointer sdl-texture)
  (renderer (:pointer sdl-renderer))
  (format :uint32)
  (access :int)
  (w :int)
  (h :int))

(defsdl2fun ("SDL_CreateTextureFromSurface" sdl-create-texture-from-surface) (:pointer sdl-texture)
  (renderer (:pointer sdl-renderer))
  (surface (:pointer sdl-surface)))

(defsdl2fun ("SDL_QueryTexture" sdl-query-texture) :int
  (texture (:pointer sdl-texture))
  (format (:pointer :uint32))
  (access (:pointer :int))
  (w (:pointer :int))
  (h (:pointer :int)))

(defsdl2fun ("SDL_SetTextureColorMod" sdl-set-texture-color-mod) :int
  (texture (:pointer sdl-texture))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(defsdl2fun ("SDL_GetTextureColorMod" sdl-gettexture-color-mod) :int
  (texture (:pointer sdl-texture))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8)))

(defsdl2fun ("SDL_SetTextureAlphaMod" sdl-set-texture-alpha-mod) :int
  (texture (:pointer sdl-texture))
  (alpha :uint8))

(defsdl2fun ("SDL_GetTextureAlphaMod" sdl-get-texture-alpha-mod) :int
  (texture (:pointer sdl-texture))
  (alpha (:pointer :uint8)))

(defsdl2fun ("SDL_SetTextureBlendMode" sdl-set-texture-blend-mode) :int
  (texture (:pointer sdl-texture))
  (blendMode sdl-blend-mode))

(defsdl2fun ("SDL_GetTextureBlendMode" sdl-get-texture-blend-mode) :int
  (texture (:pointer sdl-texture))
  (blendMode (:pointer sdl-blend-mode)))

(defsdl2fun ("SDL_UpdateTexture" sdl-update-texture) :int
  (texture (:pointer sdl-texture))
  (rect (:pointer sdl-rect))
  (pixels :pointer)
  (pitch :int))

(defsdl2fun ("SDL_UpdateYUVTexture" sdl-update-yuv-texture) :int
  (texture (:pointer sdl-texture))
  (rect (:pointer sdl-rect))
  (y-plane (:pointer :uint8))
  (y-pitch :int)
  (u-plane (:pointer :uint8))
  (u-pitch :int)
  (v-plane (:pointer :uint8))
  (v-pitch :int))

(defsdl2fun ("SDL_LockTexture" sdl-lock-texture) :int
  (texture (:pointer sdl-texture))
  (rect (:pointer sdl-rect))
  (pixels (:pointer :pointer))
  (pitch (:pointer :int)))

(defsdl2fun ("SDL_UnlockTexture" sdl-unlock-texture) :void
  (texture (:pointer sdl-texture)))

(defsdl2fun ("SDL_RenderTargetSupported" sdl-render-target-supported) sdl-bool
  (renderer (:pointer sdl-renderer)))

(defsdl2fun ("SDL_SetRenderTarget" sdl-set-render-target) :int
  (renderer (:pointer sdl-renderer))
  (texture (:pointer sdl-texture)))

(defsdl2fun ("SDL_GetRenderTarget" sdl-get-render-target) (:pointer sdl-texture)
  (renderer (:pointer sdl-renderer)))

(defsdl2fun ("SDL_RenderSetLogicalSize" sdl-render-set-logical-size) :int
  (renderer (:pointer sdl-renderer))
  (w :int)
  (h :int))

(defsdl2fun ("SDL_RenderGetLogicalSize" sdl-render-get-logical-size) :void
  (renderer (:pointer sdl-renderer))
  (w (:pointer :int))
  (h (:pointer :int)))

(defsdl2fun ("SDL_RenderSetIntegerScale" sdl-render-set-integer-scale) :int
  (renderer (:pointer sdl-renderer))
  (enable sdl-bool))

(defsdl2fun ("SDL_RenderGetIntegerScale" sdl-render-get-integer-scale) sdl-bool
  (renderer (:pointer sdl-renderer)))

(defsdl2fun ("SDL_RenderSetViewport" sdl-render-set-viewport) :int
  (renderer (:pointer sdl-renderer))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_RenderGetViewport" sdl-render-get-viewport) :void
  (renderer (:pointer sdl-renderer))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_RenderSetClipRect" sdl-render-set-clip-rect) :int
  (renderer (:pointer sdl-renderer))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_RenderGetClipRect" sdl-render-get-clip-rect) :void
  (renderer (:pointer sdl-renderer))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_RenderIsClipEnabled" sdl-render-is-clip-enabled) sdl-bool
  (renderer (:pointer sdl-renderer)))

(defsdl2fun ("SDL_RenderSetScale" sdl-render-set-scale) :int
  (renderer (:pointer sdl-renderer))
  (scale-x :float)
  (scale-y :float))

(defsdl2fun ("SDL_RenderGetScale" sdl-render-get-scale)  :void
  (renderer (:pointer sdl-renderer))
  (scale-x(:pointer :float))
  (scale-y (:pointer :float)))

(defsdl2fun ("SDL_SetRenderDrawColor" sdl-set-render-draw-color) :int
  (renderer (:pointer sdl-renderer))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(defsdl2fun ("SDL_GetRenderDrawColor" sdl-get-render-draw-color) :int
  (renderer (:pointer sdl-renderer))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8))
  (a (:pointer :uint8)))

(defsdl2fun ("SDL_SetRenderDrawBlendMode" sdl-set-render-draw-blend-mode) :int
  (renderer (:pointer sdl-renderer))
  (blendMode sdl-blend-mode))

(defsdl2fun ("SDL_GetRenderDrawBlendMode" sdl-get-render-draw-blend-mode) :int
  (renderer (:pointer sdl-renderer))
  (blend-mode (:pointer sdl-blend-mode)))

(defsdl2fun ("SDL_RenderClear" sdl-render-clear) :int
  (renderer (:pointer sdl-renderer)))

(defsdl2fun ("SDL_RenderDrawPoint" sdl-render-draw-point) :int
  (renderer (:pointer sdl-renderer))
  (x :int)
  (y :int))

(defsdl2fun ("SDL_RenderDrawPoints" sdl-render-draw-points) :int
  (renderer (:pointer sdl-renderer))
  (points (:pointer sdl-point))
  (count :int))

(defsdl2fun ("SDL_RenderDrawLine" sdl-render-draw-line) :int
  (renderer (:pointer sdl-renderer))
  (x1 :int)
  (y1 :int)
  (x2 :int)
  (y2 :int))

(defsdl2fun ("SDL_RenderDrawLines" sdl-render-draw-lines) :int
  (renderer (:pointer sdl-renderer))
  (points (:pointer sdl-point))
  (count :int))

(defsdl2fun ("SDL_RenderDrawRect" sdl-render-draw-rect) :int
  (renderer (:pointer sdl-renderer))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_RenderDrawRects" sdl-render-draw-rects) :int
  (renderer (:pointer sdl-renderer))
  (rects (:pointer sdl-rect))
  (count :int))

(defsdl2fun ("SDL_RenderFillRect" sdl-render-fill-rect) :int
  (renderer (:pointer sdl-renderer))
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_RenderFillRects" sdl-render-fill-rects) :int
  (renderer (:pointer sdl-renderer))
  (rects (:pointer sdl-rect))
  (count :int))

(defsdl2fun ("SDL_RenderCopy" sdl-render-copy) :int
  (renderer (:pointer sdl-renderer))
  (texture (:pointer sdl-texture))
  (srcrect (:pointer sdl-rect))
  (dstrect (:pointer sdl-rect)))

(defsdl2fun ("SDL_RenderCopyEx" sdl-render-copy-ex) :int
  (renderer (:pointer sdl-renderer))
  (texture (:pointer sdl-texture))
  (srcrect (:pointer sdl-rect))
  (dstrect (:pointer sdl-rect))
  (angle :double)
  (center (:pointer sdl-point))
  (flip sdl-renderer-flip))

(defsdl2fun ("SDL_RenderReadPixels" sdl-render-read-pixels) :int
  (renderer (:pointer sdl-renderer))
  (rect (:pointer sdl-rect))
  (format :uint32)
  (pixels :pointer)
  (pitch :int))

(defsdl2fun ("SDL_RenderPresent" sdl-render-present)  :void
  (renderer (:pointer sdl-renderer)))

(defsdl2fun ("SDL_DestroyTexture" sdl-destroy-texture)  :void
  (texture (:pointer sdl-texture)))

(defsdl2fun ("SDL_DestroyRenderer" sdl-destroy-renderer)  :void
  (renderer (:pointer sdl-renderer)))

(defsdl2fun ("SDL_GL_BindTexture" sdl-gl-bind-texture) :int
  (texture (:pointer sdl-texture))
  (texw (:pointer :float))
  (texh (:pointer :float)))

(defsdl2fun ("SDL_GL_UnbindTexture" sdl-gl-unbind-texture) :int
  (texture (:pointer sdl-texture)))
