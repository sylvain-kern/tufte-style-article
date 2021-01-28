\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tufte-style-article}[]

%  _________  ___  ___  ________ _________  _______                      
% |\___   ___\\  \|\  \|\  _____\\___   ___\\  ___ \                     
% \|___ \  \_\ \  \\\  \ \  \__/\|___ \  \_\ \   __/|   ____________     
%      \ \  \ \ \  \\\  \ \   __\    \ \  \ \ \  \_|/__|\____________\   
%       \ \  \ \ \  \\\  \ \  \_|     \ \  \ \ \  \_|\ \|____________|   
%        \ \__\ \ \_______\ \__\       \ \__\ \ \_______\                
%         \|__|  \|_______|\|__|        \|__|  \|_______|                

%  ________  _________    ___    ___ ___       _______                   
% |\   ____\|\___   ___\ |\  \  /  /|\  \     |\  ___ \                  
% \ \  \___|\|___ \  \_| \ \  \/  / | \  \    \ \   __/|   ____________  
%  \ \_____  \   \ \  \   \ \    / / \ \  \    \ \  \_|/__|\____________\
%   \|____|\  \   \ \  \   \/  /  /   \ \  \____\ \  \_|\ \|____________|
%     ____\_\  \   \ \__\__/  / /      \ \_______\ \_______\             
%    |\_________\   \|__|\___/ /        \|_______|\|_______|             
%    \|_________|       \|___|/                                          

%  ________  ________  _________  ___  ________  ___       _______       
% |\   __  \|\   __  \|\___   ___\\  \|\   ____\|\  \     |\  ___ \      
% \ \  \|\  \ \  \|\  \|___ \  \_\ \  \ \  \___|\ \  \    \ \   __/|     
%  \ \   __  \ \   _  _\   \ \  \ \ \  \ \  \    \ \  \    \ \  \_|/__   
%   \ \  \ \  \ \  \\  \|   \ \  \ \ \  \ \  \____\ \  \____\ \  \_|\ \  
%    \ \__\ \__\ \__\\ _\    \ \__\ \ \__\ \_______\ \_______\ \_______\ 
%     \|__|\|__|\|__|\|__|    \|__|  \|__|\|_______|\|_______|\|_______|


% 	This is tufte-style-article.cls,
% 	a LaTeX class inherited from article
%	with a style similar to E.Tufte's designs.
	
% 	For more information about installation and usage,
% 	see readme.md and documentation.pdf. 

%	This class is hosted and maintained
%	by Sylvain Kern
%	on https://github.com/sylvain-kern/tufte-style-article.


%	O P T I O N S
%
\DeclareOption{raggedright}{	% makes all paragraphs left-aligned
	\AtBeginDocument{
		\usepackage{ragged2e}
		\setlength{\RaggedRightParindent}{1em}
		\RaggedRight
	}
}
\DeclareOption{parskip}{		% changes paragraph indents vor vertical skips
	\AtBeginDocument{\RequirePackage{parskip}}
	\setlength{\parskip}{\baselineskip}
}
\DeclareOption{noheaders}{		% disables section titles on page headers
	\renewcommand{\leftmark}{}
	\renewcommand{\rightmark}{}
}
\DeclareOption{casual}{		% removes header numbering --still puts them in toc
	\AtBeginDocument{\setcounter{secnumdepth}{0}}
}
\ProcessOptions\relax
\LoadClassWithOptions{article}

