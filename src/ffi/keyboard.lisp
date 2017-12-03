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

(defsdl2struct sdl-keysym
  (scancode sdl-scancode)
  (sym sdl-keycode)
  (mod :uint16)
  (unused :uint32))

(defsdl2fun ("SDL_GetKeyFromName" sdl-get-key-from-name) sdl-keycode
  (name (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GetKeyFromScancode" sdl-get-key-from-scancode) sdl-keycode
  (scancode sdl-scancode))

(defsdl2fun ("SDL_GetKeyName" sdl-get-key-name) (:string :encoding :utf-8)
  (key sdl-keycode))

(defsdl2fun ("SDL_GetKeyboardFocus" sdl-get-keyboard-focus) (:pointer sdl-window))

(defsdl2fun ("SDL_GetKeyboardState" sdl-get-keyboard-state) (:pointer :uint8)
  (numkeys (:pointer :int)))

(defsdl2fun ("SDL_GetModState" sdl-get-mod-state) sdl-keymod)

(defsdl2fun ("SDL_GetScancodeFromKey" sdl-get-scancode-from-key) sdl-scancode
  (key sdl-keycode))

(defsdl2fun ("SDL_GetScancodeFromName" sdl-get-scancode-from-name) sdl-scancode
  (name (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GetScancodeName" sdl-get-scancode-name) (:string :encoding :utf-8)
  (scancode sdl-scancode))

(defsdl2fun ("SDL_HasScreenKeyboardSupport" sdl-had-screen-keyboard-support) sdl-bool)

(defsdl2fun ("SDL_IsScreenKeyboardShown" sdl-is-screen-keyboard-shown) sdl-bool
  (window (:pointer sdl-window)))

(defsdl2fun ("SDL_IsTextInputActive" sdl-is-text-input-active) sdl-bool)

(defsdl2fun ("SDL_SetModState" sdl-set-mod-state) :void
  (modstate sdl-keymod))

(defsdl2fun ("SDL_SetTextInputRect" sdl-set-text-input-rect) :void
  (rect (:pointer sdl-rect)))

(defsdl2fun ("SDL_StartTextInput" sdl-start-text-input) :void)

(defsdl2fun ("SDL_StopTextInput" sdl-stop-text-input) :void)
