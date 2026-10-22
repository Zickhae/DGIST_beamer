%% DGIST / CiMAS Beamer template
%% Adapted from the supplied 2020 Oden Institute / UT Austin Beamer class.
%% Original template credits: Oden Institute and Teresa Portone (ICES).
%% DGIST adaptation: 2026-10-22.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dgist_beamer}[2026/10/22 DGIST Robotics and Mechatronics Beamer]

% Options: blue (default), cyan, dark; all others go to Beamer.
\newif\ifdgist@dark
\newif\ifdgist@cyan
\DeclareOption{blue}{\dgist@cyanfalse}
\DeclareOption{cyan}{\dgist@cyantrue}
\DeclareOption{dark}{\dgist@darktrue}
% Accepted for compatibility; body slides now always have no logos.
\DeclareOption{nologofooter}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}
\RequirePackage{lmodern}
\RequirePackage{booktabs}
\RequirePackage{appendixnumberbeamer}
\usetheme{Boadilla}
\usefonttheme{professionalfonts}

% Official CMYK specifications, not sampled or guessed RGB values.
% Source: https://www.dgist.ac.kr/eng/sub01_02_04_01.do
\definecolor{dgist_cyan}{cmyk}{0.72,0,0,0}       % Pantone 2985 CVC
\definecolor{dgist_blue}{cmyk}{0.91,0.43,0,0}    % Pantone 285 CVC
\definecolor{dgist_navy}{cmyk}{1,0.72,0,0.18}    % Pantone 280 CVC
\definecolor{dgist_gray}{cmyk}{0,0,0,0.65}      % Cool Grey 9 CVC
\definecolor{dgist_lightgray}{cmyk}{0,0,0,0.11} % Cool Grey 2 CVC
\definecolor{dgist_logotype}{cmyk}{0.06,0,0,0.47}

% Semantic names keep user slides portable across light and dark modes.
\colorlet{accent}{dgist_blue}
\ifdgist@cyan\colorlet{accent}{dgist_cyan}\fi
\colorlet{text}{black!85}
\colorlet{highlight}{dgist_navy}
\colorlet{pagebackground}{white}
\colorlet{boxbackground}{dgist_blue!7!white}
\colorlet{muted}{dgist_gray}
\colorlet{rulecolor}{dgist_lightgray}
\ifdgist@dark
  \colorlet{text}{white}
  \colorlet{highlight}{dgist_cyan}
  \colorlet{pagebackground}{dgist_navy!45!black}
  \colorlet{boxbackground}{dgist_navy!65!black}
  \colorlet{muted}{white!72!black}
  \colorlet{rulecolor}{white!22!black}
\fi

\setbeamercolor{normal text}{fg=text,bg=pagebackground}
\setbeamercolor{background canvas}{bg=pagebackground}
\setbeamercolor{title}{fg=highlight}
\setbeamercolor{subtitle}{fg=muted}
\setbeamercolor{author}{fg=text}
\setbeamercolor{institute}{fg=muted}
\setbeamercolor{date}{fg=muted}
\setbeamercolor{frametitle}{fg=highlight,bg=pagebackground}
\setbeamercolor{framesubtitle}{fg=muted}
\setbeamercolor{structure}{fg=highlight}
\setbeamercolor{alerted text}{fg=highlight}
\setbeamercolor{example text}{fg=highlight}
\setbeamercolor{block title}{fg=white,bg=dgist_navy}
\setbeamercolor{block body}{fg=text,bg=boxbackground}
\setbeamercolor{block title example}{fg=dgist_navy,bg=dgist_cyan}
\setbeamercolor{block body example}{fg=text,bg=boxbackground}
\setbeamercolor{block title alerted}{fg=white,bg=dgist_gray}
\setbeamercolor{block body alerted}{fg=text,bg=boxbackground}
\setbeamercolor{author in head/foot}{fg=white,bg=dgist_navy}
\setbeamercolor{title in head/foot}{fg=white,bg=dgist_blue}
\setbeamercolor{page number in head/foot}{fg=dgist_navy,bg=dgist_lightgray}
\setbeamercolor{logo strip}{fg=dgist_navy,bg=white}
\setbeamercolor{bibliography entry author}{fg=highlight}
\setbeamercolor{bibliography entry title}{fg=text}
\setbeamercolor{bibliography entry location}{fg=muted}
\setbeamercolor{bibliography entry note}{fg=muted}

\setbeamerfont{title}{size=\LARGE,series=\bfseries}
\setbeamerfont{subtitle}{size=\normalsize,series=\mdseries}
\setbeamerfont{author}{size=\normalsize,series=\bfseries}
\setbeamerfont{institute}{size=\small}
\setbeamerfont{date}{size=\small}
\setbeamerfont{frametitle}{size=\large,series=\bfseries}
\setbeamerfont{framesubtitle}{size=\small,series=\mdseries}
\setbeamerfont{block title}{size=\normalsize,series=\bfseries}
\setbeamerfont{section in toc}{size=\normalsize}
\setbeamerfont{footline}{size=\fontsize{6}{7}\selectfont}
\setbeamersize{text margin left=.055\paperwidth,text margin right=.055\paperwidth}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{headline}{}
\setbeamertemplate{blocks}[default]
\setbeamertemplate{itemize items}{\small\raisebox{.15ex}{$\bullet$}}
\setbeamertemplate{enumerate items}[default]
\setbeamertemplate{section in toc}{\inserttocsectionnumber.\enspace\inserttocsection\par}
\setbeamertemplate{section in toc shaded}[default][35]
\setbeamertemplate{bibliography item}[text]
\setbeamercovered{invisible}

