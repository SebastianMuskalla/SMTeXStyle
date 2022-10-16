%% ############################################################################
%%
%% Sebastian's style files for
%%    posters
%% based on
%%    tikzposter
%%
%% ############################################################################
%%
%% Usage:
%%
%%     \documentclass[folder=FOLDERNAME,lang=LANGUAGE,font=FONTNAME,(nofont), ... }{FOLDERNAME/smposter}
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
\ProvidesClass{smposter}[2020-08-09]


%
% class options
%

\RequirePackage{kvoptions}

\SetupKeyvalOptions{family=style, prefix=style@}

\DeclareStringOption[style]{folder} % \style@folder is the provided foldername
\DeclareStringOption[myriad]{font}  % \style@font is the provided fontname
\DeclareStringOption[en]{lang}      % \style@lang is the provided language shorthand
\DeclareBoolOption{nofont}          % use \ifstyle@nofont to check whether it is set

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{tikzposter}}

\ProcessKeyvalOptions*

\LoadClass{tikzposter}


%
% option-dependent macros for loading from relative paths
%

\RequirePackage{xparse}

% use .sty file from FOLDERNAME with the specified name
\NewDocumentCommand{\useRelPackage}{o m}
{%
    \IfValueTF{#1}%
    {%
        \RequirePackage[#1]{\style@folder/#2}%
    }%
    {%
        \RequirePackage{\style@folder/#2}%
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

% % tikz stuff
% \useRelPackage{smtikz}

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


% space between lines
\onehalfspacing%


\endinput
