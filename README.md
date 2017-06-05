# vim-monokai

Refined monokai color scheme for `vim`. It's derived from the work put into:

* [sickill/vim-monokai](https://github.com/sickill/vim-monokai).
* [crusoexia/vim-monokai](https://github.com/crusoexia/vim-monokai).

I noticed that there were several places where the highlighting wasn't entirely faithful to that of Sublime, which is my second choice for editing in my day-to-day. The purpose of this project is to provide an experience that matches Sublime as closely as possible.

Note that, in my case, I use several plugins to enhance my own highlighting and ctags experience. Where possible, the dependent plugins have been noted for languages whose highlighting would otherwise be impossible to make equivalent to Sublime. Conflicts with other plugins that I've used have been noted. You will NOT get full fidelity with Sublime's highlighting if you use these conflicting plugins with this color scheme enabled.

## Installation

* [vim-plug](https://github.com/junegunn/vim-plug)

```viml
    Plug 'ErichDonGubler/vim-sublime-monokai'
```

### Manual installation

Download the [colors/monokai.vim](https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/monokai.vim) file, move it into your `~/.vim/syntax/` folder.

## Usage

Copy the following commands to your `~/.vimrc`:

```viml
syntax on
colorscheme monokai
set t_Co=256  " vim-sublime-monokai now only support 256 colours in terminal.
```

## Configuration

### Italics

By default italicized text is enabled in GUI (gVim), but in terminal it's not. If you are using a font that support italics in terminal, paste the following command in `.vimrc`:

```viml
let g:monokai_term_italic = 1
```

## Language-specific configuration

In order to provide an experience with parity to Sublime, this color scheme integrates with the highlighting groups that several language-specific plugins specify. You will need to install these plugins in order to have Sublime-like highlighting.

### Javascript

1. [vim-javascript](https://github.com/pangloss/vim-javascript) for the core language
2. [vim-javascript-lib](https://github.com/crusoexia/vim-javascript-lib), for popular Javascript libraries, like [underscore](http://underscorejs.org/) and [Backbone](http://backbonejs.org/).

#### Conflicts with Javascript

* [cSyntaxAfter](https://github.com/vim-scripts/cSyntaxAfter) plugin conflicts on many operator groups.

## Screenshots

![javascript](screenshots/javascript.png)

![html](screenshots/html.png)

