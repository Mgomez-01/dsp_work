(TeX-add-style-hook
 "discrete_systems"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("exam" "a4paper" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("xcolor" "dvipsnames") ("algorithm2e" "linesnumbered" "ruled" "vlined")))
   (TeX-run-style-hooks
    "latex2e"
    "exam"
    "exam11"
    "fontenc"
    "titling"
    "url"
    "amsmath"
    "amsthm"
    "amssymb"
    "graphicx"
    "graphics"
    "listings"
    "xcolor"
    "tabularx"
    "ragged2e"
    "courier"
    "textcomp"
    "circuitikz"
    "tikz"
    "enumitem"
    ""
    "karnaugh-map"
    "bytefield"
    "mathrsfs"
    "cancel"
    "algorithm2e"
    "hyperref"
    "environ")
   (TeX-add-symbols
    '("tab" ["argument"] 0)
    '("uparrowat" 1)
    '("subtitle" 1)
    '("ztransform" 1)
    '("fourier" 1)
    '("laplace" 1)
    '("invlaplace" 1)
    "myvspace"))
 :latex)

