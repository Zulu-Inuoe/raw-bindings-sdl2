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

(defsdl2enum sdl-message-box-flags
  (+sdl-messagebox-error+ #x00000010)
  (+sdl-messagebox-warning+ #x00000020)
  (+sdl-messagebox-information+ #x00000040))

(defsdl2enum sdl-message-box-button-flags
  (+sdl-messagebox-button-returnkey-default+ #x00000001)
  (+sdl-messagebox-button-escapekey-default+ #x00000002))

(defsdl2struct sdl-message-box-button-data
  (flags :uint32)
  (buttonid :int)
  (text (:pointer :char)))

(defsdl2struct sdl-message-box-color
  (r :uint8)
  (g :uint8)
  (b :uint8))

(defsdl2enum sdl-message-box-color-type
  +sdl-messagebox-color-background+
  +sdl-messagebox-color-text+
  +sdl-messagebox-color-button-border+
  +sdl-messagebox-color-button-background+
  +sdl-messagebox-color-button-selected+
  +sdl-messagebox-color-max+)

(defsdl2struct sdl-message-box-color-scheme
  (colors sdl-message-box-color :count #.+sdl-messagebox-color-max+))

(defsdl2struct sdl-message-box-data
  (flags :uint32)
  (window (:pointer sdl-window))
  (title (:pointer :char))
  (message (:pointer :char))
  (numbuttons :int)
  (buttons (:pointer sdl-message-box-button-data))
  (color-scheme (:pointer sdl-message-box-color-scheme)))

(defsdl2fun ("SDL_ShowMessageBox" sdl-show-message-box) :int
  (messagebox-data (:pointer sdl-message-box-data))
  (button-id (:pointer :int)))

(defsdl2fun ("SDL_ShowSimpleMessageBox" sdl-show-simple-message-box) :int
  (flags :uint32)
  (title (:string :encoding :utf-8))
  (message (:string :encoding :utf-8))
  (window (:pointer sdl-window)))