% Original logo arrangement, reduced by 20% and lowered 6.5 mm.
% Both source images are used intact, with their original spacing/proportions.
\newcommand{\departmentlogofile}{assets/dgist-rme.png}
\newcommand{\grouplogofile}{assets/cimas.png}
\newcommand{\setdepartmentlogo}[1]{\renewcommand{\departmentlogofile}{#1}}
\newcommand{\setgrouplogo}[1]{\renewcommand{\grouplogofile}{#1}}
\newsavebox{\dgist@logobox}
\newcommand{\dgist@logopair}{%
  \begingroup\setlength{\fboxsep}{.14cm}%
  \sbox{\dgist@logobox}{\colorbox{white}{%
    \begin{minipage}{\dimexpr\textwidth-2\fboxsep\relax}
      \noindent\begin{minipage}[c]{.64\linewidth}
        \includegraphics[width=\linewidth]{\departmentlogofile}
      \end{minipage}\hfill
      \begin{minipage}[c]{.29\linewidth}
        \includegraphics[width=\linewidth]{\grouplogofile}
      \end{minipage}
    \end{minipage}}}%
  % Reserve the original space so the centered text does not shift.
  \raisebox{-.65cm}[\ht\dgist@logobox][\dp\dgist@logobox]{%
    \scalebox{.80}{\usebox{\dgist@logobox}}}%
  \endgroup}

\setbeamertemplate{title page}{%
  \begin{minipage}[c][.79\paperheight][c]{\textwidth}
    \centering
    \vfill
    % Lower the complete title-page text block without moving the logo row.
    \vspace*{.80cm}
    {\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle\par}
    \ifx\insertsubtitle\@empty\else
      \vspace{.16cm}{\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}
    \fi
    \vspace{.26cm}{\color{accent}\rule{.16\textwidth}{1.3pt}\par}
    \vspace{.24cm}
    {\usebeamerfont{author}\usebeamercolor[fg]{author}\insertauthor\par}
    \vspace{.13cm}
    {\usebeamerfont{institute}\usebeamercolor[fg]{institute}\insertinstitute\par}
    \vspace{.30cm}
    {\usebeamerfont{date}\usebeamercolor[fg]{date}\insertdate\par}
    \vspace*{-.80cm}
    \vfill
    \dgist@logopair
  \end{minipage}
}

\setbeamertemplate{frametitle}{%
  \vskip.22cm
  \usebeamerfont{frametitle}\insertframetitle\strut\par
  \ifx\insertframesubtitle\@empty\else
    {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\insertframesubtitle\strut\par}
  \fi
  \vskip.08cm
  {\color{rulecolor}\hrule height .35pt}
  \vskip.10cm
}

% Footer text is empty by default. These commands explicitly opt in to text.
\newcommand{\dgist@footerleft}{}
\newcommand{\dgist@footerright}{}
\newcommand{\setfooterleft}[1]{\renewcommand{\dgist@footerleft}{#1}}
\newcommand{\setfooterright}[1]{\renewcommand{\dgist@footerright}{#1}}
\newif\ifdgist@specialframe
\newcommand{\dgist@colorbar}{%
  \hbox{\color{dgist_navy}\rule{.73\paperwidth}{.12cm}%
    \color{dgist_blue}\rule{.17\paperwidth}{.12cm}%
    \color{dgist_cyan}\rule{.10\paperwidth}{.12cm}}}

\setbeamertemplate{footline}{%
  \ifdgist@specialframe
    \dgist@colorbar
  \else
    \leavevmode\hbox{%
      \begin{beamercolorbox}[wd=.44\paperwidth,ht=2.5ex,dp=1.1ex,center]{author in head/foot}
        \hypersetup{linkcolor=white}%
        \usebeamerfont{footline}\strut\dgist@footerleft
      \end{beamercolorbox}%
      \begin{beamercolorbox}[wd=.46\paperwidth,ht=2.5ex,dp=1.1ex,center]{title in head/foot}
        \hypersetup{linkcolor=white}%
        \usebeamerfont{footline}\strut\dgist@footerright
      \end{beamercolorbox}%
      \begin{beamercolorbox}[wd=.10\paperwidth,ht=2.5ex,dp=1.1ex,center]{page number in head/foot}
        \usebeamerfont{footline}\strut\insertframenumber/\inserttotalframenumber
      \end{beamercolorbox}}%
  \fi
}

% Title, section and closing frames do not consume content-frame numbers.
\newcommand{\dgisttitleframe}{%
  \begingroup\dgist@specialframetrue
  \begin{frame}[noframenumbering]\titlepage\end{frame}
  \endgroup}
\newcommand{\dgistsectionframe}{%
  \begingroup\dgist@specialframetrue
  \begin{frame}[noframenumbering]
    \vfill
    {\color{muted}\small SECTION\enspace\insertsectionnumber\par}
    \vspace{.25cm}
    {\usebeamerfont{title}\color{highlight}\insertsectionhead\par}
    \vspace{.25cm}{\color{accent}\rule{.16\textwidth}{1.3pt}}
    \vfill
  \end{frame}\endgroup}
\newcommand{\dgistclosingframe}[2][Questions and discussion]{%
  \begingroup\dgist@specialframetrue
  \begin{frame}[noframenumbering]
    \begin{minipage}[c][.79\paperheight][c]{\textwidth}
      \centering
      \vfill
      {\usebeamerfont{title}\color{highlight}#1\par}
      \vspace{.30cm}{\usebeamerfont{author}\insertauthor\par}
      \vspace{.18cm}{\color{muted}\small #2\par}
      \vfill
      \dgist@logopair
    \end{minipage}
  \end{frame}\endgroup}

\hypersetup{colorlinks=true,linkcolor=highlight,urlcolor=highlight,citecolor=highlight}
\mode<all>
