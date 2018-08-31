% Class for puzzlehunt booklets
% Use with:
%     \documentclass{puzzlehunt}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puzzlehunt}[2018/06/24 PUZZLEHUNT]

% No fancy options, please
\DeclareOption*{
  \ClassWarning{puzzlehunt}{No class options allowed.}
}

% Process given options
\ProcessOptions\relax

% Load base
\LoadClass[11pt,openany,oneside,letterpaper]{book}

% Page formatting
\RequirePackage[margin=0.8in]{geometry}

% Space out paragraphs
\setlength{\parskip}{6pt plus1pt minus1pt}

% Graphics
\RequirePackage{graphicx} % to display images
\RequirePackage{tikz} % to create graphics

% Datetime formatting
\RequirePackage[yyyymmdd,hhmmss]{datetime}

% Fonts
\usepackage{cmbright}
\usepackage[T1]{fontenc}


% Handle meta info

\newcommand{\phTitle}{Unknown Title}
\newcommand{\phSetTitle}[1]{\renewcommand{\phTitle}{#1}\title{#1}}
\newcommand{\phAuthor}{Unknown Title}
\newcommand{\phSetAuthor}[1]{\renewcommand{\phAuthor}{#1}\author{#1}}
\newcommand{\phUseAuthorWithTitle}{\renewcommand{\phTitle}{\@title{} | \@author}}


% Custom Title Page

\newcommand{\phBannerLogo}{example-image-16x10}% uses mwe image
\newcommand{\phSetBannerLogo}[1]{\renewcommand{\phBannerLogo}{#1}}

\newcommand{\phTitlePage}{%
\begin{titlepage}
  \begin{center}
	\includegraphics[width=0.6\textwidth]{\phBannerLogo}\par\vspace{1cm}
	{\Huge\textbf{\@title} \par}
	\vspace{2em}
	{\LARGE\textit{\@author} \par}
	\vfill
	{\large Version \today \par}
  \end{center}
\end{titlepage}
\addtocounter{page}{1}
}


% Custom Chapter/Section Headings
\RequirePackage[explicit]{titlesec}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}

\newcommand{\phSquareLogo}{example-image-1x1}% uses mwe image
\newcommand{\phSetSquareLogo}[1]{\renewcommand{\phSquareLogo}{#1}}

\newcommand{\phChapterName}{Unknown Chapter}
\newcommand{\phSetChapterName}[1]{\renewcommand{\phChapterName}{#1}}
\newcommand{\phSectionName}{Unknown Section}
\newcommand{\phSetSectionName}[1]{\renewcommand{\phSectionName}{#1}}

\newcommand{\phPart}[1]{\part{#1}}
\newcommand{\phChapter}[1]{%
  \phSetChapterName{#1}%
  \newpage
  \addcontentsline{toc}{chapter}{\phChapterName}%
  {
    \Large
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \phTitle \vspace{0.1in}} \\
      {\Huge \textbf{\phChapterName} \vspace{0.25in}}
    \end{tabular}
  }
}
\newcommand{\phChapterWorksheet}[2]{%
  \phSetChapterName{#1}%
  \phSetSectionName{#2}%
  \newpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\phChapterName}%
  \phantomsection
  \addcontentsline{toc}{section}{\phSectionName}%
  {
    \Large
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \phTitle \vspace{0.1in}} \\
      {\Huge \textbf{\phChapterName} \vspace{0.1in}} \\
      {\LARGE \phSectionName \vspace{0.05in}}
    \end{tabular}
  }
}
\newcommand{\phWorksheet}[1]{%
  \phSetSectionName{#1}%
  \newpage%
  \phantomsection
  \addcontentsline{toc}{section}{\phSectionName}%
  {
    \Large
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \phTitle \vspace{0.1in}} \\
      {\Huge \textbf{\phChapterName} \vspace{0.1in}} \\
      {\LARGE \phSectionName \vspace{0.05in}}
    \end{tabular}
  }
}
\newcommand{\phSection}[1]{%
  \phSetSectionName{#1}%

  \vspace{1em}
  \addcontentsline{toc}{section}{\phSectionName}%
  {\Large\bf \phSectionName}

}

% Title of Contents
  \titleformat{\chapter}[display]{}{}{0pt}
  {
    \Large
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \phTitle \vspace{0.1in}} \\
      {\Huge \textbf{\phChapterName} \vspace{0.25in}}
    \end{tabular}
  }
  \titlespacing*{\chapter}{0pt}{*0}{0pt}
\newcommand{\phTableOfContents}{\phSetChapterName{Table of Contents}\tableofcontents}

% No indention
\setlength{\parindent}{0pt}


% Example environment
\newsavebox{\@phExampleBox}
\newenvironment{phExample}[1]{
  \begin{center}
    \begin{lrbox}{\@phExampleBox}
      \begin{minipage}{.9\linewidth}
        \vspace{1em}
        \begin{center}
          \begin{minipage}{.9\linewidth}
            \textbf{#1}%
}{
          \end{minipage}
        \end{center}
        \vspace{1em}
      \end{minipage}
    \end{lrbox}\fbox{\usebox{\@phExampleBox}}
  \end{center}
}

% Page numbering
\pagenumbering{gobble}
\newcommand{\phShowPageNumbers}{\pagenumbering{arabic}}

% Box to fill in letters
\newcommand{\phLetterBox}[2]{
  \begin{tikzpicture}
    \fill[white] (0,-2em) rectangle (2em,2em);
    \draw (0,0) rectangle (2em,2em);
    \node at (1em,-1em) {#1};
    \node at (1em,1em) {#2};
  \end{tikzpicture}
}

% Lorem ipsum generator (useful for mockups)
\RequirePackage{lipsum}

% Hyperlinks
\RequirePackage[hidelinks]{hyperref}
\urlstyle{same}
\newcommand{\phUrl}[1]{\(\langle\)\url{#1}\(\rangle\)}

% Watermarks
\RequirePackage{draftwatermark}
\SetWatermarkText{}
\SetWatermarkLightness{0.95}
\newcommand{\phMarkDraft}{
  \SetWatermarkText{DRAFT \today}
  \SetWatermarkScale{0.5}
}

% that's all folks
\endinput
