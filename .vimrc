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
set expandtab
set tabstop=2
set shiftwidth=2

"" Highlighting
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

highlight MaximumDocString ctermbg=lightred guibg=lightred
call matchadd('MaximumDocString', '\%73v')

"" Pep-8 Standards
" https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces
" https://www.python.org/dev/peps/pep-0008/#maximum-line-length
autocmd FileType python setlocal timeoutlen=1000 ttimeoutlen=0 shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"" Puppet
autocmd FileType pp set filetype=puppet

"" javascript
autocmd FileType javascript setlocal colorcolumn=100 timeoutlen=1000 ttimeoutlen=0 shiftwidth=2 tabstop=2 softtabstop=2 smartindent

"" html and web standards...
autocmd FileType html,json,yaml,markdown setlocal timeoutlen=1000 ttimeoutlen=0 shiftwidth=2 tabstop=2 softtabstop=2

" Mistakes are made
map q: :q
:command Q q
:command W w

" Especially good while getting used to the Kinesis Advantage
map c <Nop> " What is this key even for?
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
        echom "<( ^ _ ^ )> Spell it however you'd like!"
        set nospell
    else
        echom "<( o . o )> Spell it right!"
        set spell spelllang=en_us
    endif
endfunction
noremap <leader>s :call ToggleSpelling()<cr>

" Pasting function because pasting in macOS is hard
function! TogglePaste()
    if &paste
        echom "<( o . o )> Stop Pasting!"
        set nopaste
    else
        echom "<( ^ _ ^ )> Paste Away!"
        set paste
    endif
endfunction
noremap <leader>c :call TogglePaste()<cr>

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
let wiki_1.syntax = 'markdown'
let g:vimwiki_list = [{"syntax": "markdown", "path": "/Users/mburling/vimwiki", "path_html": "/Users/mburling/vimwiki_html", "ext": ".md", "css_file": "/Users/mburling/vimwiki_html/style.css", "custom_wiki2html": "/Users/mburling/scripts/vimwiki.sh"}]
" enable pasting in macOS sometimes...

" crontab manipulation -- is this specific to macOS Sierra?
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Uncomment if you need to have macOS Sierra share the clipboard with vim...
" set clipboard=unnamed

" Hack to get vim-airline to work out right away
set laststatus=2

" Experimental Changes...
set invcursorcolumn
