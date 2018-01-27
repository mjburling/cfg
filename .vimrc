" A collection of configurations for vim largely borrowed from:
" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" https://github.com/greg0ire/more-instantly-better-vim

" Ensure runtimepath is good...
set rtp+=~/.vim/bundle

" pathogen requirements
set nocompatible
execute pathogen#infect()
" some plugins we might want to consider...
" https://github.com/scrooloose/nerdtree.git
" https://github.com/vim-airline/vim-airline.git
" https://github.com/tpope/vim-commentary.git
" https://github.com/christoomey/vim-tmux-navigator

" filetype handling
filetype off
filetype plugin indent on

""" UI Improvements
"" Colors
" Colors can be a real mess. The following is not well understood by the
" author. What I know is that this overrides some defaults and allows
" solarized to look like, well, solarized, regardless of $SHELL.
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" solarized colorscheme
colorscheme solarized " https://github.com/altercation/vim-colors-solarized
syntax enable

let mapleader = "\<Space>"
set nu
set ruler " only necessary when vim-airline is not installed/configured
set whichwrap+=<,>,h,l
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
set encoding=utf-8
set backspace=2

" On the fence about the these 'controversial' features...
set lazyredraw " so far, haven't noticed any problems with this
set ttyfast
set magic " so far, really like magic...

""" UX Basics
"" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"" Highlighting
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

highlight MaximumDocString ctermbg=lightred guibg=lightred
call matchadd('MaximumDocString', '\%73v')

noremap <leader>h :noh <cr>


"" Pep-8 Standards
" https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces
" https://www.python.org/dev/peps/pep-0008/#maximum-line-length
autocmd FileType python setlocal timeoutlen=1000 ttimeoutlen=0 expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"" Puppet
autocmd FileType pp set filetype=puppet

"" javascript
autocmd FileType javascript setlocal colorcolumn=100 timeoutlen=1000 ttimeoutlen=0 shiftwidth=2 tabstop=2 softtabstop=2 smartindent

"" html and web standards...
autocmd FileType html,json,yaml,markdown setlocal timeoutlen=1000 ttimeoutlen=0 shiftwidth=2 tabstop=2 softtabstop=2

autocmd FileType vimwiki,*.html.md setlocal timeoutlen=1000 ttimeoutlen=0 shiftwidth=2 tabstop=2 softtabstop=2 cmdheight=2 commentstring=<!--%s-->

" Mistakes are made
map q: :q
:command Q q
:command W w
:command E e

" Especially good while getting used to the Kinesis Advantage
map c <Nop>
map C <Nop>

" Later remapped to Capslock in macOS Sierra, so whatever.
inoremap <F1> <Esc>
map <F1> <Esc>

" Better selecting
nmap <Leader><Leader> V " quick line-wise selection with leader leader.
noremap % v% " allows selection of everything between brackets, etc.

" Jump to the end of pasted content
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" From a talk by Damian Conway
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction
nnoremap <silent> n n:call HLNext(0.15)<cr>
nnoremap <silent> N N:call HLNext(0.15)<cr>

" Spelling. Y'know, for documentation and stuff.
function! ToggleSpelling()
    if &spell
        set nospell
        echom "<( ^ _ ^ )> Spell it however you'd like!"
    else
        set spell spelllang=en_us
        echom "<( o . o )> Spell it right!"
    endif
endfunction
noremap <leader>s :call ToggleSpelling()<cr>

" Pasting function because pasting in macOS is hard
function! TogglePaste()
    if &paste
        set nopaste
        echom "<( o . o )> Stop Pasting!"
    else
        set paste
        echom "<( ^ _ ^ )> Paste Away!"
        exec 'sleep 500m'
        startinsert
    endif
endfunction
noremap <leader>p :call TogglePaste()<cr>

set clipboard=unnamed
" Use with iTerm2 and macOS Sierra clipboard (pasteboard) integration
function! ToggleClipboard()
  if(&clipboard == "unnamed")
    echom "clipboard="
    set clipboard=
  else
    echom "clipboard=unnamed"
    set clipboard=unnamed
  endif
endfunction
noremap <leader>c :call ToggleClipboard()<cr>

function! ToggleNumber()
  if(&relativenumber == 1)
    set relativenumber!
    set number
  else
    set number!
    set relativenumber
  endif
endfunc
nnoremap <leader>n :call ToggleNumber()<cr>

" vimwiki configuration: no effect when vimwiki is not present
let wiki_1 = {}
let wiki_1.path = '~/vimwiki'
let wiki_1.path_html = '~/vimwiki_html'
let wiki_1.index = "index.html"
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_1.css_file = '~/vimwiki_html/style.css'
let wiki_1.custom_wiki2html = '~/scripts/vimwiki.sh'
let wiki_1.auto_export = 1
let wiki_1.nested_syntaxes = {'python': 'python', 'bash': 'bash'}
let g:vimwiki_list = [wiki_1]

" Some jsx nonsense
let g:jsx_ext_required = 0


" crontab manipulation -- is this specific to macOS Sierra?
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Hack to get vim-airline to work out right away
set laststatus=2

" Experimental Changes...
set invcursorcolumn
set invcursorline

" Timestamps
nnoremap <F5> "=strftime("%a %d %b %Y")<CR>P
inoremap <F5> <C-R>=strftime("%a %d %b %Y")<CR>
