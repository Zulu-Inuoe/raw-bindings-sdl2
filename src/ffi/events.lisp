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

(defsdl2constant +sdl-released+ 0)
(defsdl2constant +sdl-pressed+ 1)

(defsdl2enum sdl-event-type
  (+sdl-firstevent+ 0)

  (+sdl-quit+ #x100)

  +sdl-app-terminating+
  +sdl-app-lowmemory+
  +sdl-app-willenterbackground+
  +sdl-app-didenterbackground+
  +sdl-app-willenterforeground+
  +sdl-app-didenterforeground+

  (+sdl-window-event+ #x200)
  +sdl-syswmevent+

  (+sdl-keydown+ #x300)
  +sdl-keyup+
  +sdl-textediting+
  +sdl-textinput+
  +sdl-keymapchanged+

  (+sdl-mousemotion+ #x400)
  +sdl-mousebuttondown+
  +sdl-mousebuttonup+
  +sdl-mousewheel+

  (+sdl-joyaxismotion+ #x600)
  +sdl-joyballmotion+
  +sdl-joyhatmotion+
  +sdl-joybuttondown+
  +sdl-joybuttonup+
  +sdl-joydeviceadded+
  +sdl-joydeviceremoved+

  (+sdl-controlleraxismotion+ #x650)
  +sdl-controllerbuttondown+
  +sdl-controllerbuttonup+
  +sdl-controllerdeviceadded+
  +sdl-controllerdeviceremoved+
  +sdl-controllerdeviceremapped+

  (+sdl-fingerdown+ #x700)
  +sdl-fingerup+
  +sdl-fingermotion+

  (+sdl-dollargesture+ #x800)
  +sdl-dollarrecord+
  +sdl-multigesture+

  (+sdl-clipboardupdate+ #x900)

  (+sdl-dropfile+ #x1000)
  +sdl-droptext+
  +sdl-dropbegin+
  +sdl-dropcomplete+

  (+sdl-audiodeviceadded+ #x1100)
  +sdl-audiodeviceremoved+

  (render-targets-reset #x2000)
  +sdl-render-device-reset+

  (+sdl-userevent+ #x8000)

  (+sdl-lastevent+ #xFFFF))

(defsdl2struct sdl-common-event
  (type :uint32)
  (timestamp :uint32))

(defsdl2struct sdl-window-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (event :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (data1 :int32)
  (data2 :int32))

(defsdl2struct sdl-
  (type :uint32)
  (timestamp :uint32))

(defsdl2struct sdl-keyboard-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (state :uint8)
  (repeat :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (keysym sdl-keysym))

(defsdl2constant +sdl-texteditingevent-text-size+ 32)

(defsdl2struct sdl-text-editing-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (text :char :count #.+sdl-texteditingevent-text-size+)
  (start :int32)
  (length :int32))

(defsdl2constant +sdl-textinputevent-text-size+ 32)

(defsdl2struct sdl-text-input-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (text :char :count #.+sdl-textinputevent-text-size+))

(defsdl2struct sdl-mouse-motion-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (which :uint32)
  (state :uint32)
  (x :int32)
  (y :int32)
  (xrel :int32)
  (yrel :int32))

(defsdl2struct sdl-mouse-button-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (which :uint32)
  (button :uint8)
  (state :uint8)
  (clicks :uint8)
  (padding1 :uint8)
  (x :int32)
  (y :int32))

(defsdl2struct sdl-mouse-wheel-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (which :uint32)
  (x :int32)
  (y :int32)
  (direction :uint32))

(defsdl2struct sdl-joy-axis-event
  (type :uint32)
  (timestamp :uint32)
  (which sdl-joystick-id)
  (axis :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (value :int16)
  (padding4 :uint16))

(defsdl2struct sdl-joy-ball-event
  (type :uint32)
  (timestamp :uint32)
  (which sdl-joystick-id)
  (ball :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (xrel :int16)
  (yrel :int16))

(defsdl2struct sdl-joy-hat-event
  (type :uint32)
  (timestamp :uint32)
  (which sdl-joystick-id)
  (hat :uint8)
  (value :uint8)
  (padding1 :uint8)
  (padding2 :uint8))

(defsdl2struct sdl-joy-button-event
  (type :uint32)
  (timestamp :uint32)
  (which sdl-joystick-id)
  (button :uint8)
  (state :uint8)
  (padding1 :uint8)
  (padding2 :uint8))

(defsdl2struct sdl-joy-device-event
  (type :uint32)
  (timestamp :uint32)
  (which :int32))

(defsdl2struct sdl-controller-axis-event
  (type :uint32)
  (timestamp :uint32)
  (which sdl-joystick-id)
  (axis :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8)
  (value :int16)
  (padding4 :uint16))

(defsdl2struct sdl-controller-button-event
  (type :uint32)
  (timestamp :uint32)
  (which sdl-joystick-id)
  (button :uint8)
  (state :uint8)
  (padding1 :uint8)
  (padding2 :uint8))

(defsdl2struct sdl-controller-device-event
  (type :uint32)
  (timestamp :uint32)
  (which :int32))

(defsdl2struct sdl-audio-device-event
  (type :uint32)
  (timestamp :uint32)
  (which :uint32)
  (is-capture :uint8)
  (padding1 :uint8)
  (padding2 :uint8)
  (padding3 :uint8))

(defsdl2struct sdl-touch-finger-event
  (type :uint32)
  (timestamp :uint32)
  (touch-id sdl-touch-id)
  (finger-id sdl-finger-id)
  (x :float)
  (y :float)
  (dx :float)
  (dy :float)
  (pressure :float))

(defsdl2struct sdl-multi-gesture-event
  (type :uint32)
  (timestamp :uint32)
  (touch-id sdl-touch-id)
  (dtheta :float)
  (ddist :float)
  (x :float)
  (y :float)
  (num-fingers :uint16)
  (padding :uint16))

(defsdl2struct sdl-dollar-gesture-event
  (type :uint32)
  (timestamp :uint32)
  (touch-id sdl-touch-id)
  (gesture-id sdl-gesture-id)
  (num-fingers :uint32)
  (error :float)
  (x :float)
  (y :float))

(defsdl2struct sdl-drop-event
  (type :uint32)
  (timestamp :uint32)
  (file (:pointer :char))
  (window-id :uint32))

(defsdl2struct sdl-quit-event
  (type :uint32)
  (timestamp :uint32))

(defsdl2struct sdl-os-event
  (type :uint32)
  (timestamp :uint32))

(defsdl2struct sdl-user-event
  (type :uint32)
  (timestamp :uint32)
  (window-id :uint32)
  (code :int32)
  (data1 :pointer)
  (data2 :pointer))

(defsdl2struct sdl-syswm-msg
  (version sdl-version)
  (subsystem sdl-syswm-type)
  (dummy :int)
  #+os-windows
  (win.hwnd win32:hwnd)
  (win.msg win32:uint)
  (win.wparam win32:wparam)
  (win.lparam win32:lparam))

(defsdl2struct sdl-syswm-event
  (type :uint32)
  (timestamp :uint32)
  (msg (:pointer sdl-syswm-msg)))

(defsdl2union sdl-event
  (type :uint32)
  (common sdl-common-event)
  (window sdl-window-event)
  (key sdl-keyboard-event)
  (edit sdl-text-editing-event)
  (text sdl-text-input-event)
  (motion sdl-mouse-motion-event)
  (button sdl-mouse-button-event)
  (wheel sdl-mouse-wheel-event)
  (jaxis sdl-joy-axis-event)
  (jball sdl-joy-ball-event)
  (jhat sdl-joy-hat-event)
  (jbutton sdl-joy-button-event)
  (jdevice sdl-joy-device-event)
  (caxis sdl-controller-axis-event)
  (cbutton sdl-controller-button-event)
  (cdevice sdl-controller-device-event)
  (adevice sdl-audio-device-event)
  (quit sdl-quit-event)
  (user sdl-user-event)
  (syswm sdl-syswm-event)
  (tfinger sdl-touch-finger-event)
  (mgesture sdl-multi-gesture-event)
  (dgesture sdl-dollar-gesture-event)
  (drop sdl-drop-event)
  (padding :uint8 :count 56))

(defsdl2fun ("SDL_PumpEvents" sdl-pump-events) :void)

(defsdl2enum sdl-eventaction
  +sdl-addevent+
  +sdl-peekevent+
  +sdl-getevent+)

(defsdl2fun ("SDL_PeepEvents" sdl-peep-events) :int
  (events (:pointer sdl-event))
  (num-events :int)
  (action sdl-eventaction)
  (mintype :uint32)
  (maxtype :uint32))
(defsdl2fun ("SDL_HasEvent" sdl-has-event) sdl-bool
  (type :uint32))

(defsdl2fun ("SDL_HasEvents" sdl-has-events) sdl-bool
  (mintype :uint32)
  (maxtype :uint32))
(defsdl2fun ("SDL_FlushEvent" sdl-flush-event) :void
  (type :uint32))

(defsdl2fun ("SDL_FlushEvents" sdl-flush-events) :void
  (mintype :uint32)
  (maxtype :uint32))

(defsdl2fun ("SDL_PollEvent" sdl-poll-event) :int
  (event (:pointer sdl-event)))
(defsdl2fun ("SDL_WaitEvent" sdl-wait-event) :int
  (event (:pointer sdl-event)))

(defsdl2fun ("SDL_WaitEventTimeout" sdl-wait-event-timeout) :int
  (event (:pointer sdl-event))
  (timeout :int))

(defsdl2fun ("SDL_PushEvent" sdl-push-event) :int
  (event (:pointer sdl-event)))

(defsdl2type sdl-event-filter :pointer)

(defsdl2fun ("SDL_SetEventFilter" sdl-set-event-filter) :void
  (filter sdl-event-filter)
  (userdata :pointer))

(defsdl2fun ("SDL_GetEventFilter" sdl-get-event-filter) sdl-bool
  (filter (:pointer sdl-event-filter))
  (userdata (:pointer :pointer)))

(defsdl2fun ("SDL_AddEventWatch" sdl-add-event-watch) :void
  (filter sdl-event-filter)
  (userdata :pointer))

(defsdl2fun ("SDL_DelEventWatch" sdl-del-event-watch) :void
  (filter sdl-event-filter)
  (userdata :pointer))

(defsdl2fun ("SDL_FilterEvents" sdl-filter-events) :void
  (filter sdl-event-filter)
  (userdata :pointer))

(defsdl2constant +sdl-query+ -1)
(defsdl2constant +sdl-ignore+ 0)
(defsdl2constant +sdl-disable+ 0)
(defsdl2constant +sdl-enable+ 1)

(defsdl2fun ("SDL_EventState" sdl-event-state) :uint8
  (type :uint32)
  (state :int))

(defsdl2-lispfun sdl-get-event-state (type)
  (sdl-event-state type +sdl-query+))

(defsdl2fun ("SDL_RegisterEvents" sdl-register-events) :uint32
  (num-events :int))