%	P A C K A G E   D E F I N I T I O N
%
\RequirePackage{geometry}		% page geometry, margin definition
\RequirePackage{emptypage}		% if a page is empty, is is really empty
\RequirePackage{fullwidth}		% for wide environments
\RequirePackage{sidenotes}		% for margin stuff
\RequirePackage[
	hypcap=false			% hypcap=true spits an error
]{caption}						% for caption formatting
\RequirePackage[T1]{fontenc}	% font encoding
\RequirePackage[osf]{mathpazo}	% main font
\RequirePackage{gillius}		% sans font
\RequirePackage[
	defaultmono,
	scale=.86
]{droidsansmono}				% mono font
\RequirePackage{titlesec}		% header customization
\RequirePackage{titletoc}		% toc customization
\RequirePackage{fancyhdr}		% page header customization
\RequirePackage{graphicx}		% for images
\RequirePackage[
	protrusion=true,
	expansion=true,
	final,
	tracking,
]{microtype}					% microtypography: fine-tuning in text
\RequirePackage{amsfonts}		% math fonts
\RequirePackage{amsmath}		% math stuff
\RequirePackage{physics}		% handy shortcuts for physics
\RequirePackage{minted} 		% for code display
\RequirePackage{xcolor}			% colorz
\RequirePackage[framemethod=TikZ]{mdframed} % for custom code boxes
\RequirePackage{tabularx}		% adaptive columns on tables
\RequirePackage{booktabs}		% better looking tables
\RequirePackage{enumitem}		% better looking lists
\RequirePackage[
	super,
	square
]{natbib}						% customize \cite{}
\RequirePackage[hidelinks]{hyperref}	% automatic references in pdf
\RequirePackage{etoolbox}		% really idk what this does
\RequirePackage{verbatim}   	% for verbatim environments

%	G E O M E T R Y  D E F I N I T I O N
%
\newgeometry{
	textwidth = .8\paperwidth,
	textheight = .75\paperheight,
	lmargin = 70pt,
	marginparwidth = 0pt,
	marginparsep = 0pt,
	headheight = 15pt,
	tmargin = 80pt,
	%showframe,
}
\savegeometry{headaz}
\newgeometry{
	textwidth = .62\paperwidth,
	textheight = .75\paperheight,
	lmargin = 70pt,
	marginparwidth = .28\textwidth,
	marginparsep = 10pt,
	headheight = 15pt,
	tmargin = 80pt,
	%showframe,
}
\savegeometry{regular}

