\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ActaOulu}[2012/12/19 -- Style for Acta Universitatis Ouluensis, created by Ville Varjonen]

\clubpenalty=10000
\widowpenalty=10000
\setlength\parindent{0.63cm}

\RequirePackage{ifthen}[2001/05/26]
\newboolean{tablelist}
\newboolean{figurelist}
\DeclareOption{tablelist}{\setboolean{tablelist}{true}}
\DeclareOption{figurelist}{\setboolean{figurelist}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\newboolean{numbers}
\DeclareOption{numbers}{\setboolean{numbers}{true}}
\DeclareOption*{numbers}{\PassOptionsToPackage{\CurrentOption}{natbib}}
\newboolean{sort&compress}
\DeclareOption{sort&compress}{\setboolean{sort&compress}{true}}
\DeclareOption*{sort&compress}{\PassOptionsToPackage{\CurrentOption}{natbib}}
\ProcessOptions \relax

\LoadClass{book}[2005/09/16]

\RequirePackage[finnish,english]{babel}[2005/05/21]
\addto\captionsenglish{%
  \renewcommand{\figurename}%
    {Fig.}%
}
\addto\captionsenglish{%
  \renewcommand{\bibname}%
    {References}%
}
\RequirePackage{calc}[2005/08/06]
\newlength{\Mylen}

\RequirePackage{mathptmx}[2005/04/12]

\RequirePackage{helvet}[2005/04/12]

\RequirePackage{tabularx}[1999/01/07]
\newcolumntype{Y}{@{}>{\footnotesize\sffamily\raggedright\arraybackslash}X}
\newcolumntype{C}{@{}>{\footnotesize\sffamily\centering\arraybackslash}X}
\newcolumntype{R}{>{\footnotesize\sffamily\raggedright\arraybackslash}r}
\newcolumntype{L}{>{\footnotesize\sffamily\arraybackslash}l}

\RequirePackage[a4paper,twoside,top=4.75cm,bottom=6.6cm,left=3.8cm,right=5cm,bindingoffset=0cm]{geometry}[2002/07/08]

\RequirePackage{fancyhdr}
\fancypagestyle{acta}{%
\fancyhf{} % clear all six fields
\fancyfoot[LE,RO]{The layout of this page will be finished by ACTA}
\fancyhead[LE,RO]{The layout of this page will be finished by ACTA}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
}
\fancypagestyle{plain}{%
\fancyhf{} % clear all six fields
\fancyfoot[LE,RO]{\sffamily\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\fancyfoot[LE,RO]{\sffamily\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
\fancyhf{} % clear all six fields
\fancyfoot[LE,RO]{\sffamily\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

\RequirePackage[sf,bf,medium,noindentafter]{titlesec}[2005/01/22]
\titleformat{\chapter}[hang]{\Large\bfseries\sffamily}{\thechapter}{1.5cm - \widthof{\Large\bfseries\sffamily\thechapter}}{\filright}{}
\titlespacing{\chapter}{0cm}{0cm}{10pt}[0cm]
\titleformat{\section}[hang]{\normalsize\bfseries\sffamily}{\thesection}{1.5cm - \widthof{\normalsize\bfseries\sffamily\thesection}}{\filright}{}
\titlespacing{\section}{0cm}{18pt}{10pt}[0cm]
\titleformat{\subsection}[hang]{\normalsize\it\bfseries\sffamily}{\thesubsection}{1.5cm - \widthof{\normalsize\it\bfseries\sffamily\thesubsection}}{\filright}{}
\titlespacing{\subsection}{0cm}{18pt}{10pt}[0cm]
\titleformat{\subsubsection}[hang]{\normalsize\it\sffamily}{}{1.5cm}{\filright}{}
\titlespacing{\subsubsection}{0cm}{18pt}{10pt}[0cm]

\RequirePackage{titletoc}[2005/01/22]
\contentsmargin[1.27cm]{0.0cm}
\titlecontents{chapter}[0.5cm]{\normalsize\normalfont\bfseries \filright}{\contentslabel[\thecontentslabel]{0.5cm}}{\hspace*{-0.5cm}}{\hfill\thecontentspage}[]
\titlecontents{bibliography}[0.5cm]{\normalsize\normalfont\bfseries \filright}{\contentslabel[\thecontentslabel]{0.5cm}}{\hspace*{-0.5cm}}{\hfill\thecontentspage}[]
\titlecontents{section}[1.23cm]{\normalsize\normalfont \filright}{\contentslabel[\thecontentslabel]{0.73cm}}{}{\dotfill\thecontentspage}[]
\titlecontents{subsection}[2.23cm]{\normalsize\normalfont \filright}{\contentslabel[\thecontentslabel]{1.0cm}}{}{\dotfill\thecontentspage}[]

\RequirePackage{enumitem}[2007-06-30]
\setlist{noitemsep, align=left, labelindent=0.0cm, listparindent=\parindent} 
\setitemize{leftmargin=*, label=\textendash}
\setenumerate{leftmargin=*}
\setenumerate[1]{label=\arabic*., ref=\arabic*}
\setenumerate[2]{label=\alph*),ref=\theenumi.\alph*}
\setenumerate[3]{label=\roman*, ref=\theenumii.\roman*}
\setdescription{font=\sffamily\bfseries}


\RequirePackage{float}[2001/11/08]

\RequirePackage[labelformat=simple, labelsep=period, justification=justified, singlelinecheck=false, font={footnotesize,bf,sf}, aboveskip=6pt, belowskip=0pt, tableposition=top]{caption}[2007/04/16]

\ifthenelse{\boolean{numbers}}{%
\RequirePackage[numbers,round]{natbib}[2007/02/05]
\bibpunct{(}{)}{,}{n}{}{,} 
\bibliographystyle{ActaOulu_Num}
\renewcommand\bibnumfmt[1]{#1.}
\setlength\bibsep{0.0cm}}
{\ifthenelse{\boolean{sort&compress}}{%
\RequirePackage[sort&compress]{natbib}[2007/02/05]
\bibpunct{[}{]}{,}{n}{}{,}
\bibliographystyle{ActaOulu_Num}
\renewcommand\bibnumfmt[1]{#1.}
\setlength\bibsep{0.0cm}}
{\RequirePackage{natbib}
\bibpunct{(}{)}{,}{a}{}{,}
\bibliographystyle{ActaOulu}
\setlength\bibhang{\parindent}
\setlength\bibsep{0.0cm}}}

\RequirePackage{tocvsec2}[2004/05/24]

\RequirePackage{remreset}
\@removefromreset{footnote}{chapter}
\@removefromreset{table}{chapter}
\@removefromreset{figure}{chapter}
\@removefromreset{equation}{chapter}
\renewcommand\@makefntext[1]{\noindent{\@makefnmark }#1}
\renewcommand{\thetable}{\@arabic\c@table}       
\renewcommand{\thefigure}{\@arabic\c@figure}       
\renewcommand{\theequation}{\@arabic\c@equation}       

\RequirePackage[reqno]{amsmath}[2000/07/18]
%\setlength\mathindent{\parindent}

\RequirePackage[stretch=48, shrink=20, letterspace=333]{microtype}[2007/07/14]


\renewcommand{\baselinestretch}{1.25}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.7}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.66}
\setlength\textfloatsep{12pt plus 6pt minus 0pt}
\setlength\floatsep{0pt}
\setlength\parskip{0pt}


%Maketitle definition
\renewcommand{\maketitle}{%
\ifx \@author \@empty
  \ClassError{ActaOulu}{\protect\author{} is undefined}
\fi
\ifx \@title \@empty
  \ClassError{ActaOulu}{\protect\title{} is undefined}
\fi
\thispagestyle{acta}
\vbox{}\vfil
\begin{center}
\Huge\@title\\
\vfil
\Large\@author\\
\end{center}
\vfil
\normalfont
\newpage
\thispagestyle{acta}
}

%Abstract
\newenvironment{abstract}
  {\chapter*{\abstractname}%
  \thispagestyle{acta}
  \addtocontents{toc}{\bfseries\abstractname\protect\parindent=0.0pt\par}%              
  }%

%Dedication
\newcommand{\dedicationtext}[1]{Dedicated to}
\newenvironment{dedication}%
  {\thispagestyle{acta}%
  \cleardoublepage%
  \thispagestyle{empty}%
  \vspace*{\stretch{2}}%
     \hfill\huge\itshape}%
     {\vspace*{\stretch{1}}%
	\normalfont}

%Preface
\newenvironment{preface}
  {\chapter*{\prefacename}
  \addcontentsline{toc}{chapter}{\prefacename}}

%Acknowledgements
\newcommand{\acknowledgementsname}{Acknowledgements}
\newenvironment{acknowledgements}
  {\chapter*{\acknowledgementsname}
   \addcontentsline{toc}{chapter}{\acknowledgementsname}}

%Abbreviations
\newcommand{\abbreviationsname}{Abbreviations}
\newenvironment{abbreviations}
  {\chapter*{\abbreviationsname}%
  \addcontentsline{toc}{chapter}{\abbreviationsname}}

\newcommand*\Descriptionlabel[1]{%
  \settowidth\Mylen{\textrm{#1:}}% 
  \ifthenelse{\lengthtest{\Mylen > \labelwidth}}%
    {\parbox[b]{\labelwidth}%     term  > labelwidth
      {\vspace{4pt}\makebox[0pt][l]{\textrm{#1}}\\\mbox{}}}%
      {\textrm{#1}}%     
  \hfill}

\newenvironment{abbreviationlist}
  {\begin{list}{}{\let\makelabel\Descriptionlabel
     \setlength\listparindent{12pt}%
    \setlength\labelwidth{2.0cm}%
    \setlength\itemsep{\parskip}%
   \setlength\parsep{\parskip}% 
    \setlength\partopsep{0.0cm}%
    \setlength\leftmargin{\labelwidth+\labelsep}}}%
      {\end{list}}

%List of original articles
\newcommand{\loaname}{List of original publications}
\newenvironment{loa}
  {\chapter*{\loaname}%
  \addcontentsline{toc}{chapter}{\loaname}}


%Frontmatter
\renewcommand{\frontmatter}{%

%List of tables
\ifthenelse{\boolean{tablelist}}{%
  \addcontentsline{toc}{chapter}{\listtablename}%
  \listoftables%
  \cleardoublepage}
{\relax}

%List of figures
\ifthenelse{\boolean{figurelist}}{%
  \addcontentsline{toc}{chapter}{\listfigurename}%
  \listoffigures%
  \cleardoublepage}
{\relax}

%Table of contents
\cleardoublepage
\addcontentsline{toc}{chapter}{\contentsname}%
\tableofcontents%
\cleardoublepage

}


%Mainmatter
\renewcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
}

%Backmatter
\renewcommand\backmatter{%
\ifx \@oa \@empty
  \relax
\else
  \cleardoublepage
\fi}


%Original articles
\newcommand{\oaname}{Original publications}%
\newenvironment{oa}
  {\settocdepth{chapter}%
  \addcontentsline{toc}{chapter}{\oaname}%
  \chapter*{\oaname}}

%Appendix
\newcommand{\appendixtocname}{Appendices}%
\renewenvironment{appendix}{
  \addcontentsline{toc}{chapter}{\appendixtocname}%
  \settocdepth{none}%
  \setcounter{chapter}{0}%
  \titleformat{\chapter}[block]{\Large\bfseries\sffamily}{\appendixname \hspace{0.1cm} \thechapter}{0.1cm}{\filright}{}%
  \titlespacing{\chapter}{0cm}{0cm}{10pt}[0cm]}


