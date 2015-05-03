\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{thesis}[2015/04/26 Master thesis class]
\LoadClass[a4paper,oneside,listof=totoc]{scrreprt}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english,ngerman]{babel}
\usepackage{parskip}
\usepackage[toc,page]{appendix}
\renewcommand\appendixname{Anhang}
\renewcommand\appendixpagename{\normalfont\textsc\appendixname}
\renewcommand\appendixtocname{\appendixname}

\usepackage{microtype}

\usepackage{etoolbox}
\patchcmd{\abstract}{\null\vfil}{}{}{}

% Simulates the behaviour of a normal \chapter*{Abstract}
\let\oldabstract\abstract
\let\endoldabstract\endabstract
\renewenvironment{abstract}[1][Abstract]{
\begin{minipage}{\textwidth}
  \vspace{0.625cm}
  \chapter*{#1}
  \vspace{-0.575cm}
  \oldabstract
    \thispagestyle{plain}
}{
  \endoldabstract
\end{minipage}
}

\usepackage[backend=biber,style=alphabetic,firstinits=true]{biblatex}
\input{acm.tex}

\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage[hidelinks]{hyperref}
\usepackage[toc]{glossaries}
\usepackage{geometry}
\usepackage{graphicx}
\usepackage{titling}
\usepackage[normalem]{ulem}

\usepackage{subcaption}
\usepackage{booktabs}
\usepackage{tabularx}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}{>{\center\arraybackslash}p{1cm}}
\setlength{\tabcolsep}{12pt}

\usepackage{sourcecodepro}

\usepackage[newfloat]{minted}
\usemintedstyle{trac}
% \usemintedstyle{bw}
\newminted{lisp}{linenos,frame=leftline}
\newminted{ruby}{linenos,frame=leftline}
\newcommand\inlinelisp[1]{\mintinline{lisp}{#1}}
\newcommand\inlineruby[1]{\mintinline{ruby}{#1}}
\SetupFloatingEnvironment{listing}{listname=Listingverzeichnis}

\usepackage{titlesec}
\titleformat{\chapter}[display]{}{\vspace{-0.725cm}\large\scshape\filcenter\sout{\hfill}~\chaptername~\thechapter~\sout{\hfill}}{0pt}{\normalfont\Huge\scshape\raggedright}[]

\setkomafont{chapter}{\normalfont\Huge\scshape}
\setkomafont{section}{\normalfont\LARGE\scshape}
\setkomafont{subsection}{\normalfont\Large\scshape}
\setkomafont{subsubsection}{\normalfont\large\bfseries\scshape}
\setkomafont{paragraph}{\normalfont\bfseries\scshape}
\setkomafont{descriptionlabel}{\usekomafont{paragraph}} 
\setkomafont{chapterentry}{\normalfont\bfseries} 

\newcommand\thesistype[1]{\newcommand\@thesistype{#1}}
\newcommand\studentnumber[1]{\newcommand\@studentnumber{#1}}
\newcommand\emailaddress[1]{\newcommand\@emailaddress{#1}}
\newcommand\reviewers[2]{\newcommand\@firstreviewer{#1} \newcommand\@secondreviewer{#2}}
\newcommand\universitylogo[1]{\newcommand\@universitylogo{#1}}
\newcommand\faculty[1]{\newcommand\@faculty{#1}}
\newcommand\glossaryfile[1]{\include{#1} \makeglossaries}
\newcommand\dates[2]{\newcommand\@begindate{#1}\newcommand\@enddate{#2}}

\newcommand\dateplaceandsignature[1]{%
\par\noindent\makebox[5cm]{\hrulefill} \hfill \makebox[5cm]{\hrulefill}%
\par\noindent\makebox[5cm][l]{Ort, Datum} \hfill \makebox[5cm][l]{#1}%
}

\renewcommand\maketitle{
\newgeometry{top=2cm,bottom=2cm,left=4cm,right=4cm}
\renewcommand{\thepage}{\Roman{page}}
\begin{titlepage}
  \begin{center}
    {\large\scshape\sout{\hfill}~\@thesistype~\sout{\hfill}\par}
    \vspace{2cm}
    {\huge\scshape\@title\par}
    \vfill
    {\Large\@author}\par
    \vspace{0.5cm}
    {\textls[300]\@studentnumber}\par
    \vspace{0.25cm}
    \@emailaddress\par
    \vfill
    \begin{minipage}{\textwidth}
      \begin{tabularx}{\textwidth}{R@{\ --\ }L}
        \@begindate & \@enddate
      \end{tabularx}
    \end{minipage}
    \vfill
    \begin{minipage}{\textwidth}
      \begin{tabularx}{\textwidth}{R@{\hspace{0.5cm}}L}
        Erstgutachter & \@firstreviewer\\
        Zweitgutachter & \@secondreviewer
      \end{tabularx}
    \end{minipage}
    \vfill
    \includegraphics[width=0.5\textwidth]{\@universitylogo}\par
    {\large\scshape \@faculty}
  \end{center}
\end{titlepage}
\restoregeometry
\cleardoublepage
}

% Make ToC, LoL, LoF, LoT
\newcommand\makelists{
\tableofcontents
\cleardoublepage
\listoflistings
\cleardoublepage
\listoffigures
\cleardoublepage
\listoftables
\cleardoublepage
\setcounter{page}{1}
\renewcommand{\thepage}{\arabic{page}}
}

\let\oldappendices\appendices
\let\endoldappendices\endappendices
\renewenvironment{appendices}{
\oldappendices
\let\oldchaptername\chaptername
\renewcommand\chaptername{\appendixname}
\addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
\makeatletter
\addtocontents{toc}{%
  \begingroup
  \let\protect\l@chapter\protect\l@section
  \let\protect\l@section\protect\l@subsection
}
\makeatother
}{
\addtocontents{toc}{\endgroup}
\renewcommand\chaptername{\oldchaptername}
\endoldappendices
}
