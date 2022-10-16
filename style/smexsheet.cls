%% ############################################################################
%%
%% Sebastian's style files for
%%    exercise sheets
%% based on
%%    scrartcl
%%
%% ############################################################################
%%
%% Usage:
%%
%%     \documentclass[folder=FOLDERNAME,lang=LANGUAGE,font=FONTNAME,(nofont), ... }{FOLDERNAME/smexam}
%%
%% where
%%
%%     FOLDERNAME (default: style)
%%         folder in which this .cls file is placed, relative to the .tex file that is compiled
%%
%%     LANGUAGE (default: en)
%%         shorthand for the language that should be used
%%         available languages: see subfolder "locale"
%%
%%     FONTNAME (default: myriad)
%%         font that should be used
%%         available fonts: see subfolder "fonts"
%%         to not use any custom font: none
%%
%%     nofont
%%         equivalent to "font=none"
%%
%%     ...
%%         all other options are passed to the base class
%%
%% ############################################################################


%
% silence
%

\RequirePackage{silence}
\WarningFilter{latex}{You have requested package}
\WarningFilter{latex}{You have requested document class}
\WarningFilter{latexfont}{Font shape}
\WarningFilter{latexfont}{Some font shapes}


%
% header
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{smexsheet}[2020-08-09]


%
% class options
%

\RequirePackage{kvoptions}

\SetupKeyvalOptions{family=style, prefix=style@}

\DeclareStringOption[style]{folder} % \style@folder is the provided foldername
\DeclareStringOption[myriad]{font}  % \style@font is the provided fontname
\DeclareStringOption[en]{lang}      % \style@lang is the provided language shorthand
\DeclareBoolOption{nofont}          % use \ifstyle@nofont to check whether it is set

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrartcl}}

\ProcessKeyvalOptions*

\LoadClass{scrartcl}


%
% option-dependent macros for loading from relative paths
%

\RequirePackage{xparse}

