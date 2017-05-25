# vim-monokai

Refined monokai color scheme for vim. It's derived from the work put into:

* [sickill/vim-monokai](https://github.com/sickill/vim-monokai).
* [crusoexia/vim-monokai](https://github.com/crusoexia/vim-monokai).

I noticed that there were several places where the highlighting wasn't entirely faithful to that of Sublime, which is my second choice for editing in my day-to-day. The purpose of this project is to provide an experience that matches Sublime as closely as possible.

Note that, in my case, I use several plugins to enhance my own highlighting and ctags experience. Where possible, the dependent plugins have been noted for languages whose highlighting would otherwise be impossible to make equivalent to Sublime.

## Installation

* [vim-plug](https://github.com/junegunn/vim-plug)

    Plug 'ErichDonGubler/vim-sublime-monokai'

### Manual installation

Download the [colors/monokai.vim](https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/monokai.vim) file, move it into your `~/.vim/syntax/` folder.

## Usage

Copy below command to your `~/.vimrc`:

```viml
syntax on
colorscheme monokai
set t_Co=256  " vim-sublime-monokai now only support 256 colours in terminal.
```

## Configuration

### Italic

By default the GUI enables italic, but terminal does not. If you are using a font support italic, paste the following command in `.vimrc` to turn italics in terminal:

```viml
    let g:monokai_term_italic = 1
    let g:monokai_gui_italic = 1
```

## Language-specific configuration

In order to provide an experience with parity to Sublime, this color scheme integrates with the highlighting groups that several language-specific plugins specify. You will need to install these plugins in order to have Sublime-like highlighting.

### Javascript

1. [vim-javascript](https://github.com/pangloss/vim-javascript), which provide features such as param syntax highlight,
function assignment identifier highlight ( just as the screenshots ).

2. [vim-javascript-lib](https://github.com/crusoexia/vim-javascript-lib), which is the companion of _vim-javascript_,
provide the popular javascript libraries key word highlight, such as [underscore](http://underscorejs.org/) and
[Backbone](http://backbonejs.org/).

## Screenshots

![javascript](screenshots/javascript.png)

![html](screenshots/html.png)

