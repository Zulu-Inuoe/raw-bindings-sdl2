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

(defsdl2type sdl-audio-format :uint16)

(defsdl2constant +sdl-audio-mask-bitsize+  #xFF)
(defsdl2constant +sdl-audio-mask-datatype+ (logior 1 8))
(defsdl2constant +sdl-audio-mask-endian+   (logior 1 12))
(defsdl2constant +sdl-audio-mask-signed+   (logior 1 15))

(defsdl2-lispfun sdl-audio-bitsize (x)
  (logand x +sdl-audio-mask-bitsize+))

(defsdl2-lispfun sdl-audio-isfloat (x)
  (logand x +sdl-audio-mask-datatype+))

(defsdl2-lispfun sdl-audio-isbigendian (x)
  (logand x +sdl-audio-mask-endian+))

(defsdl2-lispfun sdl-audio-issigned (x)
  (logand x +sdl-audio-mask-signed+))

(defsdl2-lispfun sdl-audio-isint (x)
  (if (sdl-audio-isfloat x) 0 1))

(defsdl2-lispfun sdl-audio-islittleendian (x)
  (if (sdl-audio-isbigendian x) 0 1))

(defsdl2-lispfun sdl-audio-isunsigned (x)
  (if (sdl-audio-issigned x) 0 1))

(defsdl2constant +audio-u8+        #x0008)
(defsdl2constant +audio-s8+        #x8008)
(defsdl2constant +audio-u16lsb+    #x0010)
(defsdl2constant +audio-s16lsb+    #x8010)
(defsdl2constant +audio-u16msb+    #x1010)
(defsdl2constant +audio-s16msb+    #x9010)
(defsdl2constant +audio-u16+       +audio-u16lsb+)
(defsdl2constant +audio-s16+       +audio-s16lsb+)

(defsdl2constant +audio-s32lsb+    #x8020)
(defsdl2constant +audio-s32msb+    #x9020)
(defsdl2constant +audio-s32+       +audio-s32lsb+)

(defsdl2constant +audio-f32lsb+    #x8120)
(defsdl2constant +audio-f32msb+    #x9120)
(defsdl2constant +audio-f32+       +audio-f32lsb+)

#+little-endian
(progn
  (defsdl2constant +audio-u16sys+    +audio-u16lsb+)
  (defsdl2constant +audio-s16sys+    +audio-s16lsb+)
  (defsdl2constant +audio-s32sys+    +audio-s32lsb+)
  (defsdl2constant +audio-f32sys+    +audio-f32lsb+))
#+big-endian
(progn
  (defsdl2constant +audio-u16sys+    +audio-u16msb)
  (defsdl2constant +audio-s16sys+    +audio-s16msb)
  (defsdl2constant +audio-s32sys+    +audio-s32msb)
  (defsdl2constant +audio-f32sys+    +audio-f32msb))


(defsdl2constant +sdl-audio-allow-frequency-change+    #x00000001)
(defsdl2constant +sdl-audio-allow-format-change+       #x00000002)
(defsdl2constant +sdl-audio-allow-channels-change+     #x00000004)
(defsdl2constant +sdl-audio-allow-any-change+          (logior +sdl-audio-allow-frequency-change+
                                                               +sdl-audio-allow-format-change+
                                                               +sdl-audio-allow-channels-change+))
(defsdl2type sdl-audio-callback :pointer)

(defsdl2struct sdl-audio-spec
  (freq :int)
  (format sdl-audio-format)
  (channels :uint8)
  (silence :uint8)
  (samples :uint16)
  (padding :uint16)
  (size :uint32)
  (callback sdl-audio-callback)
  (userdata :pointer))

(defsdl2struct sdl-audio-cvt)

(defsdl2type sdl-audio-filter :pointer)

(defsdl2constant +sdl-audio-cvt-max-filters+ 9)

(defsdl2struct sdl-audio-cvt
  (needed :int)
  (src-format sdl-audio-format)
  (dst-format sdl-audio-format)
  (rate-incr :double)
  (buf (:pointer :uint8))
  (len :int)
  (len-cvt :int)
  (len-mult :int)
  (len-ratio :double)
  (filters sdl-audio-filter :count #.(1+ +sdl-audio-cvt-max-filters+))
  (filter-index :int))

(defsdl2fun ("SDL_GetNumAudioDrivers" sdl_get-num-audio-drivers) :int)

(defsdl2fun ("SDL_GetAudioDriver" sdl-get-audio-driver) (:string :encoding :utf-8)
  (index :int))

(defsdl2fun ("SDL_AudioInit" sdl-audio-init) :int
  (driver-name (:string :encoding :utf-8)))

(defsdl2fun ("SDL_AudioQuit" sdl-audio-quit) :void)

(defsdl2fun ("SDL_GetCurrentAudioDriver"  sdl-get-current-audio-driver) (:string :encoding :utf-8))

(defsdl2fun ("SDL_OpenAudio" sdl-open-audio) :int
  (desired (:pointer sdl-audio-spec))
  (obtained (:pointer sdl-audio-spec)))

(defsdl2type sdl-audio-device-id :uint32)

(defsdl2fun ("SDL_GetNumAudioDevices" sdl-get-num-audio-devices) :int
  (is-capture :int))

(defsdl2fun ("SDL_GetAudioDeviceName" sdl-get-audio-device-name) (:string :encoding :utf-8)
  (index :int)
  (is-capture :int))

(defsdl2fun ("SDL_OpenAudioDevice" sdl-open-audio-device) sdl-audio-device-id
  (device (:string :encoding :utf-8))
  (iscapture :int)
  (desired (:pointer sdl-audio-spec))
  (obtained (:pointer sdl-audio-spec))
  (allowed-changes :int))

(defsdl2enum sdl-audio-status
  (+sdl-audio-stopped+ 0)
  +sdl-audio-playing+
  +sdl-audio-paused+)

(defsdl2fun ("SDL_GetAudioStatus" sdl-get-audio-status) sdl-audio-status)

(defsdl2fun ("SDL_GetAudioDeviceStatus" sdl-get-audio-device-status) sdl-audio-status
  (dev sdl-audio-device-id))

(defsdl2fun ("SDL_PauseAudio" sdl-pause-audio) :void
  (pause-on :int))

(defsdl2fun ("SDL_PauseAudioDevice" sdl-pause-audio-device) :void
  (dev sdl-audio-device-id)
  (pause-on :int))

(defsdl2fun ("SDL_LoadWAV_RW" sdl-load-wav-rw) (:pointer sdl-audio-spec)
  (src (:pointer sdl-rwops))
  (freesrc :int)
  (spec (:pointer sdl-audio-spec))
  (audio-buf (:pointer (:pointer :uint8)))
  (audio-len (:pointer :uint32)))

(defsdl2-lispfun sdl-load-wav (file spec audio-bug audio-len)
  (sdl-load-wav-rw (sdl-rw-from-file file "rb") 1 spec audio-bug audio-len))

(defsdl2fun ("SDL_FreeWAV" sdl-free-wav) :void
  (audio_buf (:pointer :uint8)))

(defsdl2fun ("SDL_BuildAudioCVT" sdl-build-audio-cvt) :int
  (cvt (:pointer sdl-audio-cvt))
  (src-format sdl-audio-format)
  (src-channels :uint8)
  (src-rate :int)
  (dst-format sdl-audio-format)
  (dst-channels :uint8)
  (dst-rate :int))

(defsdl2fun ("SDL_ConvertAudio" sdl-convert-audio) :int
  (cvt (:pointer sdl-audio-cvt)))

(defsdl2constant +sdl-mix-maxvolume+ 128)

(defsdl2fun ("SDL_MixAudio" sdl-mix-audio) :void
  (dst (:pointer :uint8))
  (src (:pointer :uint8))
  (len :uint32)
  (volume :int))

(defsdl2fun ("SDL_MixAudioFormat" sdl-mix-audio-format) :void
  (dst (:pointer :uint8))
  (src (:pointer :uint8))
  (format sdl-audio-format)
  (len :uint32)
  (volume :int))

(defsdl2fun ("SDL_QueueAudio" sdl-queue-audio) :int
  (dev sdl-audio-device-id)
  (data :pointer)
  (len :uint32))

(defsdl2fun ("SDL_DequeueAudio" sdl-dequeue-audio) :uint32
  (dev sdl-audio-device-id)
  (data :pointer)
  (len :uint32))

(defsdl2fun ("SDL_GetQueuedAudioSize" sdl-get-queued-audio-size) :uint32
  (dev sdl-audio-device-id))

(defsdl2fun ("SDL_ClearQueuedAudio" sdl-clear-queued-audio) :void
  (dev sdl-audio-device-id))

(defsdl2fun ("SDL_LockAudio" sdl-lock-audio) :void)

(defsdl2fun ("SDL_LockAudioDevice" sdl-lock-audio-device) :void
  (dev sdl-audio-device-id))

(defsdl2fun ("SDL_UnlockAudio" sdl-unlock-audio) :void)

(defsdl2fun ("SDL_UnlockAudioDevice" sdl-unlock-audio-device) :void
  (dev sdl-audio-device-id))

(defsdl2fun ("SDL_CloseAudio" sdl-close-audio) :void)

(defsdl2fun ("SDL_CloseAudioDevice" sdl-close-audio-device) :void
  (dev sdl-audio-device-id))
