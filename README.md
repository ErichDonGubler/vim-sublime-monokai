# Sublime Monokai for Vim

`vim-sublime-monokai` is a refined Monokai color scheme for `vim` tries to look
like Sublime's default color scheme. It's derived from the work put into:

* [sickill/vim-monokai](https://github.com/sickill/vim-monokai)
* [crusoexia/vim-monokai](https://github.com/crusoexia/vim-monokai)

I noticed that there were several places where the highlighting wasn't entirely
faithful to that of Sublime, which is my second choice for editing in my
day-to-day. The purpose of this project is to provide an experience that
matches Sublime as closely as possible.

Note that, in my case, I use several plugins to enhance my own highlighting and
`ctags` experience. Where possible, the dependent plugins have been noted for
languages whose highlighting would otherwise be impossible to make equivalent
to Sublime. Conflicts with other plugins that I've used have been noted. You
will NOT get full fidelity with Sublime's highlighting if you use conflicting
plugins with this color scheme enabled.

## Installation

Use your favorite plugin manager! Alternatively, download the
[`colors/sublimemonokai.vim`](https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim)
file and move it into your `colors` folder.

## Usage

After installing this plugin via your favorite plugin manager, add the
following to your `vimrc`:

```viml
syntax on
colorscheme sublimemonokai
```

## Terminal support

`vim-sublime-monokai` only support 256 colours in terminal. If you are using a
terminal which support truecolor like **iterm2**, enable the GUI color by
adding the following to your `vimrc`:

```viml
set termguicolors
```

Otherwise, use below setting to activate the 256 color in terminal

```viml
set t_Co=256
```

## Configuration

### Italics

By default italicized text is enabled in GUI (gVim), but in terminal it's not.
If you are using a font that support italics in terminal, add the following
to your `.vimrc`:

```viml
let g:sublimemonokai_term_italic = 1
```

## Language-specific configuration

In order to provide an experience with parity to Sublime, this color scheme
integrates with the highlighting groups that several language-specific plugins
specify. You will need to install these plugins in order to have Sublime-like
highlighting.

### Javascript

1. [`vim-javascript`](https://github.com/pangloss/vim-javascript) for the core
    language
2. [`vim-javascript-lib`](https://github.com/crusoexia/vim-javascript-lib), for
    popular Javascript libraries, like [underscore](http://underscorejs.org/)
    and [Backbone](http://backbonejs.org/).

#### Conflicts with Javascript

* [`cSyntaxAfter`](https://github.com/vim-scripts/cSyntaxAfter) conflicts on
    many operator groups.

## Screenshots

![Javascript](screenshots/javascript.png)

![HTML](screenshots/html.png)
