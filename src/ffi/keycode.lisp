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
  (defsdl2-lispfun sdl-scancode-to-keycode (x)
    (logior x (ash 1 30))))

(defsdl2enum sdl-keycode
  (+sdlk-unknown+ 0)
  (+sdlk-return+ #.(char-code #\Return))
  (+sdlk-escape+ #.(char-code #\Escape))
  (+sdlk-backspace+ #.(char-code #\Backspace))
  (+sdlk-tab+ #.(char-code #\Tab))
  (+sdlk-space+ #.(char-code #\Space))
  (+sdlk-exclaim+ #.(char-code #\!))
  (+sdlk-quotedbl+ #.(char-code #\"))
  (+sdlk-hash+ #.(char-code #\#))
  (+sdlk-percent+ #.(char-code #\%))
  (+sdlk-dollar+ #.(char-code #\$))
  (+sdlk-ampersand+ #.(char-code #\&))
  (+sdlk-quote+ #.(char-code #\'))
  (+sdlk-leftparen+ #.(char-code #\())
  (+sdlk-rightparen+ #.(char-code #\)))
  (+sdlk-asterisk+ #.(char-code #\*))
  (+sdlk-plus+ #.(char-code #\+))
  (+sdlk-comma+ #.(char-code #\,))
  (+sdlk-minus+ #.(char-code #\-))
  (+sdlk-period+ #.(char-code #\.))
  (+sdlk-slash+ #.(char-code #\/))
  (+sdlk-0+ #.(char-code #\0))
  (+sdlk-1+ #.(char-code #\1))
  (+sdlk-2+ #.(char-code #\2))
  (+sdlk-3+ #.(char-code #\3))
  (+sdlk-4+ #.(char-code #\4))
  (+sdlk-5+ #.(char-code #\5))
  (+sdlk-6+ #.(char-code #\6))
  (+sdlk-7+ #.(char-code #\7))
  (+sdlk-8+ #.(char-code #\8))
  (+sdlk-9+ #.(char-code #\9))
  (+sdlk-colon+ #.(char-code #\:))
  (+sdlk-semicolon+ #.(char-code #\;))
  (+sdlk-less+ #.(char-code #\<))
  (+sdlk-equals+ #.(char-code #\=))
  (+sdlk-greater+ #.(char-code #\>))
  (+sdlk-question+ #.(char-code #\?))
  (+sdlk-at+ #.(char-code #\@))
  (+sdlk-leftbracket+ #.(char-code #\[))
  (+sdlk-backslash+ #.(char-code #\\))
  (+sdlk-rightbracket+ #.(char-code #\]))
  (+sdlk-caret+ #.(char-code #\^))
  (+sdlk-underscore+ #.(char-code #\_))
  (+sdlk-backquote+ #.(char-code #\`))
  (+sdlk-a+ #.(char-code #\a))
  (+sdlk-b+ #.(char-code #\b))
  (+sdlk-c+ #.(char-code #\c))
  (+sdlk-d+ #.(char-code #\d))
  (+sdlk-e+ #.(char-code #\e))
  (+sdlk-f+ #.(char-code #\f))
  (+sdlk-g+ #.(char-code #\g))
  (+sdlk-h+ #.(char-code #\h))
  (+sdlk-i+ #.(char-code #\i))
  (+sdlk-j+ #.(char-code #\j))
  (+sdlk-k+ #.(char-code #\k))
  (+sdlk-l+ #.(char-code #\l))
  (+sdlk-m+ #.(char-code #\m))
  (+sdlk-n+ #.(char-code #\n))
  (+sdlk-o+ #.(char-code #\o))
  (+sdlk-p+ #.(char-code #\p))
  (+sdlk-q+ #.(char-code #\q))
  (+sdlk-r+ #.(char-code #\r))
  (+sdlk-s+ #.(char-code #\s))
  (+sdlk-t+ #.(char-code #\t))
  (+sdlk-u+ #.(char-code #\u))
  (+sdlk-v+ #.(char-code #\v))
  (+sdlk-w+ #.(char-code #\w))
  (+sdlk-x+ #.(char-code #\x))
  (+sdlk-y+ #.(char-code #\y))
  (+sdlk-z+ #.(char-code #\z))
  (+sdlk-capslock+ #.(sdl-scancode-to-keycode +sdl-scancode-capslock+))
  (+sdlk-f1+ #.(sdl-scancode-to-keycode +sdl-scancode-f1+))
  (+sdlk-f2+ #.(sdl-scancode-to-keycode +sdl-scancode-f2+))
  (+sdlk-f3+ #.(sdl-scancode-to-keycode +sdl-scancode-f3+))
  (+sdlk-f4+ #.(sdl-scancode-to-keycode +sdl-scancode-f4+))
  (+sdlk-f5+ #.(sdl-scancode-to-keycode +sdl-scancode-f5+))
  (+sdlk-f6+ #.(sdl-scancode-to-keycode +sdl-scancode-f6+))
  (+sdlk-f7+ #.(sdl-scancode-to-keycode +sdl-scancode-f7+))
  (+sdlk-f8+ #.(sdl-scancode-to-keycode +sdl-scancode-f8+))
  (+sdlk-f9+ #.(sdl-scancode-to-keycode +sdl-scancode-f9+))
  (+sdlk-f10+ #.(sdl-scancode-to-keycode +sdl-scancode-f10+))
  (+sdlk-f11+ #.(sdl-scancode-to-keycode +sdl-scancode-f11+))
  (+sdlk-f12+ #.(sdl-scancode-to-keycode +sdl-scancode-f12+))
  (+sdlk-printscreen+ #.(sdl-scancode-to-keycode +sdl-scancode-printscreen+))
  (+sdlk-scrolllock+ #.(sdl-scancode-to-keycode +sdl-scancode-scrolllock+))
  (+sdlk-pause+ #.(sdl-scancode-to-keycode +sdl-scancode-pause+))
  (+sdlk-insert+ #.(sdl-scancode-to-keycode +sdl-scancode-insert+))
  (+sdlk-home+ #.(sdl-scancode-to-keycode +sdl-scancode-home+))
  (+sdlk-pageup+ #.(sdl-scancode-to-keycode +sdl-scancode-pageup+))
  (+sdlk-delete+ #.(char-code #\Delete))
  (+sdlk-end+ #.(sdl-scancode-to-keycode +sdl-scancode-end+))
  (+sdlk-pagedown+ #.(sdl-scancode-to-keycode +sdl-scancode-pagedown+))
  (+sdlk-right+ #.(sdl-scancode-to-keycode +sdl-scancode-right+))
  (+sdlk-left+ #.(sdl-scancode-to-keycode +sdl-scancode-left+))
  (+sdlk-down+ #.(sdl-scancode-to-keycode +sdl-scancode-down+))
  (+sdlk-up+ #.(sdl-scancode-to-keycode +sdl-scancode-up+))
  (+sdlk-numlockclear+ #.(sdl-scancode-to-keycode +sdl-scancode-numlockclear+))
  (+sdlk-kp-divide+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-divide+))
  (+sdlk-kp-multiply+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-multiply+))
  (+sdlk-kp-minus+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-minus+))
  (+sdlk-kp-plus+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-plus+))
  (+sdlk-kp-enter+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-enter+))
  (+sdlk-kp-1+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-1+))
  (+sdlk-kp-2+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-2+))
  (+sdlk-kp-3+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-3+))
  (+sdlk-kp-4+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-4+))
  (+sdlk-kp-5+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-5+))
  (+sdlk-kp-6+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-6+))
  (+sdlk-kp-7+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-7+))
  (+sdlk-kp-8+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-8+))
  (+sdlk-kp-9+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-9+))
  (+sdlk-kp-0+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-0+))
  (+sdlk-kp-period+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-period+))
  (+sdlk-application+ #.(sdl-scancode-to-keycode +sdl-scancode-application+))
  (+sdlk-power+ #.(sdl-scancode-to-keycode +sdl-scancode-power+))
  (+sdlk-kp-equals+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-equals+))
  (+sdlk-f13+ #.(sdl-scancode-to-keycode +sdl-scancode-f13+))
  (+sdlk-f14+ #.(sdl-scancode-to-keycode +sdl-scancode-f14+))
  (+sdlk-f15+ #.(sdl-scancode-to-keycode +sdl-scancode-f15+))
  (+sdlk-f16+ #.(sdl-scancode-to-keycode +sdl-scancode-f16+))
  (+sdlk-f17+ #.(sdl-scancode-to-keycode +sdl-scancode-f17+))
  (+sdlk-f18+ #.(sdl-scancode-to-keycode +sdl-scancode-f18+))
  (+sdlk-f19+ #.(sdl-scancode-to-keycode +sdl-scancode-f19+))
  (+sdlk-f20+ #.(sdl-scancode-to-keycode +sdl-scancode-f20+))
  (+sdlk-f21+ #.(sdl-scancode-to-keycode +sdl-scancode-f21+))
  (+sdlk-f22+ #.(sdl-scancode-to-keycode +sdl-scancode-f22+))
  (+sdlk-f23+ #.(sdl-scancode-to-keycode +sdl-scancode-f23+))
  (+sdlk-f24+ #.(sdl-scancode-to-keycode +sdl-scancode-f24+))
  (+sdlk-execute+ #.(sdl-scancode-to-keycode +sdl-scancode-execute+))
  (+sdlk-help+ #.(sdl-scancode-to-keycode +sdl-scancode-help+))
  (+sdlk-menu+ #.(sdl-scancode-to-keycode +sdl-scancode-menu+))
  (+sdlk-select+ #.(sdl-scancode-to-keycode +sdl-scancode-select+))
  (+sdlk-stop+ #.(sdl-scancode-to-keycode +sdl-scancode-stop+))
  (+sdlk-again+ #.(sdl-scancode-to-keycode +sdl-scancode-again+))
  (+sdlk-undo+ #.(sdl-scancode-to-keycode +sdl-scancode-undo+))
  (+sdlk-cut+ #.(sdl-scancode-to-keycode +sdl-scancode-cut+))
  (+sdlk-copy+ #.(sdl-scancode-to-keycode +sdl-scancode-copy+))
  (+sdlk-paste+ #.(sdl-scancode-to-keycode +sdl-scancode-paste+))
  (+sdlk-find+ #.(sdl-scancode-to-keycode +sdl-scancode-find+))
  (+sdlk-mute+ #.(sdl-scancode-to-keycode +sdl-scancode-mute+))
  (+sdlk-volumeup+ #.(sdl-scancode-to-keycode +sdl-scancode-volumeup+))
  (+sdlk-volumedown+ #.(sdl-scancode-to-keycode +sdl-scancode-volumedown+))
  (+sdlk-kp-comma+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-comma+))
  (+sdlk-kp-equalsas400+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-equalsas400+))
  (+sdlk-alterase+ #.(sdl-scancode-to-keycode +sdl-scancode-alterase+))
  (+sdlk-sysreq+ #.(sdl-scancode-to-keycode +sdl-scancode-sysreq+))
  (+sdlk-cancel+ #.(sdl-scancode-to-keycode +sdl-scancode-cancel+))
  (+sdlk-clear+ #.(sdl-scancode-to-keycode +sdl-scancode-clear+))
  (+sdlk-prior+ #.(sdl-scancode-to-keycode +sdl-scancode-prior+))
  (+sdlk-return2+ #.(sdl-scancode-to-keycode +sdl-scancode-return2+))
  (+sdlk-separator+ #.(sdl-scancode-to-keycode +sdl-scancode-separator+))
  (+sdlk-out+ #.(sdl-scancode-to-keycode +sdl-scancode-out+))
  (+sdlk-oper+ #.(sdl-scancode-to-keycode +sdl-scancode-oper+))
  (+sdlk-clearagain+ #.(sdl-scancode-to-keycode +sdl-scancode-clearagain+))
  (+sdlk-crsel+ #.(sdl-scancode-to-keycode +sdl-scancode-crsel+))
  (+sdlk-exsel+ #.(sdl-scancode-to-keycode +sdl-scancode-exsel+))
  (+sdlk-kp-00+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-00+))
  (+sdlk-kp-000+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-000+))
  (+sdlk-thousandsseparator+ #.(sdl-scancode-to-keycode +sdl-scancode-thousandsseparator+))
  (+sdlk-decimalseparator+ #.(sdl-scancode-to-keycode +sdl-scancode-decimalseparator+))
  (+sdlk-currencyunit+ #.(sdl-scancode-to-keycode +sdl-scancode-currencyunit+))
  (+sdlk-currencysubunit+ #.(sdl-scancode-to-keycode +sdl-scancode-currencysubunit+))
  (+sdlk-kp-leftparen+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-leftparen+))
  (+sdlk-kp-rightparen+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-rightparen+))
  (+sdlk-kp-leftbrace+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-leftbrace+))
  (+sdlk-kp-rightbrace+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-rightbrace+))
  (+sdlk-kp-tab+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-tab+))
  (+sdlk-kp-backspace+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-backspace+))
  (+sdlk-kp-a+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-a+))
  (+sdlk-kp-b+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-b+))
  (+sdlk-kp-c+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-c+))
  (+sdlk-kp-d+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-d+))
  (+sdlk-kp-e+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-e+))
  (+sdlk-kp-f+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-f+))
  (+sdlk-kp-xor+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-xor+))
  (+sdlk-kp-power+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-power+))
  (+sdlk-kp-percent+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-percent+))
  (+sdlk-kp-less+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-less+))
  (+sdlk-kp-greater+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-greater+))
  (+sdlk-kp-ampersand+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-ampersand+))
  (+sdlk-kp-dblampersand+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-dblampersand+))
  (+sdlk-kp-verticalbar+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-verticalbar+))
  (+sdlk-kp-dblverticalbar+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-dblverticalbar+))
  (+sdlk-kp-colon+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-colon+))
  (+sdlk-kp-hash+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-hash+))
  (+sdlk-kp-space+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-space+))
  (+sdlk-kp-at+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-at+))
  (+sdlk-kp-exclam+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-exclam+))
  (+sdlk-kp-memstore+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-memstore+))
  (+sdlk-kp-memrecall+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-memrecall+))
  (+sdlk-kp-memclear+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-memclear+))
  (+sdlk-kp-memadd+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-memadd+))
  (+sdlk-kp-memsubtract+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-memsubtract+))
  (+sdlk-kp-memmultiply+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-memmultiply+))
  (+sdlk-kp-memdivide+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-memdivide+))
  (+sdlk-kp-plusminus+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-plusminus+))
  (+sdlk-kp-clear+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-clear+))
  (+sdlk-kp-clearentry+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-clearentry+))
  (+sdlk-kp-binary+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-binary+))
  (+sdlk-kp-octal+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-octal+))
  (+sdlk-kp-decimal+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-decimal+))
  (+sdlk-kp-hexadecimal+ #.(sdl-scancode-to-keycode +sdl-scancode-kp-hexadecimal+))
  (+sdlk-lctrl+ #.(sdl-scancode-to-keycode +sdl-scancode-lctrl+))
  (+sdlk-lshift+ #.(sdl-scancode-to-keycode +sdl-scancode-lshift+))
  (+sdlk-lalt+ #.(sdl-scancode-to-keycode +sdl-scancode-lalt+))
  (+sdlk-lgui+ #.(sdl-scancode-to-keycode +sdl-scancode-lgui+))
  (+sdlk-rctrl+ #.(sdl-scancode-to-keycode +sdl-scancode-rctrl+))
  (+sdlk-rshift+ #.(sdl-scancode-to-keycode +sdl-scancode-rshift+))
  (+sdlk-ralt+ #.(sdl-scancode-to-keycode +sdl-scancode-ralt+))
  (+sdlk-rgui+ #.(sdl-scancode-to-keycode +sdl-scancode-rgui+))
  (+sdlk-mode+ #.(sdl-scancode-to-keycode +sdl-scancode-mode+))
  (+sdlk-audionext+ #.(sdl-scancode-to-keycode +sdl-scancode-audionext+))
  (+sdlk-audioprev+ #.(sdl-scancode-to-keycode +sdl-scancode-audioprev+))
  (+sdlk-audiostop+ #.(sdl-scancode-to-keycode +sdl-scancode-audiostop+))
  (+sdlk-audioplay+ #.(sdl-scancode-to-keycode +sdl-scancode-audioplay+))
  (+sdlk-audiomute+ #.(sdl-scancode-to-keycode +sdl-scancode-audiomute+))
  (+sdlk-mediaselect+ #.(sdl-scancode-to-keycode +sdl-scancode-mediaselect+))
  (+sdlk-www+ #.(sdl-scancode-to-keycode +sdl-scancode-www+))
  (+sdlk-mail+ #.(sdl-scancode-to-keycode +sdl-scancode-mail+))
  (+sdlk-calculator+ #.(sdl-scancode-to-keycode +sdl-scancode-calculator+))
  (+sdlk-computer+ #.(sdl-scancode-to-keycode +sdl-scancode-computer+))
  (+sdlk-ac-search+ #.(sdl-scancode-to-keycode +sdl-scancode-ac-search+))
  (+sdlk-ac-home+ #.(sdl-scancode-to-keycode +sdl-scancode-ac-home+))
  (+sdlk-ac-back+ #.(sdl-scancode-to-keycode +sdl-scancode-ac-back+))
  (+sdlk-ac-forward+ #.(sdl-scancode-to-keycode +sdl-scancode-ac-forward+))
  (+sdlk-ac-stop+ #.(sdl-scancode-to-keycode +sdl-scancode-ac-stop+))
  (+sdlk-ac-refresh+ #.(sdl-scancode-to-keycode +sdl-scancode-ac-refresh+))
  (+sdlk-ac-bookmarks+ #.(sdl-scancode-to-keycode +sdl-scancode-ac-bookmarks+))
  (+sdlk-brightnessdown+ #.(sdl-scancode-to-keycode +sdl-scancode-brightnessdown+))
  (+sdlk-brightnessup+ #.(sdl-scancode-to-keycode +sdl-scancode-brightnessup+))
  (+sdlk-displayswitch+ #.(sdl-scancode-to-keycode +sdl-scancode-displayswitch+))
  (+sdlk-kbdillumtoggle+ #.(sdl-scancode-to-keycode +sdl-scancode-kbdillumtoggle+))
  (+sdlk-kbdillumdown+ #.(sdl-scancode-to-keycode +sdl-scancode-kbdillumdown+))
  (+sdlk-kbdillumup+ #.(sdl-scancode-to-keycode +sdl-scancode-kbdillumup+))
  (+sdlk-eject+ #.(sdl-scancode-to-keycode +sdl-scancode-eject+))
  (+sdlk-sleep+ #.(sdl-scancode-to-keycode +sdl-scancode-sleep+))
  (+sdlk-app1+ #.(sdl-scancode-to-keycode +sdl-scancode-app1+))
  (+sdlk-app2+ #.(sdl-scancode-to-keycode +sdl-scancode-app2+))
  (+sdlk-audiorewind+ #.(sdl-scancode-to-keycode +sdl-scancode-audiorewind+))
  (+sdlk-audiofastforward+ #.(sdl-scancode-to-keycode +sdl-scancode-audiofastforward+)))

(defsdl2enum sdl-keymod
  (+kmod-none+ #x0000)
  (+kmod-lshift+ #x0001)
  (+kmod-rshift+ #x0002)
  (+kmod-lctrl+ #x0040)
  (+kmod-rctrl+ #x0080)
  (+kmod-lalt+ #x0100)
  (+kmod-ralt+ #x0200)
  (+kmod-lgui+ #x0400)
  (+kmod-rgui+ #x0800)
  (+kmod-num+ #x1000)
  (+kmod-caps+ #x2000)
  (+kmod-mode+ #x4000)
  (+kmod-reserved+ #x8000))