%	M A R G I N S
%
\renewcommand*{\marginfont}{\footnotesize}
\renewcommand{\marginnote}[1]
{\sidenote{\raggedright\footnotesize #1 \vskip 4pt}}

\newcommand{\margintext}[1]
{\marginpar{\raggedright\footnotesize #1 \vskip 4pt}}

\newenvironment{wide}{
\begin{fullwidth}[outermargin=-\marginparwidth-\marginparsep, width=\linewidth+\marginparwidth+\marginparsep]
}%
{
\end{fullwidth}
}

%	P A G E  H E A D E R S
%
\loadgeometry{headaz}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LO]{
	\small\textls{\MakeUppercase{\sffamily\rightmark}} \hfill \normalfont\normalsize\thepage
}
\fancyhead[RE]{
	\normalfont\normalsize\thepage \hfill \small\textls{\MakeUppercase{\sffamily\leftmark}}
}

\fancypagestyle{plain}{
\fancyhf{}
\fancyhead[RO]{\thepage}
\fancyhead[LE]{\hfill}	
}
\loadgeometry{regular}

%	T I T L E  H E A D E R S
%
\titleformat{\section}
	{\itshape\Large}
	{\normalfont\thesection}
	{1em}
	{\itshape}
\titleformat{\subsection}
	{\itshape\large}
	{\normalfont\thesubsection}
	{1em}
	{\itshape}
\titleformat{\subsubsection}
	{\itshape}
	{\normalfont\thesubsubsection}
	{1em}
	{\itshape}

% new title without numbering
\newcommand{\littletitle}[1]{%
	\medskip%
	\noindent\textit{#1}%
	\\\smallskip%
}

%	M A K E T I T L E
%
\newcommand\@maketitlebis{%
	\hfill
	\begin{minipage}{0.9\textwidth}
		\vskip -40pt
		\let\footnote\thanks 
		{\LARGE\raggedright \@title \par }
		\vskip 10pt
		{\Large \itshape \@author \hfill \normalsize \@date}
		\vskip 60pt~
	\end{minipage}
}
\renewcommand\maketitle{
\@maketitlebis
\thispagestyle{empty}
}

%	F I G U R E S  A N D  S T U F F
%
% 	caption formatting
\captionsetup{
	labelsep = endash,
	justification=raggedright,
	font=footnotesize,
	singlelinecheck=off,
}

%	figure macros
\AtBeginDocument{\usepackage[export]{adjustbox}}
\newcommand{\textfig}[4][]{%
	\medskip%
	\marginpar{%
		\vskip 8pt%
		\captionof{figure}{#3}%
		\label{#4}%
	}%
	\noindent\includegraphics[width=#1\textwidth, outer]{#2}%
	\medskip%
}
\newcommand{\marginfig}[3]{
	\marginpar{%
		\includegraphics[width=\marginparwidth]{#1}%
		\vskip-5pt%
		\captionof{figure}{#2}
		\label{#3}%
	}%
}
\newcommand{\widefig}[4][]{%
	\medskip%
	\begin{wide}%
		\noindent\includegraphics[width=#1\linewidth, outer]{#2}%
		\vskip-5pt%
	\end{wide}%
	\marginpar{%
		\vskip 8pt%
		\captionof{figure}{#3}%
		\label{#4}%
	}%
	\medskip%
}
\newcommand{\plainfig}[4][]{%
	\begingroup
	\includegraphics[width=#1\textwidth]{#2}%
	\vskip -5pt%
	\captionof{figure}{#3}%
	\label{#4}%
	\vskip 8pt%
	\endgroup
}
\newcommand{\plainwidefig}[4][]{%
	\begingroup
	\begin{wide}
	\includegraphics[width=#1\linewidth]{#2}%
	\vskip -5pt%
	\captionof{figure}{#3}%
	\label{#4}%
	\vskip 8pt%
	\end{wide}
	\endgroup
}

%	table macros
\newcolumntype{Y}{>{\centering\arraybackslash}X} % tabularx column type
\newenvironment{texttable}[2]{%
	\begingroup%
	\small%
	\marginpar{%
		\vskip 8pt%
		\captionof{table}{#1}%
		\label{#2}%
	}

	\noindent%
}
{
	\endgroup%
}

%	T O C  C U S T O M I Z A T I O N
%
\contentsmargin[1cm]{0cm}
\titlecontents{section}[0em]
	{\large\vspace{16pt}}
	{\makebox[-1em][r]{\bfseries\large\thecontentslabel}\large\hspace{1em}}
	{\large}
	{~~~~\contentspage}[\vskip 0pt]
% \titlecontents{subsection}[0em]
% 	{\vspace{4pt}}
% 	{\normalfont\thecontentslabel\enspace\itshape}
% 	{\itshape}
% 	{\qquad\contentspage}[\vskip 0pt]
\titlecontents*{subsection}
	[0em]
	{}
	{{\thecontentslabel}~~\itshape}
	{\itshape}
	{~~\thecontentspage}
	[\qquad]
% \titlecontents{subsubsection}[1em]
% 	{\vspace{0pt}}
% 	{\normalfont\thecontentslabel\enspace\itshape}
% 	{\itshape}
% 	{\quad\quad\contentspage}[\vskip 0pt]
\pretocmd{\contentsname}{}{}{}

%	toc offset	
\let\oldtoc\tableofcontents
\renewcommand{\tableofcontents}{
\begin{quote}
\oldtoc
\end{quote}
}

%	T I G H T  L I S T S
%
\setitemize{topsep=0pt}
\setenumerate{topsep=0pt}

%	C O D E
%
\usemintedstyle{colorful}
\definecolor{bg}{rgb}{.95,.95,.95} % background color
\mdfdefinestyle{code_box}{%
	backgroundcolor=bg,
	linewidth=1pt,
	linecolor=lightgray,
	topline=false,
	bottomline=false,
	leftline=false,
	rightline=false,
	innerleftmargin=32pt,
	innertopmargin=1em,
	innerbottommargin=1em, 
	roundcorner=3pt
}
\mdfdefinestyle{code_box_nonos}{%
	backgroundcolor=bg,
	linewidth=1pt,
	linecolor=lightgray,
	topline=false,
	bottomline=false,
	leftline=false,
	rightline=false,
	innerleftmargin=12pt,
	innertopmargin=1em,
	innerbottommargin=1em, 
	roundcorner=3pt
}
\renewcommand{\theFancyVerbLine}{
	\scriptsize
	\textcolor{black}{
		\texttt
		\oldstylenums{}
		\arabic{FancyVerbLine}
	}
}

%	macro environments
\newenvironment{codeboxnum}[1]{%
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			tabsize=2,
			autogobble,
			numbersep=4pt,
			]{#1}%
		}{%
		\end{minted}
	\end{mdframed}
}
\newenvironment{codebox}[1]{%
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box_nonos]%
		\begin{minted}[
			breaklines,
		 	breakanywhere,
			fontsize=\small,
			tabsize=2,
			]{#1}%
		}{%
		\end{minted}
	\end{mdframed}
}
\newenvironment{altcodebox}[1]{% to cite latex code containing codeboxes
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box_nonos]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			tabsize=2,
			]{#1}%
		}{%
		\end{minted}
	\end{mdframed}
}
\newenvironment{nextcodebox}[1]{
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box]
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			firstnumber = last,
			tabsize=2,
			autogobble,
			numbersep=4pt,
			]{#1}
		}
		{
		\end{minted}
	\end{mdframed}
}

%	snippet environments
\newenvironment{snippetnum}[3]{%
	\VerbatimEnvironment%
	\marginpar{%
		\vskip 8pt%
		\captionof{listing}{#2}%
		\label{#3}%
	}%
	\begin{mdframed}[style = code_box]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			tabsize=2,
			autogobble,
			numbersep=4pt,
		]{#1}%
		}%
		{%
		\end{minted}%
	\end{mdframed}%
}
\newenvironment{snippet}[3]{
	\VerbatimEnvironment
	\marginpar{
		\vskip 8pt
		\captionof{listing}{#2}
		\label{#3}
	}
	\begin{mdframed}[style = code_box_nonos]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			tabsize=2,
			autogobble,
			]{#1}%
		}%
		{
		\end{minted}
	\end{mdframed}
}
\newenvironment{nextsnippet}[3]{
	\VerbatimEnvironment
	\marginpar{
		\vskip 8pt
		\captionof{listing}{#2}
		\label{#3}
	}
	\begin{mdframed}[style = code_box]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			firstnumber = last,
			tabsize=2,
			autogobble,
			numbersep=4pt,
		]{#1}
		}%
		{
		\end{minted}
	\end{mdframed}
}

%   Inline code
\newcommand{\inlinecode}[1]{\mintinline[bgcolor=bg, fontsize=\small]{#1}}

%	M I S C E L L A N E O U S
%
%	for  t i g h t  lists (pandoc style)
\providecommand{\tightlist}{%
	\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

\usepackage{minipage-marginpar}

%	M A T H  &  P H Y S I C S
%	S H O R T C U T S
%\iffalse
% uncomment this \iffalse
%and the \fi at the end to disable (or delete)

% i find it more pleasing
\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}
\newcommand{\N}{\mathbb{N}}     % shortcuts for usual number sets
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
%	vectors with a space before
\let\oldvec\vec
\renewcommand{\vec}{\:\oldvec}
% powers of 10
\newcommand{\ee}[1]{\cdot 10^{#1}}
% new vect with overrightarrow style
\newcommand{\vect}[1]{\:\overrightarrow{#1}}
%fi