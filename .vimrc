
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1 "
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype on
filetype plugin on
filetype plugin indent on

" Enable syntax highlighting
syntax on

"Backup and swap file settings
set nobackup
set noswapfile

"Colorscheme setting
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

"Window size settings
"set nofu
"set lines=50 columns=125

"Font size settings
set guifont=Ubuntu\ Mono\ 13
"Key mappings
"map <S-h> <C-w>h
"map <S-j> <C-w>j
"map <S-k> <C-w>k
"map <S-l> <C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-l> :tabnext<CR>
nnoremap <S-k> :bprevious<CR>
nnoremap <S-j> :bnext<CR>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-c> :tabclose<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>0 <C-w>o
nnoremap <leader>1 :sp<CR>
nnoremap <leader>2 :vs<CR>


"nnoremap <C-i> :TlistToggle<CR>

set nohlsearch

"clang-complete settings
let g:clang_library_path='/usr/lib'
let g:clang_complete_auto=1


"VimLite settings
"let g:VLWorkspaceEnableCscope = 1
"let g:VLWorkspaceParseFileAfterSave = 1


set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My bundles here:
"
" Git repos on your local machine (i.e. when working on your own plugin)
Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell.vim'
Plugin 'megaannum/self'
Plugin 'megaannum/forms'
Plugin 'megaannum/vimside'
Plugin 'Shougo/unite.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'msanders/snipmate.vim'
Plugin 'tommorris/scala-vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'lsdr/monokai'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'scrooloose/nerdtree'

Plugin 'laurilehmijoki/haskellmode-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'dag/vim2hs'

Plugin 'indenthtml.vim'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on
"autocmd FileType php set omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = '<C-x><C-i>'
let g:phpcomplete_index_composer_command="composer.phar"


let g:haddock_browser = '/usr/bin/google-chrome'

let g:ghc = '/usr/bin/ghc'
let g:haskell_conceal = 0
let g:haskell_multiline_strings = 1

" disable all conceals, including the simple ones like
" lambda and composition
"let g:haskell_conceal = 0

" disable concealing of "enumerations": commatized lists like
" deriving clauses and LANGUAGE pragmas,
" otherwise collapsed into a single ellipsis
"let g:haskell_conceal_enumerations = 0


"Configurations for ghcmod
let g:ghcmod_ghc_options = ['-idir1', '-idir2']
autocmd BufRead,BufNewFile ~/.xmonad/* call s:add_xmonad_path()
function! s:add_xmonad_path()
  if !exists('b:ghcmod_ghc_options')
    let b:ghcmod_ghc_options = []
  endif
  call add(b:ghcmod_ghc_options, '-i' . expand('~/.xmonad/lib'))
endfunction
hi ghcmodType ctermbg=yellow
let g:ghcmod_type_highlight = 'ghcmodType'

let $PATH = $PATH . ':' . expand("~/.cabal/bin")

" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent

let g:snippets_dir = '/home/steven/.vim/bundle/snipmate.vim/snippets'
let g:html_indent_inctags = "html,body,head,tbody"
" set t_Co=256
set cursorline cursorcolumn
colorscheme Tomorrow-Night

fu! SetFtXml()
  setlocal filetype=xml
endfu

augroup filetype_html
  autocmd!
  au BufNewFile,BufRead *.html,*.xhtml,*.xml call SetFtXml()
augroup END

highlight Pmenu ctermfg=1 ctermbg=none guibg=grey30
