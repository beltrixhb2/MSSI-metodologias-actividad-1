\usepackage[utf8]{inputenc}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formato/UNIR}[2018/09/01 UNIR TFM LaTeX class]

% Clase base (libro)
\LoadClass[a4paper,11pt,oneside]{book}


% Bibliografía (no establecido por UNIR, cosecha propia)
\RequirePackage[bibencoding=utf8,maxcitenames=1,backend=biber,bibstyle=authoryear,citestyle=apa,sorting=ynt]{biblatex}
\addbibresource[location=local]{contenido/TFM-biblio.bib}
%\AtEveryBibitem{[\printfield{labelnumber}]\addspace}
% \cite{xxx} -> (Author, Year)
\renewcommand*{\cite}[1]{\parencite{#1}}
% \apa{XXX} -> Author (Year)
\newcommand*{\apa}[1]{\citeauthor{#1} (\citeyear{#1})}


% Conveniencia: negrita con comando \n (para preservar identado de tablas con negrita)  
\def\n{\bfseries}
\def\glmtr{\guillemotright}
\def\glmtl{\guillemotleft}
% Gráficos
\RequirePackage{graphicx}

% Parámetros de entrada (aparte de title, author y date)
\RequirePackage{xstring}
\RequirePackage{etoolbox}

% Inicialización de variables
\newcommand{\autorv}{}
\newcommand{\titulov}{}
\newcommand{\fechav}{}
\newcommand{\universidadv}{}
\newcommand{\escuelav}{}
\newcommand{\masterv}{}
\newcommand{\tipoTesisv}{}
\newcommand{\directorv}{}
\newcommand{\ciudadv}{}
\newcommand{\asignaturav}{}
\newcommand{\keywordsv}{}
\newcommand{\keywordsESv}{}

% Definición de comandos de entrada
\def\autor#1{\author{#1}\gdef\autorv{#1}}
\def\titulo#1{\title{#1}\gdef\titulov{#1}}
\def\fecha#1{\date{#1}\gdef\fechav{#1}}
\def\universidad#1{\gdef\universidadv{#1}}
\def\escuela#1{\gdef\escuelav{#1}}
\def\master#1{\gdef\masterv{#1}}
\def\asignatura#1{\gdef\asignaturav{#1}}
\def\tipoTesis#1{\gdef\tipoTesisv{#1}}
\def\director#1{\gdef\directorv{#1}}
\def\ciudad#1{\gdef\ciudadv{#1}}
\def\keywords#1{\gdef\keywordsv{#1}}
\def\keywordsEs#1{\gdef\keywordsESv{#1}}


%Tablas
\RequirePackage{float}
\RequirePackage{tabularx}
\newcolumntype{L}[1]{>{\hsize=#1\hsize\raggedright\arraybackslash}X}%
\newcolumntype{R}[1]{>{\hsize=#1\hsize\raggedleft\arraybackslash}X}%
\newcolumntype{C}[1]{>{\hsize=#1\hsize\centering\arraybackslash}X}%
\newcommand{\cc}[1]{\begin{minipage}[c][0.5cm][c]{0.5cm}\centering#1\end{minipage}}

%Captions de imágenes y tables con números consecutivos (no por capítulos)
\RequirePackage[font=small,skip=2pt]{caption}
\RequirePackage{subcaption}
\captionsetup{within=none}

% Formato de Código (no establecido por UNIR, cosecha propia)
\newenvironment{codigo}{
    \begin{minipage}[t][][t]{0.7\textwidth}
    \ttfamily \small \linespread{0}
}{
    \end{minipage}
}
\newcommand{\cod}{\ttfamily \small \linespread{0}}

%  Abstract/Resumen acorde a la UNIR
\newenvironment{abstract}[1][Abstract]{%
    \begin{center}%
        {\fontsize{14}{14}\selectfont\bfseries #1\vspace{-0.5em}}%
    \end{center}%
    \quotation
}{\endquotation\vspace{1cm}}

% Imagenes y texto en dos columnas
\RequirePackage{wrapfig}

%Código
\RequirePackage{multicol}
\RequirePackage{minted}
\newcommand{\Rprompt}{%
  \def\FancyVerbFormatLine##1{{\color{red}>}\ ##1}%
}
\setminted{breaklines,breakbytokenanywhere=true,frame=lines,fontsize=\footnotesize,baselinestretch=1}
\setminted[R]{linenos,style=tango,formatcom=\Rprompt}
\setminted[text]{linenos=FALSE,formatcom=\color{azul}}
\newcommand{\out}[1]{\vspace*{-1.2\baselineskip}\inputminted{text}{#1}}


%Símbolos de monedas en ecuaciones
\RequirePackage{eurosym}

%Números cardinales en inglés
\RequirePackage[super]{nth}


%Color azul UNIR
\RequirePackage[dvipsnames]{xcolor}
\definecolor{azul}{RGB}{81, 131, 187}
\def\azul{\color{azul}}
\def\an{\bfseries\azul}

%Referencias 
\RequirePackage{footmisc}
\RequirePackage{hyperref}

% Configuración de hyperref diferida hasta el inicio del documento
\AtBeginDocument{
    \hypersetup{
        pdftitle={\titulov},
        pdfauthor={\autorv},
        pdfsubject={\masterv},
        pdfpagemode={UseOutlines},
        bookmarksopen=true,
        bookmarksopenlevel=0,
        hypertexnames=false,
        colorlinks=true,
        pdfborder={0 0 0},
        citecolor=blue,
        linkcolor=blue,
        urlcolor=blue,
        pdfstartview={FitV},
        breaklinks=true,
        pdfkeywords={\keywordsESv}
    }
}

%Metadatos
\RequirePackage{hyperxmp}     

%Tablas (líneas horizonales toprule,bottomrule,midrule)
\RequirePackage{booktabs}

%Estructura del documento
\RequirePackage[toc,page,title,titletoc]{appendix}
\renewcommand*\appendixpagename{Apéndices}

%Idioma
\RequirePackage[spanish]{babel}
\addto\captionsspanish{\renewcommand{\tablename}{Tabla}}
\addto\captionsspanish{\renewcommand{\listtablename}{Índice de Tablas}}

%Márgenes UNIR
\RequirePackage{geometry}
\geometry{
	paper=a4paper,  
	left=3.5cm,
	right=1.5cm,
	top=2.5cm, 
	bottom=2.5cm,
	headheight=0.75cm,
	headsep=1.5cm,
	footskip=1.5cm,
	%showframe, % Ver marcos
}

% Cabeceras y pies de página UNIR
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

\fancypagestyle{mainmatter}{%
    \fancyhead{}%
    \lhead{}%
    \chead{}%
    \rhead{\asignaturav}%
    \lfoot{{\color{azul}\titulov}}%
    \cfoot{}%
    \rfoot{\thepage\ de \getpagerefnumber{LastPage}}}

\fancypagestyle{frontmatter}{%
    \fancyhead{}%
    \lhead{}%
    \chead{}%
    \rhead{\asignaturav}%
    \lfoot{{\color{azul}\titulov}}%
    \cfoot{}%
    \rfoot{\thepage}}

% Necesario para forzar encabezados y pies de página en la primera página de cada    
%\usepackage{etoolbox}      
\RequirePackage{setspace} % Espaciado entre líneas
\setstretch{1.5}
\RequirePackage[autostyle=true]{csquotes} % Referencias en UTF8

% Dependiendo del compilador se utilizan fuentes true type o fuentes convertidas (TFM)
\RequirePackage{array}
\RequirePackage{ifluatex,ifxetex}
\ifnum\ifluatex1\else\ifxetex1\else0\fi\fi
    =1 %
    \input{formato/fuentes/confTTF}
\else
    \input{formato/fuentes/confTFM}
\fi

%--- Portada ---%
\renewcommand*{\maketitle}{%
    \begin{titlepage}%
        {\flushleft%
            \IfFileExists{./contenido/imagenes/logo-UNIR.pdf}{%
                \includegraphics[width=8.18cm]{./contenido/imagenes/logo-UNIR.pdf}%
            }{%
                \fbox{\begin{minipage}[c][2cm]{8cm}\centering\textbf{Falta logo-UNIR.pdf}\end{minipage}}%
            }\par
        }%
        \vspace{1cm}
        \begin{table}[h!]
        \hyphenpenalty=10000
        \setlength\arrayrulewidth{2pt}
            \begin{tabularx}{14.5cm}{ L{0.074} !{\color{azul}\vline}  L{0.931} }
                & \\
                & \fontsize{14}{14}\selectfont \georgiab \masterv \\
                & \\
                & \fontsize{14}{14}\selectfont  \georgiab \asignaturav \\
                & \\ & \\ & \\
                & \fontsize{30}{36}\selectfont \bfseries \color{azul}   \titulov \\

            \end{tabularx}
        \end{table}
        \vspace{0.5cm}
        {\flushleft \fontsize{11}{11}\selectfont %
                \vspace{0.5cm}
                Presentado por: \georgiamd \autorv \par
        }
    \end{titlepage}}
