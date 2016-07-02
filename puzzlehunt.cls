% Class for AMP'd Challenge Math Competition documents
% Based upon http://en.wikibooks.org/wiki/LaTeX/Creating_Packages
% Use with:
%     \documentclass{puzzlehunt}
%     \setEventTime{Fall 2013}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puzzlehunt}[2014/12/23 PUZZLEHUNT]

    % % Article options
    % \DeclareOption{12pt}{
    %   \PassOptionsToClass{\CurrentOption}{article}
    % }

    % % Fallback
    % \DeclareOption*{
    %   \ClassWarning{puzzlehunt}{Unknown option ``\CurrentOption''}
    % }

% Based on 12pt article
\PassOptionsToClass{12pt}{book}

% No fancy options, please
\DeclareOption*{
  \ClassWarning{puzzlehunt}{No class options allowed.}
}

% Process given options
\ProcessOptions\relax

% Load base
\LoadClass[letterpaper]{book}



% Page formatting
\RequirePackage[margin=0.8in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[yyyymmdd,hhmmss]{datetime}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\lfoot{\small\it \eventSeason~ | \eventURL~}
\rfoot{\tiny\it \currentPage / \totalPages}

\newcommand{\hidePageNumbers}{
  \rfoot{}
}

\setlength{\parskip}{6pt plus1pt minus1pt}

\newcommand{\markDraft}{
  \cfoot{\vspace{1em}\tiny Draft: \today~\currenttime}
}



% Graphics
\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage{wrapfig}
\setlength{\intextsep}{0pt}
\setlength{\columnsep}{12pt}

\graphicspath{{./assets/}}

\newcommand{\rightImg}[2]{
  \begin{wrapfigure}{r}{#1}
    \includegraphics[width=#1]{#2}
  \end{wrapfigure}
}

\newcommand{\centerImg}[2]{
  \vspace{12pt}
  \centerline{\includegraphics[width=#1]{#2}}
}

% Math
\RequirePackage{amsmath}
\RequirePackage{amssymb}


            %% AMS
            % \RequirePackage{amsmath}
            % \RequirePackage{amssymb}
            % \RequirePackage{amscd}
            %% Fonts
            % \RequirePackage{amsfonts}
            % \RequirePackage{latexsym}
            %% Graphics
            % \RequirePackage{graphicx}
            % \RequirePackage{wrapfig}


% Color
\RequirePackage{color}
\RequirePackage{xcolor}


            %% Other
            % \RequirePackage{array}
            % \RequirePackage{calc}



% Custom AMP'd commands and environments

\newcommand{\currentPage}{\thepage~}
\newcommand{\totalPages}{\pageref{LastPage}}

\newcommand{\eventName}{Unnamed Puzzlehunt}
\newcommand{\setEventName}[1]{\renewcommand{\eventName}{#1}}

\newcommand{\eventSeason}{Fall 20XX}
\newcommand{\setEventSeason}[1]{\renewcommand{\eventSeason}{#1}}

\newcommand{\eventURL}{Fall 20XX}
\newcommand{\setEventURL}[1]{\renewcommand{\eventURL}{#1}}

\newcommand{\logoPath}{logo.pdf}
\newcommand{\setLogoPath}[1]{\renewcommand{\logoPath}{#1}}

\newcommand{\puzzleLabel}{Puzzle}
\newcommand{\setPuzzleLabel}[1]{\renewcommand{\puzzleLabel}{#1}}

\newcommand{\puzzleIndex}{unknown}
\newcommand{\setPuzzleIndex}[1]{\renewcommand{\puzzleIndex}{#1}}

\newcommand{\puzzleTitle}{Unknown Title}
\newcommand{\setPuzzleTitle}[1]{\renewcommand{\puzzleTitle}{#1}}

\newcommand{\vspacing}{\vspace{12pt}}
\newcommand{\heading}[1]{\noindent\textbf{\Large #1}}

\newcommand{\puzzleHeader}[3]
  {
    \begin{figure}[t]
      \begin{minipage}[b]{0.35\linewidth}
        \includegraphics[width=\linewidth]{\logoPath}
        \centerline{\eventSeason}
      \end{minipage}
      \begin{minipage}[b]{0.65\linewidth}
        \raggedleft
        {\LARGE #1}\\
        \vspace{2pt}
        {\Huge #2}\\
        \vspace{2pt}
        {\Large #3}
      \end{minipage}
    \end{figure}
    \noindent\hrulefill
    \vspace{12pt}\\
}

\newcommand{\puzzleHeaderRev}[3]
  {
    \begin{figure}[t]
      \begin{minipage}[b]{0.65\linewidth}
        \raggedright
        {\LARGE #1}\\
        \vspace{2pt}
        {\Huge #2}\\
        \vspace{2pt}
        {\Large #3}
      \end{minipage}
      \begin{minipage}[b]{0.35\linewidth}
        \includegraphics[width=\linewidth]{\logoPath}
        \centerline{\eventTime}
      \end{minipage}
    \end{figure}
    \noindent\hrulefill
    \vspace{12pt}\\
}


\newcommand{\fillInBlank}[1]{\underline{\hspace{#1}}}


\newenvironment{puzzle}
  { %before
\newpage
\puzzleHeader{\puzzleLabel~\puzzleIndex}{\puzzleTitle}{~}
  }{ %after

}

\newenvironment{extraPuzzle}
  { %before
\newpage
\puzzleHeader{EXTRA \puzzleLabel~\puzzleIndex}{\puzzleTitle}{~}
  }{ %after

}

\newenvironment{puzzleSolutions}
  { %before
\newpage
\puzzleHeader{\puzzleLabel~\puzzleIndex}{\puzzleTitle}{Solutions}
  }{ %after

}

\newenvironment{guide}[1]
  { %before
\newpage
\puzzleHeader{~}{#1}{~}
  }{ %after

}

\newenvironment{customPuzzle}[3]
  { %before
\newpage
\puzzleHeader{#1}{#2}{#3}
  }{ %after

}

% for \url
\RequirePackage{hyperref}


% from http://tex.stackexchange.com/a/122200
\RequirePackage{varwidth}
\RequirePackage{verbatim}

\newenvironment{centerverbatim}{%
  \par
  \centering
  \varwidth{\linewidth}%
  \verbatim
}{%
  \endverbatim
  \endvarwidth
  \par
}

% for loops
% \RequirePackage{forloop}

% that's all folks
\endinput
