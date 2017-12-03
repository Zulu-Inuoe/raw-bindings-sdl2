# raw-bindings-sdl2

## Overview

Low level (raw) Common Lisp bindings to the [SDL2](https://www.libsdl.org/) library.

## Dependencies

* [cffi](https://common-lisp.net/project/cffi/)
* [defpackage-plus](https://github.com/rpav/defpackage-plus)
* [libffi](https://sourceware.org/libffi/) runtime library (optional, see below)
* [SDL2](https://www.libsdl.org/) version 2.0.6 runtime libraries

Certain, relatively obscure SDL2 functions require foreign-structures-by-value. This is provided by the cffi-libffi system, which in term depends on the libffi native runtime library.

If cffi-libffi is loaded at read-time, these functions will be available, otherwise they will not be defined.

These functions are enumerated here:

Joystick:

* SDL_JoystickGetDeviceGUID
* SDL_JoystickGetGUID
* SDL_JoystickGetGUIDString
* SDL_JoystickGetGUIDFromString

GameController:

* SDL_GameControllerMappingForGUID
* SDL_GameControllerGetBindForAxis
* SDL_GameControllerGetBindForButton

## Notes

This is a low level library meant to have minimal fluff.

In that vein, keep the following in mind:

* No returned pointers are set up for [finalization](https://common-lisp.net/project/trivial-garbage/).
    * If you decide to implement such a scheme keep in mind that SDL objects are thread sensitive, and must be cleaned up in the same thread they were created. Also that finalization occurs in an unknown thread.
* No error codes are checked for you and coerced to errors.
* No integer values are coerced to booleans, not even sdl-bool.