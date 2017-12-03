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

(defsdl2constant +sdl-hint-framebuffer-acceleration+   "SDL_FRAMEBUFFER_ACCELERATION")
(defsdl2constant +sdl-hint-render-driver+              "SDL_RENDER_DRIVER")
(defsdl2constant +sdl-hint-render-opengl-shaders+      "SDL_RENDER_OPENGL_SHADERS")
(defsdl2constant +sdl-hint-render-direct3d-threadsafe+ "SDL_RENDER_DIRECT3D_THREADSAFE")
(defsdl2constant +sdl-hint-render-direct3d11-debug+    "SDL_RENDER_DIRECT3D11_DEBUG")
(defsdl2constant +sdl-hint-render-logical-size-mode+       "SDL_RENDER_LOGICAL_SIZE_MODE")
(defsdl2constant +sdl-hint-render-scale-quality+       "SDL_RENDER_SCALE_QUALITY")
(defsdl2constant +sdl-hint-render-vsync+               "SDL_RENDER_VSYNC")
(defsdl2constant +sdl-hint-video-allow-screensaver+    "SDL_VIDEO_ALLOW_SCREENSAVER")
(defsdl2constant +sdl-hint-video-x11-xvidmode+         "SDL_VIDEO_X11_XVIDMODE")
(defsdl2constant +sdl-hint-video-x11-xinerama+         "SDL_VIDEO_X11_XINERAMA")
(defsdl2constant +sdl-hint-video-x11-xrandr+           "SDL_VIDEO_X11_XRANDR")
(defsdl2constant +sdl-hint-video-x11-net-wm-ping+      "SDL_VIDEO_X11_NET_WM_PING")
(defsdl2constant +sdl-hint-window-frame-usable-while-cursor-hidden+    "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN")
(defsdl2constant +sdl-hint-windows-intresource-icon+       "SDL_WINDOWS_INTRESOURCE_ICON")
(defsdl2constant +sdl-hint-windows-intresource-icon-small+ "SDL_WINDOWS_INTRESOURCE_ICON_SMALL")
(defsdl2constant +sdl-hint-windows-enable-messageloop+ "SDL_WINDOWS_ENABLE_MESSAGELOOP")
(defsdl2constant +sdl-hint-grab-keyboard+              "SDL_GRAB_KEYBOARD")
(defsdl2constant +sdl-hint-mouse-normal-speed-scale+    "SDL_MOUSE_NORMAL_SPEED_SCALE")
(defsdl2constant +sdl-hint-mouse-relative-speed-scale+    "SDL_MOUSE_RELATIVE_SPEED_SCALE")
(defsdl2constant +sdl-hint-mouse-relative-mode-warp+    "SDL_MOUSE_RELATIVE_MODE_WARP")
(defsdl2constant +sdl-hint-mouse-focus-clickthrough+ "SDL_MOUSE_FOCUS_CLICKTHROUGH")
(defsdl2constant +sdl-hint-touch-mouse-events+    "SDL_TOUCH_MOUSE_EVENTS")
(defsdl2constant +sdl-hint-video-minimize-on-focus-loss+   "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS")
(defsdl2constant +sdl-hint-idle-timer-disabled+ "SDL_IOS_IDLE_TIMER_DISABLED")
(defsdl2constant +sdl-hint-orientations+ "SDL_IOS_ORIENTATIONS")
(defsdl2constant +sdl-hint-apple-tv-controller-ui-events+ "SDL_APPLE_TV_CONTROLLER_UI_EVENTS")
(defsdl2constant +sdl-hint-apple-tv-remote-allow-rotation+ "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION")
(defsdl2constant +sdl-hint-accelerometer-as-joystick+ "SDL_ACCELEROMETER_AS_JOYSTICK")
(defsdl2constant +sdl-hint-xinput-enabled+ "SDL_XINPUT_ENABLED")
(defsdl2constant +sdl-hint-xinput-use-old-joystick-mapping+ "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING")
(defsdl2constant +sdl-hint-gamecontrollerconfig+ "SDL_GAMECONTROLLERCONFIG")
(defsdl2constant +sdl-hint-gamecontroller-ignore-devices+ "SDL_GAMECONTROLLER_IGNORE_DEVICES")
(defsdl2constant +sdl-hint-gamecontroller-ignore-devices-except+ "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT")
(defsdl2constant +sdl-hint-joystick-allow-background-events+ "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS")
(defsdl2constant +sdl-hint-allow-topmost+ "SDL_ALLOW_TOPMOST")
(defsdl2constant +sdl-hint-timer-resolution+ "SDL_TIMER_RESOLUTION")
(defsdl2constant +sdl-hint-qtwayland-content-orientation+ "SDL_QTWAYLAND_CONTENT_ORIENTATION")
(defsdl2constant +sdl-hint-qtwayland-window-flags+ "SDL_QTWAYLAND_WINDOW_FLAGS")
(defsdl2constant +sdl-hint-thread-stack-size+              "SDL_THREAD_STACK_SIZE")
(defsdl2constant +sdl-hint-video-highdpi-disabled+ "SDL_VIDEO_HIGHDPI_DISABLED")
(defsdl2constant +sdl-hint-mac-ctrl-click-emulate-right-click+ "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK")
(defsdl2constant +sdl-hint-video-win-d3dcompiler+              "SDL_VIDEO_WIN_D3DCOMPILER")
(defsdl2constant +sdl-hint-video-window-share-pixel-format+    "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT")
(defsdl2constant +sdl-hint-winrt-privacy-policy-url+ "SDL_WINRT_PRIVACY_POLICY_URL")
(defsdl2constant +sdl-hint-winrt-privacy-policy-label+ "SDL_WINRT_PRIVACY_POLICY_LABEL")
(defsdl2constant +sdl-hint-winrt-handle-back-button+ "SDL_WINRT_HANDLE_BACK_BUTTON")
(defsdl2constant +sdl-hint-video-mac-fullscreen-spaces+    "SDL_VIDEO_MAC_FULLSCREEN_SPACES")
(defsdl2constant +sdl-hint-mac-background-app+    "SDL_MAC_BACKGROUND_APP")
(defsdl2constant +sdl-hint-android-apk-expansion-main-file-version+ "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION")
(defsdl2constant +sdl-hint-android-apk-expansion-patch-file-version+ "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION")
(defsdl2constant +sdl-hint-ime-internal-editing+ "SDL_IME_INTERNAL_EDITING")
(defsdl2constant +sdl-hint-android-separate-mouse-and-touch+ "SDL_ANDROID_SEPARATE_MOUSE_AND_TOUCH")
(defsdl2constant +sdl-hint-emscripten-keyboard-element+   "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT")
(defsdl2constant +sdl-hint-no-signal-handlers+   "SDL_NO_SIGNAL_HANDLERS")
(defsdl2constant +sdl-hint-windows-no-close-on-alt-f4+	"SDL_WINDOWS_NO_CLOSE_ON_ALT_F4")
(defsdl2constant +sdl-hint-bmp-save-legacy-format+ "SDL_BMP_SAVE_LEGACY_FORMAT")
(defsdl2constant +sdl-hint-windows-disable-thread-naming+ "SDL_WINDOWS_DISABLE_THREAD_NAMING")
(defsdl2constant +sdl-hint-rpi-video-layer+           "SDL_RPI_VIDEO_LAYER")
(defsdl2constant +sdl-hint-opengl-es-driver+   "SDL_OPENGL_ES_DRIVER")
(defsdl2constant +sdl-hint-audio-resampling-mode+   "SDL_AUDIO_RESAMPLING_MODE")
(defsdl2constant +sdl-hint-audio-category+   "SDL_AUDIO_CATEGORY")

