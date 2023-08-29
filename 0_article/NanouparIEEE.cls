 

\newif\if@colTwo
\DeclareOption{colTwo}{%
\@colTwotrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{journal}}
\ProcessOptions
% OneColumn es para ejecución de una columna si no se inicializa colTwo
% By default, the IEEEtran article uses the oneside class option, meaning only the left header is used. To actually use \markboth, its as easy as calling twoside instead:
\LoadClass[10pt,journal,onecolumn,twoside]{IEEEtran}

% Math mode
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath,amsthm}
% Languages
\RequirePackage[spanish,english]{babel}
% needed for logo and pictures
\RequirePackage{graphicx}
\RequirePackage[table,dvipsnames]{xcolor}
% extras
\RequirePackage{latexsym,ifthen,rotating,calc,textcase,booktabs,endnotes}
\RequirePackage[errorshow]{tracefnt}

\RequirePackage[
type={CC},
modifier={by},
version={3.0},
]{doclicense}

%
\definecolor{grisMedio}{cmyk}{0,0,0,0.5}
\definecolor{gris-oscuro}{cmyk}{0,0,0,0.8}

\usepackage[colorlinks,bookmarksopen,bookmarksnumbered,citecolor=red,urlcolor=red]{hyperref}
\usepackage{verbatim}               
\usepackage{enumerate}
\usepackage{enumitem}
\usepackage{array}                              
\usepackage{multicol}
\usepackage[multiple]{footmisc}
\usepackage{url}

%  To include some slightly more complicated figures with multiple images. This package load the caption package.
\usepackage{subcaption}
\renewcommand{\UrlFont}{\normalsize}

\hyphenpenalty=1000
\pretolerance=8000
\tolerance=9500
\hbadness=8000
\vbadness=9000
\displaywidowpenalty=0
\clubpenalty=10000
\widowpenalty=10000
\lefthyphenmin=3%
\righthyphenmin=3%
\brokenpenalty=10000%
 
\newcommand{\FontsizeTi}{\fontsize{17.27pt}{19.2pt}\selectfont}
\newcommand{\FontsizeSubTi}{\fontsize{14.03pt}{15.6pt}\selectfont}
\newcommand{\FontsizeAuthor}{\fontsize{10.79pt}{12pt}\selectfont}
\newcommand{\refsize}{\fontsize{9}{12pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8}{10pt}\selectfont}
\renewcommand{\scriptsize}{\fontsize{7}{8.5pt}\selectfont}
\renewcommand{\large}{\fontsize{12}{14pt}\selectfont}

 
\newbox\absbox
\def\abstract{\lrbox\absbox\minipage{\textwidth}}
\def\endabstract{\endminipage\endlrbox}

\newenvironment{abstracts}
{\global\setbox\absbox=\vbox\bgroup
	\hsize=\textwidth
	\linespread{1}}
{\egroup}

