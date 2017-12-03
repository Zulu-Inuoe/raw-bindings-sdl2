;;;raw-bindings-sdl2 - FFI bindings to SDL2
;;;Written in 2017 by Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>
;;;
;;;To the extent possible under law, the author(s) have dedicated all copyright
;;;and related and neighboring rights to this software to the public domain
;;;worldwide. This software is distributed without any warranty.
;;;You should have received a copy of the CC0 Public Domain Dedication along
;;;with this software. If not, see
;;;<http://creativecommons.org/publicdomain/zero/1.0/>.

(in-package :raw-bindings-sdl2)

(defsdl2struct sdl-haptic)

(defsdl2constant +sdl-haptic-constant+ (ash 1 0))
(defsdl2constant +sdl-haptic-sine+ (ash 1 1))
(defsdl2constant +sdl-haptic-leftright+ (ash 1 2))
(defsdl2constant +sdl-haptic-triangle+ (ash 1 3))
(defsdl2constant +sdl-haptic-sawtoothup+ (ash 1 4))
(defsdl2constant +sdl-haptic-sawtoothdown+ (ash 1 5))
(defsdl2constant +sdl-haptic-ramp+ (ash 1 6))
(defsdl2constant +sdl-haptic-spring+ (ash 1 7))
(defsdl2constant +sdl-haptic-damper+ (ash 1 8))
(defsdl2constant +sdl-haptic-intertia+ (ash 1 9))
(defsdl2constant +sdl-haptic-friction+ (ash 1 10))
(defsdl2constant +sdl-haptic-custom+ (ash 1 11))

(defsdl2constant +sdl-haptic-gain+ (ash 1 12))
(defsdl2constant +sdl-haptic-autocenter+ (ash 1 13))
(defsdl2constant +sdl-haptic-status+ (ash 1 14))
(defsdl2constant +sdl-haptic-pause+ (ash 1 15))

(defsdl2constant +sdl-haptic-polar+ 0)
(defsdl2constant +sdl-haptic-cartesian+ 1)
(defsdl2constant +sdl-haptic-spherical+ 2)