(defsdl2enum sdl-hint-priority
  +sdl-hint-default+
  +sdl-hint-normal+
  +sdl-hint-override+)

(defsdl2fun ("SDL_SetHintWithPriority" sdl-set-hint-with-priority) sdl-bool
  (name (:string :encoding :utf-8))
  (value (:string :encoding :utf-8))
  (priority sdl-hint-priority))

(defsdl2fun ("SDL_SetHint" sdl-set-hint) sdl-bool
  (name (:string :encoding :utf-8))
  (value (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GetHint" sdl-get-hint) (:string :encoding :utf-8)
  (name (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GetHintBoolean" sdl-get-hint-boolean) sdl-bool
  (name (:string :encoding :utf-8))
  (default-value sdl-bool))

(defsdl2type sdl-hint-callback :pointer)

(defsdl2fun ("SDL_AddHintCallback" sdl-add-hint-callback) :void
  (name (:string :encoding :utf-8))
  (callback sdl-hint-callback)
  (userdata :pointer))

(defsdl2fun ("SDL_DelHintCallback" sdl-del-hint-callback) :void
  (name (:string :encoding :utf-8))
  (callback sdl-hint-callback)
  (userdata :pointer))

(defsdl2fun ("SDL_ClearHints" sdl-clear-hints) :void)
