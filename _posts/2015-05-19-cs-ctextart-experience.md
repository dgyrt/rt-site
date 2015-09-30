---
layout: page
title: "Using ctexart"
category: cs
date: 2015-05-19 12:00:00
---

I'm using \\(\LaTeX\\) for a quite long time. And for the most of time, I used it to typeset English materials. And since it gives me a way of writing non-ASCII characters using pure ASCII characters, I really enjoy it.

Recently I'm starting to use `ctexart` in order to typeset Chinese texts. And I found that there are many configurations I needed to tune in order to get the right effects (which one isn't?). Well, actually it's not a fair opinion to say to `ctexart`. It has simplified the entire workflow already. At least, I can use all the standard packages without a single problem.

You can find a complete documentation from [here](http://www.ctex.org/PackageCTeX/files.xml?action=download&file=ctex.pdf).

### Select The Right Compiler

In principle, on major Linux distributions and Windows, you can use most of compiling sequence to work with `ctexart`. However, the way of OSX handling fonts is a nightmare. This particular situation made me to use `XeLaTeX` instead. Honestly, I don't have any hard feeling of using `XeLaTeX`, I'm just feeling more comfortable when I use `LaTeX` or `PDFLaTeX` as my default compiling sequence.

### Configure Fonts on OSX

~~~ latex
\setCJKmainfont[BoldFont=STHeiti, ItalicFont=STKaiti]{STSong}
\setCJKsansfont[BoldFont=STHeiti]{STXihei}
\setCJKmonofont{STFangsong}
~~~

### Define a Custom Framed Box

~~~ latex
\newcounter{faqbox}[section]
\renewcommand{\thefaqbox}{\thechapter.\arabic{faqbox}}
\usepackage[framemethod=TikZ]{mdframed}
\newenvironment{faqbox}[1][]{
    \refstepcounter{faqbox}
    \begin{mdframed}[
        frametitle={FAQ \thefaqbox\ #1},
        skipabove=\baselineskip plus 2pt minus 1pt,
        skipbelow=\baselineskip plus 2pt minus 1pt,
        linewidth=0.5pt,
        frametitlerule=true,
        frametitlebackgroundcolor=gray!30
    ]
}{
    \end{mdframed}
}
~~~

### Custom Chapter Display Style

You can use `titlesec` to redefine the specific style of your chapter's style.

~~~ latex
\titleformat
{\chapter} % command
[display] % shape
{\bfseries\Large} % format
{第 \ {\Huge\thechapter} 章} % label
{0.5ex} % sep
{
    \rule{\textwidth}{1pt}
    \vspace{1ex}
    %\centering
} % before-code
[
%\vspace{-0.5ex}%
%\rule{\textwidth}{0.3pt}
] % after-code
~~~
