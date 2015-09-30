---
layout: page
title: "Set up Emacs"
category: cs
date: 2015-04-22 12:00:00
---

Here is my setting of using Emacs as my major editor across OS X and Linux platform. You can refer my configuration from [here](https://github.com/duguyue100/.emacs.d).

It's a fun experience that plays with Emacs, knowing all the shortcuts and packages. And we must also face the truth: it's powerful, but it's an editor. I rarely use Emacs to develop my entire project. There are better solution given by IDEs (especially for OS X, iOS applications).

#### Setup MELPA

[MELPA](http://melpa.org/) (Milkypostman's Emacs Lisp Package Archive) is an archive of Emacs packages. It's stable and easy to use. You can setup MELPA as:

~~~ lisp
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
~~~

#### Setup for Shell Support (OS X only)

Emacs does not adapt `.profile` automatically, then when you wish to call your shell an run some commands, there may some issues (I'm using Anaconda for my Python support, and I noticed this when I tried and failed to plot somethings). You can use `exec-path-from-shell` to resolve this problem, the code is [here](https://github.com/purcell/exec-path-from-shell). The package is also available in MELPA.

~~~ lisp
; add to list if you install manually
(add-to-list 'load-path "~/.emacs.d/site-lisp/exec-path-from-shell")

; you only enable the mode when it's running on OS X
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
~~~

#### Start Full Screen, Turn Off Scroll Bar and Menu Bar

Scroll bar is a pain for the most of time and menu bar will take many spaces when you are working on a laptop. I prefer to turn off them. Furthermore, the usual way of maximizing Emacs window is not working perfectly with OS X. It always leave a slide of space on the top. So you need another way of settling this:

~~~ lisp
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-resize-pixelwise t)
~~~

#### Simplify Yes-and-No

I would rather use `y-and-n` instead of typing entire `yes` or `no`, would you?

~~~ lisp
(defalias 'yes-or-no-p 'y-or-n-p)
~~~

#### Configure Fonts

There are some difference between Ubuntu's font and OS X's font. I then configure them differently

~~~ lisp
(if (eq system-type 'gnu/linux)
    (add-to-list 'default-frame-alist '(font .  "Courier 10 Pitch-15" ))
)

(if (eq system-type 'darwin)
    (add-to-list 'default-frame-alist '(font .  "Courier-15" ))
)
~~~

#### Setup AUCTeX

#### Setup aspell through MacPorts (OS X only)


