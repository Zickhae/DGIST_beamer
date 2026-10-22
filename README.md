# DGIST / CiMAS Beamer template

A reusable LaTeX Beamer template for Donghae Kim, Department of Robotics and
Mechatronics Engineering, DGIST. Adapted from the supplied Oden Institute / UT Austin project, retaining its Boadilla foundation, sans-serif text, serif mathematics, square blocks, and segmented footer.

## Start in Overleaf

1. Choose **New Project > Upload Project** and upload the ZIP.
2. Set the compiler to **pdfLaTeX**.
3. Compile **root.tex** to see the full example deck.

The project is self-contained and needs no shell escape, downloaded fonts,
external bibliography processor, or network access during compilation.
Compile twice to resolve the outline and frame totals. Locally, use:

```sh
latexmk -pdf root.tex
```

## Files

| File | Purpose |
| --- | --- |
| `root.tex` | Full demonstration with equations, blocks, a plot, a table, and palette reference |
| `dgist_beamer.cls` | Reusable class, theme settings, and helper commands |
| `assets/dgist-rme.png` | Supplied department logo, unchanged |
| `assets/cimas.png` | Supplied CiMAS logo, unchanged |
| `DGIST-Beamer-Preview.pdf` | Compiled default example |

The title and closing slides have centered text and the original logo
arrangement near the bottom: the department logo on the left and the CiMAS
logo on the right. The pair is 20% smaller and 6.5 mm lower than the original
layout. The title-page text block sits 6 mm lower for a more centered composition.
Both images use their original spacing and proportions,
without clipping or recomposition. White backing keeps both logos legible in
dark mode. Body and section slides have no logos.

The supplied department logo is a raster image. To substitute an official
vector asset, use `\setdepartmentlogo{path/to/logo.pdf}`.
`\setgrouplogo{path/to/logo.pdf}` replaces the group logo. The relative logo
widths are collected in the class's title/closing logo arrangement section.

## Theme options

```latex
% Default: white slides, deep-blue headings, blue and cyan details.
\documentclass[10pt,aspectratio=169]{dgist_beamer}

% Cyan title/section accent rule.
\documentclass[10pt,aspectratio=169,cyan]{dgist_beamer}

% Dark navy background, white text, cyan headings.
\documentclass[10pt,aspectratio=169,dark]{dgist_beamer}
```

- `blue` is an explicit alias for the default accent.
- `dark` and `cyan` may be combined.
- Body-slide footer text is empty by default; frame numbers remain visible. The old
  `nologofooter` option remains accepted for compatibility and has no effect.
- `handout` uses Beamer's normal overlay-collapsing behavior.
- Other options pass through to Beamer. The demonstration uses 16:9. The class
  also supports 4:3 and 16:10, though individual slide contents may need reflow.

## Metadata and footer

```latex
\title{Full presentation title}
\subtitle{Optional subtitle}
\author{Donghae Kim}
\institute{Your affiliation}
\date{Conference name\\October 22, 2026}
```

The two footer text fields are empty by default. The colored footer bars and
current/total content-frame count remain visible. Title, author, and institute
metadata do not automatically populate the footer.
To add footer text, put either or both commands before `\begin{document}`:

```latex
\setfooterleft{Donghae Kim / DGIST}
\setfooterright{Conference name / 2026}
```

Use `\setfooterleft{}` or `\setfooterright{}` to clear a field again. Keep any
custom text brief so it fits the bars.

## Reusable frames

The example documents use explicit frame-title commands:

```latex
\begin{frame}
  \frametitle{Your slide title}
  \framesubtitle{Optional subtitle}
  Your content here.
\end{frame}
```

For slides containing `verbatim`, use `\begin{frame}[fragile]` and put
`\frametitle{...}` inside the frame in the same way.

```latex
\dgisttitleframe

% Optional automatic section dividers, placed in the preamble:
\AtBeginSection[]{\dgistsectionframe}

% Or insert a divider manually after a \section command:
\dgistsectionframe

% Closing slide with custom contact text:
\dgistclosingframe{Your email or web address}

% Optional closing heading:
\dgistclosingframe[Thank you]{Your email or web address}
```

Title, section-divider, and closing helper frames are unnumbered. Normal
frames, including outline slides, count toward the total. Repeated overlay
pages share one frame number. `appendixnumberbeamer` keeps backup frames out
of the main presentation total. Add `\appendix` before backup material.
Compile twice after adding or removing frames.

Use standard Beamer `block`, `exampleblock`, `alertblock`, `columns`, equations,
notes, and overlay commands. To show speaker notes, use
`\setbeameroption{show notes}`. A frame containing `verbatim` needs `[fragile]`.
The supplied plot is synthetic and makes no claim about research performance.

## Colors and sources

The class defines the official process-color specifications in CMYK directly:

| LaTeX name | Pantone reference | C / M / Y / K (%) |
| --- | --- | --- |
| `dgist_cyan` | 2985 CVC | 72 / 0 / 0 / 0 |
| `dgist_blue` | 285 CVC | 91 / 43 / 0 / 0 |
| `dgist_navy` | 280 CVC | 100 / 72 / 0 / 18 |
| `dgist_gray` | Cool Grey 9 CVC | 0 / 0 / 0 / 65 |
| `dgist_lightgray` | Cool Grey 2 CVC | 0 / 0 / 0 / 11 |
| `dgist_logotype` | Logotype color | 6 / 0 / 0 / 47 |

Source: [DGIST Branding & Identity](https://www.dgist.ac.kr/eng/sub01_02_04_01.do),
accessed October 22, 2026. Screen appearance depends on the PDF viewer's CMYK
conversion. The class does not claim an official RGB/HEX specification or use
Pantone spot-color separations.

The department's website is [DGIST Robotics and Mechatronics Engineering](https://www.dgist.ac.kr/robot/).
Both logos are the files supplied with this request. Their original RGB colors
remain intact. Pale block fills and the dark-mode background are theme-specific
tints or mixtures, not additional official university colors.

Use `\textcolor{highlight}{...}`, `\textcolor{text}{...}`, or
`\textcolor{muted}{...}` to make text adapt automatically to dark mode.
`accent`, `pagebackground`, `boxbackground`, and `rulecolor` are also available.
The grayscale alert block deliberately avoids adding an unrelated brand color.

## Attribution

The original README credits the Oden Institute and the earlier
ICES Beamer template created by Teresa Portone. This DGIST/CiMAS adaptation is
a personal presentation template, not an official university-issued theme.
