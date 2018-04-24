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

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun gen-defconstants-from-enum (enum-list)
    (let ((next-value 0))
      (mapcar
       (lambda (spec)
         (let ((name (if (atom spec)
                         spec
                         (car spec)))
               (value (if (atom spec)
                          next-value
                          (cadr spec))))
           (setf next-value (1+ value))
           `(defconstant ,name ,value)))
       ;;Skip docstring if present
       (if (typep (car enum-list) 'string)
           (cdr enum-list)
           enum-list)))))

(defmacro defsdl2constant (name value &optional doc)
  "Wrapper around `defconstant' which exports the constant."
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (eval-when (:compile-toplevel :load-toplevel :execute)
       (defparameter ,name ,value ,doc))
     (export ',name)))

(defmacro defsdl2enum (name &body enum-list)
  "Wrapper around `defcenum' which exports the enum type and each enum name within."
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (cffi:defctype ,name :int)
     ,@(gen-defconstants-from-enum enum-list)

     ;;Export enum name
     (export ',name)

     ;;Export each enum value
     (export
      ',(mapcar
         (lambda (spec)
           (if (atom spec)
               spec
               (car spec)))
         ;;Skip docstring if present
         (if (typep (car enum-list) 'string)
             (cdr enum-list)
             enum-list)))
     ;;Return name of enum
     ',name))

(defmacro defsdl2type (name base-type &optional documentation)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (cffi:defctype ,name ,base-type ,documentation)

     ;;Export name
     (export ',name)

     ;;Return name of type
     ',name))

(defmacro defsdl2struct (name &body fields)
  "Wrapper around `defcstruct' which also defines a type for the struct, and exports all of its fields."
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (cffi:defcstruct ,name
       ,@fields)

     ;;typedef it
     (cffi:defctype ,name (:struct ,name))

     ;;Export name
     (export ',name)

     ;;Export each field
     (export ',(mapcar #'car (if (typep (car fields) 'string) (cdr fields) fields)))

     ;;Return name of struct
     ',name))

(defmacro defsdl2union (name &body fields)
  "Wrapper around `defcunion' which exports the union and all of its fields."
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (cffi:defcunion ,name
       ,@fields)

     ;;typedef it
     (cffi:defctype ,name (:union ,name))

     ;;Export name
     (export ',name)

     ;;Export each member
     (export ',(mapcar #'car (if (typep (car fields) 'string) (cdr fields) fields)))

     ;;Return name of union
     ',name))

(defmacro defsdl2fun ((c-name lisp-name) return-type &body args)
  "Wrapper around `defcfun' that sets the library and convention to the correct values, and performs an EXPORT of the lisp name."
  (assert (typep c-name 'string))
  (assert (and (symbolp lisp-name)
               (not (keywordp lisp-name))))
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (cffi:defcfun (,c-name ,lisp-name :library libsdl2 :convention :stdcall) ,return-type
       ,@args)

     ;;Export the lisp name of the function
     (export ',lisp-name)

     ;;Return the lisp-name
     ',lisp-name))

(defmacro defsdl2-lispfun (name lambda-list &body body)
  "Wrapper around `defun' which additionally exports the function name.
Meant to be used around sdl2 C preprocessor macros which have to be implemented as lisp functions."
  (assert (and (symbolp name)
               (not (keywordp name))))
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (defun ,name ,lambda-list
       ,@body)

     ;;Export it
     (export ',name)

       ;;Return the name
     ',name))
