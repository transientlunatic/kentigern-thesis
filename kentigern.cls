\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kentigern}[2016/04/06 v1.0 A LaTeX document class for nice documents by Daniel Williams.]

\PassOptionsToClass{\CurrentOption}{memoir}
\LoadClass[a4paper, openright, 12pt, oldfontcommands]{memoir}

 \usepackage{afterpage}

 \usepackage{calc}
 \usepackage{microtype}
 \RequirePackage{xparse}

 %%%% Allow complex maths
 \usepackage{amsmath}
 \usepackage{amsthm}
 \usepackage{mathtools}

 %%%% Box Environments
 \usepackage{color}					% Coloured Text
 \usepackage[dvipsnames]{xcolor}


% %%%% Colours what'll be useful
\definecolor{muted-blue}{HTML}{195073}
\definecolor{muted-green}{HTML}{7F8C1F}
% \definecolor{muted-orange}{HTML}{EE913F}
% \definecolor{muted-cream}{HTML}{F2E5BD}
% \definecolor{muted-egg}{HTML}{9FD7C7}
 
 \ifdefined\HCode 
 %\usepackage{hyperref}
  \else
 \usepackage[pdfusetitle]{hyperref}
 %%%% Hyperref Settings
 \hypersetup{
     colorlinks,
     pdfborder={0 0 0},
     linkcolor={muted-blue},
     citecolor={blue!50!black},
     urlcolor={blue!80!black}
 }
 \fi
 

% % 



% %%% The big derivation float
% \newfloat[chapter]{bigderiv}{lod}{Derivation}
% %\setfloatadjustment{bigderiv}{\hrule}

% % %%%% Counters
\renewcommand{\fnum@figure}{\textbf{\figurename~\thefigure}}
\renewcommand{\fnum@table}{\textbf{\tablename~\thetable}}
\renewcommand\@memmain@floats{%
   \counterwithin{figure}{section}
   \counterwithin{table}{section}
   %\counterwithin{bigderiv}{section}
}
\captiondelim{: }

% %%%% Fonts

\usepackage[T1]{fontenc}
 \ifdefined\HCode 
  \else
  \usepackage[tikz]{mdframed}
  \usepackage{gillius}
  \usepackage[cmintegrals,cmbraces]{newtxmath}
  \usepackage{ebgaramond-maths}
  \usepackage[T1]{fontenc}
 \fi




%%%% Declare some macros which get replaced later
\let\Chaptername\null

% %%%% Change how Parts be made
\let\printpartname\relax
\let\printpartnum\relax
\let\beforepartskip\relax
\makeatletter
\newcommand{\beforepartskip}{\newpage\null}
\renewcommand*{\afterpartskip}{\par\@afterindentfalse\@afterheading}
 \makeatother
 \nopartblankpage
\renewcommand{\partnamefont}{\color{muted-green}\normalfont\huge\sffamily\raggedright}
 \renewcommand{\partnumfont}{\color{muted-green}\normalfont\huge\sffamily\raggedright}
 \renewcommand{\parttitlefont}{\color{muted-green}\normalfont\Huge\sffamily\raggedright}

%\let\Chaptermark\chaptermark
%\def\chaptermark#1{\def\Chaptername{#1}}
% \let\Partmark\partmark
% \def\partmark#1{\def\Partname{#1}\Partmark{#1}}


%%%%% Epigraph
\setlength{\epigraphwidth}{7cm}

%%%% Margins

%\setstocksize{12in}{12in}
%\settrimmedsize{6in}{12in}{*}

\marginparmargin{outer}
\sidebarmargin{outer}
%\setsidebars{1cm}{1.0\marginparwidth}{\onelineskip}%
%\setsidebars{1cm}{1.4\marginparwidth}{\onelineskip}%
%{0pt}{\normalsize\normalfont }{\textheight}

\settypeblocksize{8.75in}{5in}{*}

\setlrmargins{*}{3cm}{*}
% \setlrmargins{*}{2cm}{*}
\setulmarginsandblock{4cm}{*}{*}
% \setulmarginsandblock{4cm}{*}{*}
\setheadfoot{2cm}{2cm}
\setheaderspaces{*}{1.5cm}{*}
%\setmarginnotes{3cm}{1.5cm}{1cm}
% \setmarginnotes{6cm}{1.5cm}{1cm}

\checkandfixthelayout

%%%% Headers & Footers
\makeevenhead{headings}%
    {\sffamily \color{Maroon} \Chaptername}{}{}