(defsdl2constant +sdl-haptic-infinity+ #xFFFFFFFF)

(defsdl2struct sdl-haptic-direction
  (type :uint8)
  (dir :int32 :count 3))

(defsdl2struct sdl-haptic-constant
  (type :uint16)
  (direction sdl-haptic-direction)
  (length :uint32)
  (delay :uint16)
  (button :uint16)
  (interval :uint16)
  (level :int16)
  (attack-length :uint16)
  (attack-level :uint16)
  (fade-length :uint16)
  (fade-level :uint16))

(defsdl2struct sdl-haptic-periodic
  (type :uint16)
  (direction sdl-haptic-direction)
  (length :uint32)
  (delay :uint16)
  (button :uint16)
  (interval :uint16)
  (period :uint16)
  (magnitude :int16)
  (offset :int16)
  (phase :uint16)
  (attack-length :uint16)
  (attack-level :uint16)
  (fade-length :uint16)
  (fade-level :uint16))

(defsdl2struct sdl-haptic-condition
  (type :uint16)
  (direction sdl-haptic-direction)
  (length :uint32)
  (delay :uint16)
  (button :uint16)
  (interval :uint16)
  (right-sat :uint16 :count 3)
  (left-sat :uint16 :count 3)
  (right-coeff :int16 :count 3)
  (left-coeff :int16 :count 3)
  (deadband :uint16 :count 3)
  (center :int16 :count 3))

(defsdl2struct sdl-haptic-ramp
  (type :uint16)
  (direction sdl-haptic-direction)
  (length :uint32)
  (delay :uint16)
  (button :uint16)
  (interval :uint16)
  (start :int16)
  (end :int16)
  (attack-length :uint16)
  (attack-level :uint16)
  (fade-length :uint16)
  (fade-level :uint16))

(defsdl2struct sdl-haptic-left-right
  (type :uint16)
  (length :uint32)
  (large-magnitude :uint16)
  (small-magnitude :uint16))

(defsdl2struct sdl-haptic-custom
  (type :uint16)
  (direction sdl-haptic-direction)
  (length :uint32)
  (delay :uint16)
  (button :uint16)
  (interval :uint16)
  (channels :uint8)
  (period :uint16)
  (samples :uint16)
  (data (:pointer :uint16))
  (attack-length :uint16)
  (attack-level :uint16)
  (fade-length :uint16)
  (fade-level :uint16))

(defsdl2union sdl-haptic-effect
  (type :uint16)
  (constant sdl-haptic-constant)
  (periodic sdl-haptic-periodic)
  (condition sdl-haptic-condition)
  (ramp sdl-haptic-ramp)
  (left-right sdl-haptic-left-right)
  (custom sdl-haptic-custom))

(defsdl2fun ("SDL_NumHaptics" sdl-num-haptics) :int)

(defsdl2fun ("SDL_HapticName" sdl-haptic-name) (:string :encoding :utf-8)
  (device-index :int))

(defsdl2fun ("SDL_HapticOpen" sdl-haptic-open) (:pointer sdl-haptic)
  (device-index :int))

(defsdl2fun ("SDL_HapticOpened" sdl-haptic-opened) :int
  (device-index :int))

(defsdl2fun ("SDL_MouseIsHaptic" sdl-mouse-is-haptic) :int)

(defsdl2fun ("SDL_HapticOpenFromMouse" sdl-haptic-open-from-mouse) (:pointer sdl-haptic))

(defsdl2fun ("SDL_JoystickIsHaptic" sdl-joystick-is-haptic) :int
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_HapticOpenFromJoystick" sdl-haptic-open-from-joystick) (:pointer sdl-haptic)
  (joystick (:pointer sdl-joystick)))

(defsdl2fun ("SDL_HapticClose" sdl-haptic-close) :void
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticNumEffects" sdl-haptic-num-effects) :int
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticNumEffectsPlaying" sdl-haptic-num-effects-playing) :int
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticQuery" sdl-haptic-query) :uint
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticNumAxes" sdl-haptic-num-axes) :int
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticEffectSupported" sdl-haptic-effect-supported) :int
  (haptic (:pointer sdl-haptic))
  (effect (:pointer sdl-haptic-effect)))

(defsdl2fun ("SDL_HapticNewEffect" sdl-haptic-new-effect) :int
  (haptic (:pointer sdl-haptic))
  (effect (:pointer sdl-haptic-effect)))

(defsdl2fun ("SDL_HapticUpdateEffect" sdl-haptic-update-effect) :int
  (haptic (:pointer sdl-haptic))
  (effect :int)
  (data (:pointer sdl-haptic-effect)))

(defsdl2fun ("SDL_HapticRunEffect" sdl-haptic-run-effect) :int
  (haptic (:pointer sdl-haptic))
  (effect :int)
  (iterations :uint32))

(defsdl2fun ("SDL_HapticStopEffect" sdl-haptic-stop-effect) :int
  (haptic (:pointer sdl-haptic))
  (effect :int))

(defsdl2fun ("SDL_HapticDestroyEffect" sdl-haptic-destroy-effect) :void
  (haptic (:pointer sdl-haptic))
  (effect :int))

(defsdl2fun ("SDL_HapticGetEffectStatus" sdl-haptic-get-effect-status) :int
  (haptic (:pointer sdl-haptic))
  (effect :int))

(defsdl2fun ("SDL_HapticSetGain" sdl-haptic-set-gain) :int
  (haptic (:pointer sdl-haptic))
  (gain :int))

(defsdl2fun ("SDL_HapticSetAutocenter" sdl-haptic-set-autocenter) :int
  (haptic (:pointer sdl-haptic))
  (autocenter :int))

(defsdl2fun ("SDL_HapticPause" sdl-haptic-pause) :int
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticUnpause" sdl-haptic-unpause) :int
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticRumbleSupported" sdl-haptic-rumble-supported) :int
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticRumbleInit" sdl-haptic-rumble-init) :int
  (haptic (:pointer sdl-haptic)))

(defsdl2fun ("SDL_HapticRumblePlay" sdl-haptic-rumble-play) :int
  (haptic (:pointer sdl-haptic))
  (strength :float)
  (length :uint32))

(defsdl2fun ("SDL_HapticRumbleStop" sdl-haptic-rumble-stop) :int
  (haptic (:pointer sdl-haptic)))