% use .sty file from FOLDERNAME with the specified name
\NewDocumentCommand{\useRelPackage}{o m}%
{%
    \IfValueTF{#1}
    {%
        \RequirePackage[#1]{\style@folder/#2}
    }%
    {%
        \RequirePackage{\style@folder/#2}
    }%
}%

% use .sty file from FOLDERNAME/locale/LANGUAGE with the specified name
\newcommand{\useRelLocale}[1]{\RequirePackage{\style@folder/locale/\style@lang/#1}}

% use .sty file FOLDERNAME/fonts/FONT
\newcommand{\useRelFont}{\RequirePackage{\style@folder/fonts/\style@font}}

% do not include any font if "font=none" or "nofont" or nofont=true"
\def\nofonttext{none}%
\ifx\style@font\nofonttext%
    \renewcommand{\useRelFont}{}%
\fi%
\ifstyle@nofont%
    \renewcommand{\useRelFont}{}%
\fi%


%
% relative includes
%

% font
\useRelFont%

% typesetting rules
\useRelPackage{smtypesetting}

% 1st, nth and so on
\useRelPackage{smnth}

% problem boxes
\useRelPackage{smproblemboxes}

% algorithms
\useRelPackage{smalgo}

% language-specific stuff
\useRelLocale{lang}

% language-specific abbreviations
\useRelLocale{abbrev}

% formatting commands
\useRelPackage{smtext}

% math definitions
\useRelPackage{smmath}

% custom symbols
\useRelPackage{smsymbols}

% math operators
\useRelPackage{smoperators}

% tikz stuff
\useRelPackage{smtikz}

% der geile Pfeil
\useRelPackage{smgeilerpfeil}

% colors
\useRelPackage{smcolors}

% make leq slanted
\useRelPackage{smslantedleq}

% % stuff for bibliography
% \useRelPackage{smbibliography}

% % table of contents
% \useRelPackage{smtoc}

% emph and aemph
\useRelPackage[bold]{smemph}

% paragraphs
\useRelPackage{smparagraphs}

% footnotes
\useRelPackage{smfootnotes}

% figures, subfigures
\useRelPackage{smfigures}



% theorem environment
% \useRelPackage{smtheorems}

\RequirePackage{amsthm}

% Theoremstyle
\newtheoremstyle{withnumber}%   % name
    {0.4cm}%                    % Space above
    {0.6cm}%                    % Space below
    {\normalfont}%              % Body font
    {}%                         % Indent amount
    {\bfseries}%                % Theorem head font
    {\newline}%                 % Punctuation after theorem head
    {0.2cm}%                    % Space after theorem head
    {#1 #2\thmnote{: \ #3}}%    % Theorem head spec (can be left empty, meaning ‘normal’)

\newtheoremstyle{nonumber}%  % name
    {0.4cm}%                 % Space above
    {0.6cm}%                 % Space below
    {\normalfont}%           % Body font
    {}%                      % Indent amount
    {\bfseries}%             % Theorem head font
    {\newline}%              % Punctuation after theorem head
    {0.2cm}%                 % Space after theorem head
    {#1\thmnote{: \ #3}}%    % Theorem head spec (can be left empty, meaning ‘normal’)

% theorems are numbered within the section
\providecommand{\TheoremLocaleName}{Theorem}
\newtheorem{theorem}{\TheoremLocaleName}

%
% Hackfix for itemize / enumerate at the beginning of a theorem
%
\newcommand{\skipfix}{\leavevmode\vspace{-2.2em}}

% itemize/enumerate at the beginning of a thm
\newenvironment{thmenumerate}%
{%
    \skipfix%
    \begin{enumerate}%
}%
{%
    \end{enumerate}%
}%

\newenvironment{thmitemize}%
{%
    \skipfix%
    \begin{itemize}%
}%
{%
    \end{itemize}%
}%

\theoremstyle{withnumber}


% % proof and shortproof
% \useRelPackage{smproofs}

% language-specific theorem names
\useRelLocale{theorems}


%
% other includes
%

% spacing between lines of text
\RequirePackage{setspace}

% enumerate etc
\RequirePackage{paralist}

% include graphics
\RequirePackage{graphicx}

% tables (over several pages)
\RequirePackage{tabularx}

% boxes in the text
\RequirePackage{fancybox}

% math symbols
% \usepackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{stmaryrd}
\RequirePackage{amsthm}
\RequirePackage{wasysym}
\RequirePackage{marvosym}

% bm for bold math
\RequirePackage{bm}

% for colored cells in tables
\RequirePackage{colortbl}

% symbol scaling in math mode
\RequirePackage{scalerel}

% for symbol stacking
\RequirePackage{stackengine}

% parse optional arguments
\RequirePackage{xparse}

% fix some spacing issues
\RequirePackage{microtype}

% custom environments
\RequirePackage{environ}

\RequirePackage{ulem}
% set emph back to normal (instead of underlined)
\normalem%


%
% other stuff
%

% % Enforce enddot for parts
% % (even with noeenddot class option)

% \renewcommand*{\partformat}{\partname~\thepart .}

%
% Page layout
%

\RequirePackage{geometry}

\geometry{%
    paper=a4paper,
    left=2.2cm,
    right=2.2cm,
    top=2cm,
    bottom=2cm,
    foot=1cm,
    ignoreheadfoot,
    bindingoffset=0mm,
%    showframe
}%

\RequirePackage[headsepline]{scrlayer-scrpage}
\clearpairofpagestyles%
\automark[section]{section} % [right] left
\chead{\normalfont\headmark}
% \cfoot*{\fontsize{16pt}{16pt} \pagemark}
\cfoot*{\pagemark}

% space between lines
\onehalfspacing%

\newtoks\lecturer%
\newtoks\organizer%
\newtoks\institution%
\newtoks\term%
\newtoks\releasedate%
\newtoks\duedate%

\def\@maketitle{%
    %\newgeometry{top=1cm}%
    \vspace*{-3\baselineskip}%
    %\null
    %\thispagestyle{empty}
    %\begin{center}
    \framebox[\textwidth]{%
        \parbox{\textwidth}%
        {%
            \vspace*{-0.2cm}%
            \begin{center}%
                \textrm{\textbf{\large\@title}}\\%
                \textrm{\textbf{\large\@subtitle}}%
            \end{center}%
            \vspace*{-0.9cm}%
            \begin{tabularx}{\textwidth}{l X r}%
                \small\the\lecturer%
                &%
                &\small\the\institution%
                \\%
                \small\the\organizer%
                &%
                &\small\the\term%
                \\%
            \end{tabularx}%
        }%
    }%
    \newline
    %\end{center}
    %\null
    \begin{tabularx}{\textwidth}{@{} l X r @{}}%
        \the\releasedate%
        &%
        &\the\duedate%
        \\%
    \end{tabularx}%
    %    \vspace*{0.2cm}
    %    \restoregeometry
}%


\endinput
