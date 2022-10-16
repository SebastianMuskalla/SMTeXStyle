%% ############################################################################
%%
%% Sebastian's style files for
%%    letters
%% based on
%%    scrartcl
%% and
%%    scrletter
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
\ProvidesClass{smletter}[2020-08-09]


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

% % der geile Pfeil
% \useRelPackage{smgeilerpfeil}

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

% % footnotes
% \useRelPackage{smfootnotes}

% % figures, subfigures
% \useRelPackage{smfigures}

% % theorem environment
% \useRelPackage{smtheorems}

% % proof and shortproof
% \useRelPackage{smproofs}

% % language-specific theorem names
% \useRelLocale{theorems}


%
% other includes
%

% spacing between lines of text
\RequirePackage{setspace}

% 130% linespacing as proposed by DIN 5008
\setstretch{1.083}%  default
\ifcase \@ptsize \relax % 10pt
    \setstretch {1.083}%
\or % 11pt
    \setstretch {1.051}%
\or % 12pt
    \setstretch {1.076}%
\fi

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

% use scrletter for letter specific STUFF
% this means that this class can be used in conjunction with scrartcl
\usepackage{scrletter}

% DIN 5008
\LoadLetterOption{DIN}
% \RequirePackage%
% [%
%     a4paper,
%     top=27mm,
%     left=25mm,
%     right=20mm,
%     bottom=30mm,
% ]{geometry}


% do not indent signature
\renewcommand*{\raggedsignature}{\raggedright}

% more space for the signature (between the closing statement and the printed name)
\setplength{sigbeforevskip}{2.5\baselineskip}

\KOMAoptions{%
    % fromalign=right,%          % head aligned to the left
    % fromrule=afteraddress,%    % line under the head
    firsthead=false,           % don't show header on first page (we use the location box instead)
    firstfoot=false, % don't show header on first page (we use the location box instead)
    refline=nodate,
}

% decrease width of address field a bit to avoid overflow into the non-visible area
\setplength{toaddrwidth}{80mm}



% position of location box
% taken from DIN 5008
\setplength{lochpos}{12mm} % if we set this to 10, we only get 8mm
\setplength{locwidth}{75mm}
\setplength{locvpos}{32mm}
\setplength{locheight}{63mm}

\setplength{toaddrhpos}{24mm}
%  210mm DIN A4 width
% - 25mm left margin
% - 25mm right margin (DIN 5008 says 20mm)
% -  1mm correction
% = 159mm textwidth
\setlength{\textwidth}{159mm}

\setlength{\textheight}{247mm}
\setlength{\footheight}{\baselineskip}
\addtolength{\footheight}{4mm}
\setlength{\footskip}{\baselineskip}
\addtolength{\footskip}{8mm}

% do not indent letter body - looks silly for short letters
\setlength{\oddsidemargin}{\useplength{toaddrhpos}}
\addtolength{\oddsidemargin}{-1in} % needed for historic reasons

% \usepackage[]{geometry}

% show "page x / y" in the footer
% we need to call the AtBeginLetter hook because \begin{letter} overwrites pagemark
\AtBeginLetter
{%
    \renewcommand*{\pagemark}%
    {%
        \usekomafont{pagenumber}{\pagename~\thepage~/~\letterlastpage}
    }%
}%

% enable footer on first page by patching the "\opening" command, which normally sets \pagestyle{empty}
\RequirePackage{xpatch}
\xapptocmd{\opening}{\thispagestyle{scrheadings}}{}{}

% additional sender information

% macro to check whether fromurl etc. are empty taken from
% https://tex.stackexchange.com/questions/53068/how-to-check-if-a-macro-value-is-empty-or-will-not-create-text-with-plain-tex-co

\setkomavar{location}{%
    \raggedleft%
    \usekomavar{fromname}%
    \\%
    \usekomavar{fromaddress}%
    \leavevmode%
    \\%
    \Ifkomavarempty{fromurl}{}%
    {%
        \leavevmode%
        \\%
        \Ifkomavarempty*{fromurl}{}{{\footnotesize\usekomavar*{fromurl}}~}%
        \usekomavar{fromurl}%
    }%
    \Ifkomavarempty{fromphone}{}%
    {%
        \leavevmode%
        \\%
        \Ifkomavarempty*{fromphone}{}{{\footnotesize\usekomavar*{fromphone}}~}%
        \usekomavar{fromphone}%
    }%
    \Ifkomavarempty{fromfax}{}%
    {%
        \leavevmode%
        \\%
        \Ifkomavarempty*{fromfax}{}{{\footnotesize\usekomavar*{fromfax}}~}%
        \usekomavar{fromfax}%
    }%
    \Ifkomavarempty{frommobilephone}{}%
    {%
        \leavevmode%
        \\%
        \Ifkomavarempty*{frommobilephone}{}{{\footnotesize\usekomavar*{frommobilephone}}~}%
        \usekomavar{frommobilephone}%
    }%
    \Ifkomavarempty{fromemail}{}%
    {%
        \leavevmode%
        \\%
        \Ifkomavarempty*{fromemail}{}{{\footnotesize\usekomavar*{fromemail}}~}%
        \usekomavar{fromemail}%
    }%
    \leavevmode
    \\[1mm]
    \vspace*{\fill}
    \Ifkomavarempty{place}
    {%
        \usekomavar{date}%
    }%
    {%
        \usekomavar{place}, \usekomavar{date}%
    }%
}%


\endinput