\renewenvironment{abstract}[1][]
{\if\relax\detokenize{#1}\relax\else\selectlanguage{#1}\fi
{\noindent\@palwords}\par\bigskip\noindent{\MakeUppercase{\textbf{\abstractname}}}\par\ignorespaces}
{\par \noindent\@keywords}

 \def\palwords#1{\gdef\@palwords{\begin{minipage}{\textwidth}{\fontsize{9.03pt}{10pt}\selectfont \textbf{Palabras clave:}}   {#1}\end{minipage}}}
 \let\@palwords\@empty
\def\keywords#1{%
	\gdef\@keywords{\begin{minipage}{\textwidth}{\fontsize{9.03pt}{10pt}\selectfont  \textbf{Keywords:}} {#1}\end{minipage}}}
 \let\@keywords\@empty
 
\gdef\footnoterule{\kern-3\p@ {\color{grisMedio}\hrule width 2in height 0.5pt} \kern 2mm}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\long\def\@makefntext#1{\parindent 0em%
\noindent{$\m@th^{\@thefnmark}$}#1}

\newcommand{\CCbY}[1]{%
  \gdef\@CCbY{%
\footnotetext[0]{\begin{minipage}{0.47\textwidth} \fontsize{7.03pt}{8.4pt}\selectfont\doclicenseImage[imagewidth=6em] Attribution 4.0 International (CC BY 4.0) Share - Adapt\end{minipage} }}}
\let\@CCbY\@empty

 
 
\def\Howtocite#1{\gdef\@Howtocite{%
\footnotetext[0]{\par\vskip-3pt\noindent\fbox{\begin{minipage}{0.47\textwidth}\noindent\textbf{How to cite:} \fontsize{7.03pt}{8.4pt}\selectfont #1\end{minipage}}\par\vskip 1pt}}}
\let\@Howtocite\@empty


\def\affiliation#1{%
  \gdef\@affiliation{%
    \footnotetext[0]{\fontsize{7.03pt}{8.4pt}\selectfont #1}}}
\let\@affiliation\@empty

\def\affilnum#1{$^{\text{{#1}}}$}


\def\@subtitle{\relax}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}} 
 

\def\@doi{\relax}
\newcommand{\doi}[1]{\gdef\@doi{https://#1}}  

\renewcommand\maketitle{\par
  \begingroup
     \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
       \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{title}\label{FirstPage}\@affiliation%
  \endgroup
  %\setcounter{footnote}{0}%
  \global\let\affiliation\relax
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\relax
  \global\let\@title\@empty
  \global\let\@affiliation\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\and\relax
}
\def\@maketitle{%
 

\begin{center}
 
\vspace*{-0.4cm}
\begin{minipage}[t]{\textwidth}
		{\flushright\fontsize{7.02pt}{8.4pt}\selectfont\@doi\par}
	\vskip 1.5em%
\end{minipage} 
\begin{minipage}[t]{\textwidth-28mm}
  \vskip 12.5pt%
  	{\centering\usefont{T1}{fnc}{b}{n}\FontsizeTi\@title\par}
     \vskip 1.5em%
    \end{minipage} 
\begin{minipage}[t]{\textwidth-28mm}
	\vskip 12.5pt%
	{\centering\usefont{T1}{fnc}{b}{n}\FontsizeSubTi\@subtitle\par}
	\vskip 1.5em%
	\vskip 12.5mm%
\end{minipage} 
{\par%
 
{\centering\usefont{T1}{fnc}{m}{n}\FontsizeAuthor\@author\par}}
{\noindent\usebox\absbox\par}
    
    {\vspace{0pt}%
      %
  }
 
      \end{center}
 
  }
 
\def\startpage{\pageref{FirstPage}}
\def\endpage{\pageref{LastPage}}
\def\volumeyear{0000}
\def\volumenumber{1}
\def\issuenumber{1}

\def\@researchgroup{}
\def\researchgroup#1{%
	\gdef\@researchgroup{#1}}


\def\authorrunning#1{\markboth{}{{#1}}}
\def\@titlerunning{}
\def\titlerunning#1{%
	\gdef\@titlerunning{#1}}


\def\ps@title{%
\def\@oddhead{\parbox{\textwidth}{\noindent{\color{grisMedio}\rule{\textwidth}{1.5pt}}\\\mbox{\fontsize{9.02pt}{10.8pt}\selectfont \@researchgroup}\\[-5pt]
{\noindent\color{grisMedio}\rule{\textwidth}{0.5pt}}}}%
\let\@evenhead\@oddhead
\def\@oddfoot{\parbox[t]{\textwidth}{\hfill \footnotesize\@researchgroup \quad \thepage \ \includegraphics{images/number_page_logo.pdf} }}
\let\@evenfoot\@oddfoot}


\def\ps@headings{%
	\let\@mkboth\@gobbletwo
	\def\@evenhead{\parbox{\textwidth}{\fontsize{9.02pt}{10.8pt}\selectfont\scshape{\@titlerunning}\\[-6pt]
			\noindent\color{grisMedio}\rule{\textwidth}{0.5pt}}}
	\def\@oddhead{\parbox{\textwidth}{\hfill
			\fontsize{9.02pt}{10.8pt}\selectfont\itshape{\rightmark}\\[-6pt]
			\noindent\color{grisMedio}\rule{\textwidth}{0.5pt}}}
	\def\@evenfoot{\parbox[t]{\textwidth}{\footnotesize \selectfont \includegraphics{images/number_page_logo.pdf}\ \thepage \quad \@researchgroup}}
	\def\@oddfoot{\parbox[t]{\textwidth}{\hfill \footnotesize\@researchgroup \quad \thepage \ \includegraphics{images/number_page_logo.pdf} }}
}

 

\AtBeginDocument{%
	\renewcommand\tablename{Tabla}
}
\AtBeginDocument{%
	\renewcommand\figurename{Figura}
}
 
 
 
\pagestyle{headings}
 
 


\if@colTwo
\twocolumn
\fi

\sloppy