set nocompatible
filetype off

if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'sudo.vim'
NeoBundle 'Align'
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'trinity.vim'
NeoBundle 'taglist.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neosnippet'
NeoBundleLazy 'Shougo/unite-ssh'

NeoBundleLazy 'mattn/zencoding-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/vdbi-vim'
NeoBundle 'mattn/benchvimrc-vim'

NeoBundle 'thinca/vim-quickrun'
NeoBundleLazy 'thinca/vim-showtime'
NeoBundle 'thinca/vim-localrc'
NeoBundleLazy 'thinca/vim-ref'

NeoBundleLazy 'basyura/bitly.vim'
NeoBundleLazy 'basyura/TweetVim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'gregsexton/gitv'
NeoBundleLazy 'groenewege/vim-less'
NeoBundle 'mileszs/ack.vim'
NeoBundleLazy 'skammer/vim-css-color'
NeoBundleLazy 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundleLazy 'tyru/open-browser.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundleLazy 'lambdalisue/vim-python-virtualenv'
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "jceb/vim-hier"
NeoBundle 'rhysd/accelerated-jk'
NeoBundleLazy 'honza/snipmate-snippets'
NeoBundleLazy 'koron/minimap-vim'
NeoBundle 'hsitz/VimOrganizer'

NeoBundleLazy 'nise-nabe/unite-yarm'
NeoBundleLazy 'pasela/unite-fuel'
NeoBundleLazy 'nobeans/unite-grails'
NeoBundleLazy 'kmnk/vim-unite-giti'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'h1mesuke/unite-outline'

NeoBundleLazy 'vim-jp/vimdoc-ja'

syntax on
filetype plugin indent on

set scrolloff=5
set laststatus=2
set textwidth=0
set autoindent shiftwidth=2
set smartindent shiftwidth=2
set expandtab
set clipboard=unnamed
set list
set listchars=tab:>_
set hlsearch
set number
set cursorline
set helplang=ja,en

set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P\ %{fugitive#statusline()}

set encoding=utf8
set fileencodings=utf8,iso-2022-jp,sjis,euc-jp

let mapleader = "\<Nul>"

nnoremap <silent> t :<C-u>tabnew<CR>:tabmove<CR>
" nnoremap <silent> X :XPathSearchPrompt<CR>

map <silent>m g,j

inoremap jj <Esc>
inoremap kk <Esc>

" not use arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

noremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:ref_open = 'vsplit'

set tags+=tags

:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"self setting
"if filereadable(expand('$HOME/.self.vimrc'))
"  source $HOME/.self.vimrc
"endif

" unite.vim
nnoremap <silent> <Leader>b :Unite tab<CR>
nnoremap <silent> f :Unite outline<CR>

" fugitive 
autocmd QuickFixCmdPost *grep* Unite quickfix

" plugin gist.vim
if filereadable(expand('~/.github.vimrc'))
  source ~/.github.vimrc
endif

" plugin vimfiler
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1

" plugin vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" plugin ack.vim
"let g:ackprg="ack -H --nocolor --nogroup --column"

" plugin neocomplcache
let g:neocomplcache_enable_at_startup = 1
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets, ~/.vim/autoload/neosnippet/snippets'

"plugin syntastic
"let g:syntastic_check_on_open = 1

" plugin quickrun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'buffer'
      \ }

" pluign watchdogs.vim
"let g:watchdogs_check_BufWritePost_enable = 1
"let g:watchdogs_check_CursorHold_enable = 1
"call watchdogs#setup(g:quickrun_config)

" plugin calendar.vim
let calendar_action = "QFixHowmCalendarDiary"
let calendar_sign = "QFixHowmCalendarSign"

" plugin qfixhowm
let howm_dir = "~/.howm"
let howm_fileencoding = "utf-8"
let howm_fileformat = "unix"
let QFixHowm_HowmMode = 0
let QFixHowm_Title = '#'
let QFixHowm_UserFileType = 'markdown'
let QFixHowm_UserFileExt = 'mkd'
let howm_filename = '%Y/%m/%T-%m-%d-%H%M%S.mkd'

" eclim
"let g:EclimProjectTreeAutoOpen = 1
"let g:EclimProjectTreeExpandPathOnOpen = 1

" source-exploere

" torinity.vim
"nmap <F8> :TrinityToggleAll<CR>

if has('gui_macvim')
  set guioptions-=T

  set transparency=10
  set background=dark
endif

" neobundle
" Installation check.
"if neobundle#exists_not_installed_bundles()
"  echomsg 'Not installed bundles: ' .
"        \ string(neobundle#get_not_installed_bundle_names())
"  echomsg 'Please execute ":NeoBundleInstall" command.'
"  finish
"endif
let g:neobundle_default_git_protocol='https'

" unite-yarm
"let g:unite_yarm_server_url = 'http://fuga.com'
"let g:unite_yarm_access_key = 'hoge'
"nnoremap <silent> <Leader>y :<C-u>Unite yarm<CR>

" open-browser
"let g:openbrowser_open_commands = ['']
"let g:openbrowser_open_rules = {'': '{browser} {shellescape(uri)}'}

" localrc
"

" vimshell
let g:vimshell_disable_escape_highlight = 1

" accelerated-jk
let g:accelerated_jk_enable_deceleration = 1
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" autocmd FileType yaml nmap ,e :execute '!ruby -ryaml -e "begin;YAML::load(open('."'"."%"."'".","."'"."r"."'".').read);rescue ArgumentError=>e;puts e;end"'<CR>
