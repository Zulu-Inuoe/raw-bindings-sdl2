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

(defsdl2struct sdl-display-mode
  (format :uint32)
  (w :int)
  (h :int)
  (refresh-rate :int)
  (driver-data :pointer))

(defsdl2struct sdl-window)

(defsdl2enum sdl-window-flags
  (+sdl-window-fullscreen+ #x00000001)
  (+sdl-window-opengl+ #x00000002)
  (+sdl-window-shown+ #x00000004)
  (+sdl-window-hidden+ #x00000008)
  (+sdl-window-borderless+ #x00000010)
  (+sdl-window-resizable+ #x00000020)
  (+sdl-window-minimized+ #x00000040)
  (+sdl-window-maximized+ #x00000080)
  (+sdl-window-input-grabbed+ #x00000100)
  (+sdl-window-input-focus+ #x00000200)
  (+sdl-window-mouse-focus+ #x00000400)
  (+sdl-window-fullscreen-desktop+ #x00001001)
  (+sdl-window-foreign+ #x00000800)
  (+sdl-window-allow-highdpi+ #x00002000)
  (+sdl-window-mouse-capture+ #x00004000)
  (+sdl-window-always-on-top+ #x00008000)
  (+sdl-window-skip-taskbar+ #x00010000)
  (+sdl-window-utility+ #x00020000)
  (+sdl-window-tooltip+ #x00040000)
  (+sdl-window-popup-menu+ #x00080000)
  (+sdl-window-vulkan+ #x10000000))

(defsdl2constant +sdl-windowpos-undefined-mask+ #x1FFF0000)

(defsdl2-lispfun sdl-windowpos-undefined-display (x)
  (logior +sdl-windowpos-undefined-mask+ x))

(defsdl2constant +sdl-windowpos-undefined+ (sdl-windowpos-undefined-display 0))

(defsdl2-lispfun sdl-windowpos-isundefined (x)
  (= (logand x #xFFFF0000) +sdl-windowpos-undefined+))

(defsdl2constant +sdl-windowpos-centered-mask+ #x2FFF0000)

(defsdl2-lispfun sdl-windowpos-centered-display (x)
  (logior +sdl-windowpos-centered-mask+ x))

(defsdl2constant +sdl-windowpos-centered+ (sdl-windowpos-centered-display 0))

(defsdl2-lispfun sdl-windowpos-iscentered (x)
  (= (logand x #xFFFF0000) +sdl-windowpos-centered-mask+))

(defsdl2enum sdl-window-event-id
  +sdl-windowevent-none+
  +sdl-windowevent-shown+
  +sdl-windowevent-hidden+
  +sdl-windowevent-exposed+
  +sdl-windowevent-moved+
  +sdl-windowevent-resized+
  +sdl-windowevent-size-changed+
  +sdl-windowevent-minimized+
  +sdl-windowevent-maximized+
  +sdl-windowevent-restored+
  +sdl-windowevent-enter+
  +sdl-windowevent-leave+
  +sdl-windowevent-focus-gained+
  +sdl-windowevent-focus-lost+
  +sdl-windowevent-close+
  +sdl-windowevent-take-focus+
  +sdl-windowevent-hit-test+)

(defsdl2type sdl-gl-context :pointer)

(defsdl2enum sdl-glattr
  +sdl-gl-red-size+
  +sdl-gl-green-size+
  +sdl-gl-blue-size+
  +sdl-gl-alpha-size+
  +sdl-gl-buffer-size+
  +sdl-gl-doublebuffer+
  +sdl-gl-depth-size+
  +sdl-gl-stencil-size+
  +sdl-gl-accum-red-size+
  +sdl-gl-accum-green-size+
  +sdl-gl-accum-blue-size+
  +sdl-gl-accum-alpha-size+
  +sdl-gl-stereo+
  +sdl-gl-multisamplebuffers+
  +sdl-gl-multisamplesamples+
  +sdl-gl-acceleratedvisuals+
  +sdl-gl-retained-backing+
  +sdl-gl-context-major-version+
  +sdl-gl-context-minor-version+
  +sdl-gl-context-egl+
  +sdl-gl-context-flags+
  +sdl-gl-context-profile-mask+
  +sdl-gl-share-with-current-context+
  +sdl-gl-framebuffer-srgb-capable+
  +sdl-gl-context-release-behavior+
  +sdl-gl-context-reset-notification+
  +sdl-gl-context-no-error+)

(defsdl2enum sdl-gl-profile
  (+sdl-gl-context-profile-core+ #x0001)
  (+sdl-gl-context-profile-compatibility+ #x0002)
  (+sdl-gl-context-profile-es+ #x0004))

(defsdl2enum sdl-gl-context-flag
  (+sdl-gl-context-debug-flag+ #x0001)
  (+sdl-gl-context-forward-compatible-flag+ #x0002)
  (+sdl-gl-context-robust-access-flag+ #x0004)
  (+sdl-gl-context-reset-isolation-flag+ #x0008))

(defsdl2enum sdl-gl-context-release-flag
  (+sdl-gl-context-release-behavior-none+ #x0000)
  (+sdl-gl-context-release-behavior-flush+ #x0001))

(defsdl2enum sdl-gl-context-reset-notification
  (+sdl-gl-context-reset-no-notification+ #x0000)
  (+sdl-gl-context-reset-lose-context+ #x0001))

(defsdl2fun ("SDL_GetNumVideoDrivers" sdl-get-num-video-drivers) :int)

(defsdl2fun ("SDL_GetVideoDriver" sdl-get-video-driver) (:string :encoding :utf-8))

(defsdl2fun ("SDL_VideoInit" sdl-video-init) :int
  (driver-name (:string :encoding :utf-8)))

(defsdl2fun ("SDL_VideoQuit" sdl-video-quit) :void)

(defsdl2fun ("SDL_GetCurrentVideoDriver" sdl-get-current-video-driver) (:string :encoding :utf-8))

(defsdl2fun ("SDL_GetNumVideoDisplays" sdl-get-num-video-displays) :int)

(defsdl2fun ("SDL_GetDisplayName" sdl-get-display-name) (:string :encoding :utf-8)
  (display-index :int))

(defsdl2fun ("SDL_GetDisplayBounds" sdl-get-display-bounds) :int
  (display-index :int)
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_GetDisplayDPI" sdl-get-display-dpi) :int
  (display-index :int)
  (ddpi (:pointer :float))
  (hdpi (:pointer :float))
  (vdpi (:pointer :float)))

(defsdl2fun ("SDL_GetDisplayUsableBounds" sdl-get-display-usable-bounds) :int
  (display-index :int)
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_GetNumDisplayModes" sdl-get-num-display-modes) :int)

(defsdl2fun ("SDL_GetDisplayMode" sdl-get-display-mode) :int
  (display-index :int))

(defsdl2fun ("SDL_GetDesktopDisplayMode" sdl-get-desktop-display-mode) :int
  (display-index :int)
  (mode (:pointer sdl-display-mode)))

(defsdl2fun ("SDL_GetCurrentDisplayMode" sdl-get-current-display-mode) :int
  (display-index :int)
  (display-mode (:pointer sdl-display-mode)))

(defsdl2fun ("SDL_GetClosestDisplayMode" sdl-get-closest-display-mode) (:pointer sdl-display-mode)
  (display-index :int)
  (mode (:pointer sdl-display-mode))
  (closest (:pointer sdl-display-mode)))

(defsdl2fun ("SDL_GetWindowDisplayIndex" sdl-get-window-display-index) :int
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_SetWindowDisplayMode" sdl-set-window-display-mode) :int
  (window (:pointer sdl-window))
  (mode (:pointer sdl-display-mode)))

(defsdl2fun ("SDL_GetWindowDisplayMode" sdl-get-window-display-mode) :int
  (window (:pointer sdl-window))
  (mode (:pointer sdl-display-mode)))

(defsdl2fun ("SDL_GetWindowPixelFormat" sdl-get-window-pixel-format) :uint32
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_CreateWindow" sdl-create-window) (:pointer sdl-window)
  (title (:string :encoding :utf-8))
  (x :int)
  (y :int)
  (w :int)
  (h :int)
  (flags :uint32))

(defsdl2fun ("SDL_CreateWindowFrom" sdl-create-window-from) (:pointer sdl-window)
  (data :pointer))

(defsdl2fun ("SDL_GetWindowID" sdl-get-window-id) :uint32
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_GetWindowFromID" sdl-get-window-from-id) (:pointer sdl-window)
  (id :uint32))

(defsdl2fun ("SDL_GetWindowFlags" sdl-get-window-flags) :uint32
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_SetWindowTitle" sdl-set-window-title) :void
  (window (:pointer sdl-window))
  (title (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GetWindowTitle" sdl-get-window-title) (:string :encoding :utf-8)
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_SetWindowIcon" sdl-set-window-icon) :void
  (window (:pointer sdl-window))
  (icon (:pointer sdl-surface)))

(defsdl2fun ("SDL_SetWindowData" sdl-set-window-data) :pointer
  (window (:pointer sdl-window))
  (name (:string :encoding :utf-8))
  (userdata :pointer))

(defsdl2fun ("SDL_GetWindowData" sdl-get-window-data) :pointer
  (window (:pointer sdl-window))
  (name (:string :encoding :utf-8)))

(defsdl2fun ("SDL_SetWindowPosition" sdl-set-window-position) :void
  (window (:pointer sdl-window))
  (x :int)
  (y :int))

(defsdl2fun ("SDL_GetWindowPosition" sdl-get-window-position) :void
  (window (:pointer sdl-window))
  (x (:pointer :int))
  (y (:pointer :int)))

(defsdl2fun ("SDL_SetWindowSize" sdl-set-window-size) :void
  (window (:pointer sdl-window))
  (w :int)
  (h :int))

(defsdl2fun ("SDL_GetWindowSize" sdl-get-window-size) :void
  (window (:pointer sdl-window))
  (w (:pointer :int))
  (h (:pointer :int)))

(defsdl2fun ("SDL_GetWindowBordersSize" sdl-get-window-borders-size) :int
  (window (:pointer sdl-window))
  (top (:pointer :int))
  (left (:pointer :int))
  (bottom (:pointer :int))
  (right (:pointer :int)))

(defsdl2fun ("SDL_SetWindowMinimumSize" sdl-set-window-minimum-size) :void
  (window (:pointer sdl-window))
  (min-w :int)
  (min-h :int))

(defsdl2fun ("SDL_GetWindowMinimumSize" sdl-get-window-minimum-size) :void
  (window (:pointer sdl-window))
  (w (:pointer :int))
  (h (:pointer :int)))

(defsdl2fun ("SDL_SetWindowMaximumSize" sdl-set-window-maximum-size) :void
  (window (:pointer sdl-window))
  (max-w :int)
  (max-h :int))

(defsdl2fun ("SDL_GetWindowMaximumSize" sdl-get-window-maximum-size) :void
  (window (:pointer sdl-window))
  (w (:pointer :int))
  (h (:pointer :int)))

(defsdl2fun ("SDL_SetWindowBordered" sdl-set-window-bordered) :void
  (window (:pointer sdl-window))
  (bordered sdl-bool))

(defsdl2fun ("SDL_SetWindowResizable" sdl-set-window-resizable) :void
  (window (:pointer sdl-window))
  (resizable sdl-bool))

(defsdl2fun ("SDL_ShowWindow" sdl-show-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_HideWindow" sdl-hide-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_RaiseWindow" sdl-raise-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_MaximizeWindow" sdl-maximize-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_MinimizeWindow" sdl-minimize-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_RestoreWindow" sdl-restore-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_SetWindowFullscreen" sdl-set-window-fullscreen) :int
  (window (:pointer sdl-window))
  (flags :uint32))

(defsdl2fun ("SDL_GetWindowSurface" sdl-get-window-surface) (:pointer sdl-surface)
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_UpdateWindowSurface" sdl-update-window-surface) :int
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_UpdateWindowSurfaceRects" sdl-update-window-surface-rects) :int
  (window (:pointer sdl-window))
  (rects (:pointer sdl-rect))
  (numrects :int))

(defsdl2fun ("SDL_SetWindowGrab" sdl-set-window-grab) :void
  (window (:pointer sdl-window))
  (grabbed sdl-bool))

(defsdl2fun ("SDL_GetWindowGrab" sdl-get-window-grab) :void
  (window (:pointer sdl-window))
  (grabbed sdl-bool))

(defsdl2fun ("SDL_GetGrabbedWindow" sdl-get-grabbed-window) (:pointer sdl-window))

(defsdl2fun ("SDL_SetWindowBrightness" sdl-set-window-brightness) :int
  (window (:pointer sdl-window))
  (brightness :float))

(defsdl2fun ("SDL_GetWindowBrightness" sdl-get-window-brightness) :float
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_SetWindowOpacity" sdl-set-window-opacity) :int
  (window (:pointer sdl-window))
  (opacity :float))

(defsdl2fun ("SDL_GetWindowOpacity" sdl-get-window-opacity) :int
  (window (:pointer sdl-window))
  (opacity (:pointer :float)))

(defsdl2fun ("SDL_SetWindowModalFor" sdl-set-window-modal-for) :int
  (modal-window (:pointer sdl-window))
  (parent-window (:pointer sdl-window)))

(defsdl2fun ("SDL_SetWindowInputFocus" sdl-set-window-input-focus) :int
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_SetWindowGammaRamp" sdl-set-window-gamma-ramp) :int
  (window (:pointer sdl-window))
  (red (:pointer :uint16))
  (green (:pointer :uint16))
  (blue (:pointer :uint16)))

(defsdl2fun ("SDL_GetWindowGammaRamp" sdl-get-window-gamma-ramp) :int
  (window (:pointer sdl-window))
  (red (:pointer :uint16))
  (green (:pointer :uint16))
  (blue (:pointer :uint16)))

(defsdl2enum sdl-hit-test-result
  +sdl-hittest-normal+
  +sdl-hittest-draggable+
  +sdl-hittest-resize-topleft+
  +sdl-hittest-resize-top+
  +sdl-hittest-resize-topright+
  +sdl-hittest-resize-right+
  +sdl-hittest-resize-bottom-right+
  +sdl-hittest-resize-bottom+
  +sdl-hittest-resize-bottom-left+
  +sdl-hittest-resize-left+)

(defsdl2type sdl-hit-test :pointer
  "Callback used for hit testing.")

(defsdl2fun ("SDL_SetWindowHitTest" sdl-set-window-hit-test) :int
  (window (:pointer sdl-window))
  (callback sdl-hit-test)
  (callback-data :pointer))

(defsdl2fun ("SDL_DestroyWindow" sdl-destroy-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_IsScreenSaverEnabled" sdl-is-screen-save-enabled) sdl-bool)

(defsdl2fun ("SDL_EnableScreenSaver" sdl-enable-screen-saver) :void)

(defsdl2fun ("SDL_DisableScreenSaver" sdl-disable-screen-saver) :void)

(defsdl2fun ("SDL_GL_LoadLibrary" sdl-gl-load-library) :int
  (path (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GL_GetProcAddress" sdl-gl-get-proc-address) :pointer
  (proc (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GL_UnloadLibrary" sdl-gl-unload-library) :void)

(defsdl2fun ("SDL_GL_ExtensionSupported" sdl-gl-extension-supported) sdl-bool
  (extension (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GL_ResetAttributes" sdl-gl-reset-attributes) :void)

(defsdl2fun ("SDL_GL_SetAttribute" sdl-gl-set-attribute) :int
  (attr sdl-glattr)
  (value :int))

(defsdl2fun ("SDL_GL_GetAttribute" sdl-gl-get-attribute) :int
  (attr sdl-glattr)
  (value (:pointer :int)))

(defsdl2fun ("SDL_GL_CreateContext" sdl-gl-create-context) sdl-gl-context
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_GL_MakeCurrent" sdl-gl-make-current) :int
  (window (:pointer sdl-window))
  (context sdl-gl-context))

(defsdl2fun ("SDL_GL_GetCurrentWindow" sdl-gl-get-current-window) (:pointer sdl-window))

(defsdl2fun ("SDL_GL_GetCurrentContext" sdl-gl-get-current-context) sdl-gl-context)

(defsdl2fun ("SDL_GL_GetDrawableSize" sdl-gl-get-drawable-size) :void
  (window (:pointer sdl-window))
  (w (:pointer :int))
  (h (:pointer :int)))

(defsdl2fun ("SDL_GL_SetSwapInterval" sdl-gl-set-swap-interval) :int
  (interval :int))

(defsdl2fun ("SDL_GL_GetSwapInterval" sdl-gl-get-swap-interval) :int)

(defsdl2fun ("SDL_GL_SwapWindow" sdl-gl-swap-window) :void
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_GL_DeleteContext" sdl-gl-delete-context) :void
  (context sdl-gl-context))
