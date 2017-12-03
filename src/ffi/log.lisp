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

(defsdl2constant +sdl-max-log-message+ 4096)

(defsdl2enum sdl-log-category
  +sdl-log-category-application+
  +sdl-log-category-error+
  +sdl-log-category-assert+
  +sdl-log-category-system+
  +sdl-log-category-audio+
  +sdl-log-category-video+
  +sdl-log-category-render+
  +sdl-log-category-input+
  +sdl-log-category-test+
  +sdl-log-category-reserved1+
  +sdl-log-category-reserved2+
  +sdl-log-category-reserved3+
  +sdl-log-category-reserved4+
  +sdl-log-category-reserved5+
  +sdl-log-category-reserved6+
  +sdl-log-category-reserved7+
  +sdl-log-category-reserved8+
  +sdl-log-category-reserved9+
  +sdl-log-category-reserved10+
  +sdl-log-category-custom+)

(defsdl2enum sdl-log-priority
  (+sdl-log-priority-verbose+ 1)
  +sdl-log-priority-debug+
  +sdl-log-priority-info+
  +sdl-log-priority-warn+
  +sdl-log-priority-error+
  +sdl-log-priority-critical+
  +sdl-num-log-priorities+)

(defsdl2fun ("SDL_LogSetAllPriority" sdl-log-set-all-priority) :void
  (priority sdl-log-priority))

(defsdl2fun ("SDL_LogSetPriority" sdl-log-set-priority) :void
  (category :int)
  (priority sdl-log-priority))

(defsdl2fun ("SDL_LogGetPriority" sdl-log-get-priority) sdl-log-priority
  (category :int))

(defsdl2fun ("SDL_LogResetPriorities" sdl-log-reset-priorities) :void)

(defsdl2fun ("SDL_Log" sdl-log) :void
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_LogVerbose" sdl-log-verbose) :void
  (category :int)
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_LogDebug" sdl-log-debug) :void
  (category :int)
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_LogInfo" sdl-log-info) :void
  (category :int)
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_LogWarn" sdl-log-warn) :void
  (category :int)
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_LogError" sdl-log-error) :void
  (category :int)
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_LogCritical" sdl-log-critical) :void
  (category :int)
  (fmt (:string :encoding :utf-8))
  &rest)

(defsdl2fun ("SDL_LogMessage" sdl-log-message) :void
  (category :int)
  (priority sdl-log-priority)
  (fmt (:string :encoding :utf-8))
  &rest)

;;No support for va_list
#+nil
(defsdl2fun ("SDL_LogMessageV" sdl-log-message-v) :void
  (category :int)
  (priority sdl-log-priority)
  (fmt (:string :encoding :utf-8))
  (ap va_list))

(defsdl2type sdl-log-output-function :pointer)

(defsdl2fun ("SDL_LogGetOutputFunction" sdl-log-get-output-function) :void
  (callback (:pointer sdl-log-output-function))
  (user-data (:pointer :pointer)))

(defsdl2fun ("SDL_LogSetOutputFunction" sdl-log-set-output-function) :void
  (callback sdl-log-output-function)
  (userdata :pointer))
