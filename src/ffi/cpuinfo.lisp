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

(defsdl2constant +sdl-cacheline-size+ 128)

(defsdl2fun ("SDL_GetCPUCount" sdl-get-cpucount) :int)

(defsdl2fun ("SDL_GetCPUCacheLineSize" sdl-get-cpu-cache-line-size) :int)

(defsdl2fun ("SDL_HasRDTSC" sdl-has-rdtsc) sdl-bool)

(defsdl2fun ("SDL_HasAltiVec" sdl-has-alti-vec) sdl-bool)

(defsdl2fun ("SDL_HasMMX" sdl-has-mmx) sdl-bool)

(defsdl2fun ("SDL_Has3DNow" sdl-has3dnow) sdl-bool)

(defsdl2fun ("SDL_HasSSE" sdl-has-sse) sdl-bool)

(defsdl2fun ("SDL_HasSSE2" sdl-has-sse2) sdl-bool)

(defsdl2fun ("SDL_HasSSE3" sdl-has-sse3) sdl-bool)

(defsdl2fun ("SDL_HasSSE41" sdl-has-sse41) sdl-bool)

(defsdl2fun ("SDL_HasSSE42" sdl-has-sse42) sdl-bool)

(defsdl2fun ("SDL_HasAVX" sdl-has-avx) sdl-bool)

(defsdl2fun ("SDL_HasAVX2" sdl-has-avx2) sdl-bool)

(defsdl2fun ("SDL_HasNEON" sdl-has-neon) sdl-bool)

(defsdl2fun ("SDL_GetSystemRAM" sdl-get-system-ram) :int)
