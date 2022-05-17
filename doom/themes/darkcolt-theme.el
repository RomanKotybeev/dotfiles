(require 'doom-themes)


(defgroup darkcolt-theme nil
  "Options for the `darkcolt' theme."
  :group 'doom-themes)

(defcustom doom-one-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-one-theme
  :type '(choice integer boolean))

;; Theme definition
(def-doom-theme darkcolt
  "A dark theme inspired by Atom One Dark."

  ((bg         '("#1e282c" "black"   "black"  ))
   (bg-alt     '("#28363b" "#2d333f" "black"))
   (base0      '("#171F24" "#111122" "black"))
   (base1      '("#1C1C1C" "#1C1C1C" "brightblack"))
   (base2      '("#121212" "#626262" "brightblack"))
   (base3      '("#3D3D3D" "#3D3D3D" "brightblack"))
   (base4      '("#8c868d" "#444444" "brightblack"))
   (base5      '("#515151" "#515151" "brightblack"))
   (base6      '("#6D6D6D" "#6D6D6D" "brightblack"))
   (base7      '("#777778" "#767676" "brightblack"))
   (base8      '("#d6dae0" "#a8a8a8" "white"))
   (fg         '("#8e97a9" "#abb2bf" "brightwhite"))
   (fg-alt     '("#888986" "#bcbcbc" "white"))

   (grey       base4)
   (red        '("#ff6c6b" "#ff6655" "red"          ))
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (green      '("#98be65" "#99bb66" "green"        ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#ebdbb2" "#ecbe7b" "yellow"       ))
   (blue       '("#51afef" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "brightmagenta"))
   (violet     '("#a9a1e1" "#a9a1e1" "magenta"      ))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        fg)
   (comments       (doom-darken fg 0.25))
   (doc-comments   (doom-lighten fg 0.20))
   (constants      fg)
   (functions      fg)
   (keywords       fg)
   (methods        fg)
   (operators      fg)
   (type           fg)
   (strings        fg)
   (variables      fg)
   (numbers        fg)
   (region         `(,(doom-lighten (car bg-alt) 0.1) ,@(doom-lighten (cdr base1) 0.15)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   (modeline-fg              fg)
   (modeline-fg-alt          fg-alt)
   (modeline-bg              (doom-darken bg-alt 0.1))
   (modeline-bg-alt          `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg)))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-one-padded-modeline
      (if (integerp doom-one-padded-modeline) doom-one-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground fg)
   ((line-number-current-line &override) :foreground yellow)
   (hl-line :background bg)

   (highlight-numbers-number :foreground fg)

   ((font-lock-preprocessor-face &override) :foreground (doom-lighten fg 0.25) :weight 'bold)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground base8)


   ;;;; doom-modeline
   (doom-modeline-bar :background highlight)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   (markdown-header-face :foreground violet :inherit 'bold)
   ((markdown-code-face &override) :foreground (doom-darken fg 0.25) :background bg)
   ((markdown-pre-face &override) :foreground (doom-darken fg 0.25) :background bg)
   ((markdown-url-face &override) :foreground (doom-darken fg 0.25) :background bg)
   ((markdown-bold-face &override) :foreground fg :inherit 'bold)
   ((markdown-italic-face &override) :foreground fg :inherit 'italic)

   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
  ())
