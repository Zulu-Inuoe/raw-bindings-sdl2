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

(defsdl2struct sdl-game-controller)

(defsdl2enum sdl-game-controller-bind-type
  (+sdl-controller-bindtype-none+ 0)
  +sdl-controller-bindtype-button+
  +sdl-controller-bindtype-axis+
  +sdl-controller-bindtype-hat+)

(defsdl2struct sdl-game-controller-button-bind-value-hat
  (hat :int)
  (hat-mask :int))

(defsdl2union sdl-game-controller-button-bind-value
  (button :int)
  (axis :int)
  (hat sdl-game-controller-button-bind-value-hat))

(defsdl2struct sdl-game-controller-button-bind
  (bind-type sdl-game-controller-bind-type)
  (value sdl-game-controller-button-bind-value))

(defsdl2fun ("SDL_GameControllerAddMappingsFromRW" sdl-game-controller-add-mappings-from-rw) :int
  (rw (:pointer sdl-rwops))
  (freerw :int))

(defsdl2-lispfun sdl-game-controller-add-mappings-from-file (file)
  (sdl-game-controller-add-mappings-from-rw (sdl-rw-from-file file "rb") 1))

(defsdl2fun ("SDL_GameControllerAddMapping" sdl-game-controller-add-mapping) :int
  (mappingString (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GameControllerNumMappings" sdl-game-controller-num-mappings) :int)

(defsdl2fun ("SDL_GameControllerMappingForIndex" sdl-game-controller-mapping-for-index) sdl-temp-string
  (mapping-index :int))

#+fsbv
(defsdl2fun ("SDL_GameControllerMappingForGUID" sdl-game-controller-mapping-for-guid) sdl-temp-string
  (guid sdl-joystick-guid))

(defsdl2fun ("SDL_GameControllerMapping" sdl-game-controller-mapping) sdl-temp-string
  (gamecontroller (:pointer sdl-game-controller)))

(defsdl2fun ("SDL_IsGameController" sdl-is-game-controller) sdl-bool
  (joystick-index :int))

(defsdl2fun ("SDL_GameControllerNameForIndex" sdl-game-controller-name-for-index) (:string :encoding :utf-8)
  (joystick-index :int))

(defsdl2fun ("SDL_GameControllerOpen" sdl-game-controller-open) (:pointer sdl-game-controller)
  (joystick-index :int))

(defsdl2fun ("SDL_GameControllerFromInstanceID" sdl-game-controller-from-instance-id) (:pointer sdl-game-controller)
  (joyid sdl-joystick-id))

(defsdl2fun ("SDL_GameControllerName" sdl-game-controller-name) (:string :encoding :utf-8)
  (gamecontroller (:pointer sdl-game-controller)))

(defsdl2fun ("SDL_GameControllerGetVendor" sdl-game-controller-get-vendor) :uint16
  (gamecontroller (:pointer sdl-game-controller)))

(defsdl2fun ("SDL_GameControllerGetProduct" sdl-game-controller-get-product) :uint16
  (gamecontroller (:pointer sdl-game-controller)))

(defsdl2fun ("SDL_GameControllerGetProductVersion" sdl-game-controller-get-product-version) :uint16
  (gamecontroller (:pointer sdl-game-controller)))

(defsdl2fun ("SDL_GameControllerGetAttached" sdl-game-controller-get-attached) sdl-bool
  (gamecontroller (:pointer sdl-game-controller)))

(defsdl2fun ("SDL_GameControllerGetJoystick" sdl-game-controller-get-joystick) (:pointer sdl-joystick)
  (gamecontroller (:pointer sdl-game-controller)))

(defsdl2fun ("SDL_GameControllerEventState" sdl-game-controller-event-state) :int
  (state :int))

(defsdl2fun ("SDL_GameControllerUpdate" sdl-game-controller-update) :void)

(defsdl2enum sdl-game-controller-axis
  (+sdl-controller-axis-invalid+ -1)
  +sdl-controller-axis-leftx+
  +sdl-controller-axis-lefty+
  +sdl-controller-axis-rightx+
  +sdl-controller-axis-righty+
  +sdl-controller-axis-triggerleft+
  +sdl-controller-axis-triggerright+
  +sdl-controller-axis-max+)

(defsdl2fun ("SDL_GameControllerGetAxisFromString" sdl-game-controller-get-axis-from-string) sdl-game-controller-axis
  (pch-string (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GameControllerGetStringForAxis" sdl-game-controller-get-string-for-axis) (:string :encoding :utf-8)
  (axis sdl-game-controller-axis))

#+fsbv
(defsdl2fun ("SDL_GameControllerGetBindForAxis" sdl-game-controller-get-bind-for-axis) sdl-game-controller-button-bind
  (gamecontroller (:pointer sdl-game-controller))
  (axis sdl-game-controller-axis))

(defsdl2fun ("SDL_GameControllerGetAxis" sdl-game-controller-get-axis) :int16
  (gamecontroller (:pointer sdl-game-controller))
  (axis sdl-game-controller-axis))

(defsdl2enum sdl-game-controller-button
  (+sdl-controller-button-invalid+ -1)
  +sdl-controller-button-a+
  +sdl-controller-button-b+
  +sdl-controller-button-x+
  +sdl-controller-button-y+
  +sdl-controller-button-back+
  +sdl-controller-button-guide+
  +sdl-controller-button-start+
  +sdl-controller-button-leftstick+
  +sdl-controller-button-rightstick+
  +sdl-controller-button-leftshoulder+
  +sdl-controller-button-rightshoulder+
  +sdl-controller-button-dpad-up+
  +sdl-controller-button-dpad-down+
  +sdl-controller-button-dpad-left+
  +sdl-controller-button-dpad-right+
  +sdl-controller-button-max+)

(defsdl2fun ("SDL_GameControllerGetButtonFromString" sdl-game-controller-get-button-from-string) sdl-game-controller-button
  (pch-string (:string :encoding :utf-8)))

(defsdl2fun ("SDL_GameControllerGetStringForButton" sdl-game-controller-get-string-for-button) (:string :encoding :utf-8)
  (button sdl-game-controller-button))

#+fsbv
(defsdl2fun ("SDL_GameControllerGetBindForButton" sdl-game-controller-get-bind-for-button) sdl-game-controller-button-bind
  (gamecontroller (:pointer sdl-game-controller))
  (button sdl-game-controller-button))

(defsdl2fun ("SDL_GameControllerGetButton" sdl-game-controller-get-button) :uint8
  (gamecontroller (:pointer sdl-game-controller))
  (button sdl-game-controller-button))

(defsdl2fun ("SDL_GameControllerClose" sdl-game-controller-close) :void
  (gamecontroller (:pointer sdl-game-controller)))