\makeoddhead{headings}%
    {}{}{\sffamily \color{Maroon} \Chaptername}
\makeevenfoot{headings}%
    {\thepage \quad \vrule}{}{}
\makeoddfoot{headings}%
    {}{}{\vrule \quad \thepage}
\makeevenfoot{plain}%
    {\thepage \quad \vrule}{}{}
\makeoddfoot{plain}%
    {}{}{\vrule \quad \thepage}
\makeevenhead{plain}%
    {\sffamily \color{Maroon} \phantom{Hello}}{}{}
\makeoddhead{plain}%
    {}{}{\sffamily \color{Maroon} \phantom{Hello}}
\copypagestyle{title}{plain}
\makeevenhead{title}%
    {\null}{}{}
\makeoddhead{title}%
    {}{}{\null}
\makeoddfoot{title}%
    {\null}{\null}{\null}%\vrule \quad \thepage}
\makeevenfoot{title}%
     {\null}{\null}{\null}%\vrule \quad \thepage}


     \copypagestyle{kentigern}{plain}
     \makeevenhead{kentigern}{\Chaptername}
     
     
%%%% Automatic Title Generation Settings.


% \setlength\droptitle{-1cm}

% % Hook A appears above the title.
% %\def\maketitlehooka{
% %
% %}

% % Hook B appears below the title
% %\def\maketitlehookb{
% %
% %}

% % The Pre-title hook changes the behaviour 
% % of the rendering engine prior to setting the title.

     \pretitle{%
       \begingroup
       \fontsize{1.5cm}{2cm}\selectfont
}%

\posttitle{%
  \endgroup
}%

% \preauthor{
%   \vspace*{-.1cm}
%    \hfill
%    \begin{minipage}{0.18\textwidth}
%    \hfill
%  }
%  \postauthor{
%    \end{minipage}
%  }
% \predate{
%    \begin{minipage}{\textwidth}
%    \hfill
%  }
\postdate{
  \newpage
}

% %%%% Part Headings

\renewcommand{\beforepartskip}{\null}
\renewcommand{\afterpartskip}{\null}


%%%% Chapter Headings
\makechapterstyle{kentigern}{%
  \chapterstyle{minimalist}%
  \renewcommand*{\chapnamefont}{}%
  \renewcommand*{\chaptitlefont}{%
    % \fontsize{1.5cm}{2.5cm}\selectfont%
    %\Huge
    \fontsize{30}{35}\selectfont
    \baselineskip=35pt
    \parskip=50pt
    %\sffamily
  }
  \renewcommand*{\precisfont}{\sffamily}
  \renewcommand*{\chapnumfont}{\fontsize{2.5cm}{2.5cm}\selectfont}
  \renewcommand*{\printchaptername}{}
  \settowidth{\chapindent}{\chapnumfont 999}
  \renewcommand*{\afterchapternum}{}
  \renewcommand*{\printchapternum}{
    \begin{tikzpicture}[overlay]
      \draw (-2cm, 0cm) [anchor = north west] node (number) {\chapnumfont%
        \thechapter\space};% \\[2cm]
    \end{tikzpicture}\\
  }
  \renewcommand{\printchaptertitle}[1]{%
    \begin{tikzpicture}%[overlay, remember picture]
      \draw (-2cm, -1cm) node [align = flush left, anchor = north west, text width = \textwidth] {%
        % \linespread{1.5}%
        {\chaptitlefont\noindent ##1 \par}%
      };% \\[2cm]
    \end{tikzpicture}\\
  }%
}%
\renewcommand{\prechapterprecis}{\\[2cm]}
\renewcommand{\chapterprecis}[1]{%
  \prechapterprecis
  \vspace{2cm}
  \precisfont%
  \noindent%
  #1%
  \rmfamily
  \postchapterprecis
  \newpage
}%

\chapterstyle{kentigern}
%\setlength\beforechapskip{1cm}
%\setlength{\prechapterprecisshift}{1cm}
\def\prechapterprecis{\precisfont\noindent}
\def\postchapterprecis{\rmfamily\vspace{1.5cm}}

\def\afterchaptertitle{
  %\pagecolor{muted-green}\afterpage{\nopagecolor}
  %\newpage
  %\vspace{1cm}
}
\def\clearforchapter{
  %\cleardoublepage
  \newpage
}

\setsecnumformat{\csname #1secnumformat\endcsname}
\newcommand\sectionsecnumformat{\thesection \quad | \quad}
\newcommand\subsectionsecnumformat{\fbox{\enspace\thesubsection\enspace}\enspace}