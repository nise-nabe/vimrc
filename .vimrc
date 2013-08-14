set nocompatible
filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'sudo.vim'
NeoBundle 'Align'
NeoBundleLazy 'Source-Explorer-srcexpl.vim'
NeoBundleLazy 'trinity.vim'
NeoBundleLazy 'taglist.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'DirDiff.vim'

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
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'gregsexton/gitv'
NeoBundle 'groenewege/vim-less'
NeoBundle 'mileszs/ack.vim'
NeoBundleLazy 'skammer/vim-css-color'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'yuratomo/gmail.vim'
NeoBundleLazy 'lambdalisue/vim-python-virtualenv'
NeoBundle "osyo-manga/shabadou.vim"
NeoBundleLazy "osyo-manga/vim-watchdogs"
NeoBundle "jceb/vim-hier"
NeoBundle 'rhysd/accelerated-jk'
NeoBundleLazy 'honza/vim-snippets'
NeoBundleLazy 'koron/minimap-vim'
NeoBundle 'hsitz/VimOrganizer'
NeoBundle 'teramako/instant-markdown-vim'
NeoBundle 'HybridText'
NeoBundle 'tyru/simpletap.vim' " TAP for vim script
NeoBundle 't9md/vim-unite-ack'
NeoBundle 'rkitover/vimpager'
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'nsf/gocode'
NeoBundle 'adaszko/chbuf.vim'

NeoBundle 'nise-nabe/unite-openpne'
NeoBundleLazy 'pasela/unite-fuel'
NeoBundleLazy 'nobeans/unite-grails'
NeoBundleLazy 'kmnk/vim-unite-giti'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-tag'

NeoBundleLazy 'vim-jp/vimdoc-ja'


if $GOROOT != ''
	set rtp+=$GOROOT/misc/vim
endif

if (isdirectory(expand('$GOROOT')))
  NeoBundle 'go', {'type': 'nosync'}
endif

syntax on
filetype plugin indent on

set scrolloff=5
set laststatus=2
set textwidth=0
set clipboard=unnamed
set list
set listchars=tab:>_
set hlsearch
set number
set cursorline
set helplang=ja,en
set splitbelow

set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P\ %{fugitive#statusline()}

set encoding=utf8
set fileencodings=utf8,iso-2022-jp,sjis,euc-jp

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

let mapleader = "\<Nul>"

"autocmd FileType jsp,asp,php,xml,perl syntax sync minlines=500 maxlines=10000

nnoremap <silent> t :<C-u>tabnew<CR>:tabmove<CR>
" nnoremap <silent> X :XPathSearchPrompt<CR>

" タグジャンプ時に別タブで開く
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

map <silent>m :split<CR>g,j

inoremap jj <Esc>
inoremap kk <Esc>

" not use arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

noremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd BufNewFile,BufRead *.go setlocal filetype=go

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
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.go = '\h\w%*.'

"plugin syntastic
"let g:syntastic_check_on_open = 1

" plugin quickrun
let g:quickrun_config = {}
let g:quickrun_config['*'] = {
      \ 'runner' : 'vimproc'
      \ }
let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'buffer'
      \ }

" pluign watchdogs.vim
let g:watchdogs_check_BufWritePost_enables = {
      \   "go" : 0,
      \   "php": 1
      \}
let g:watchdogs_check_CursorHold_enables = {
     \}


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
"  echomsg 'Please execute \":NeoBundleInstall\" command.'
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

" RingYank.vim
let g:yankring_history_dir = '~/.config/vim'

" gmail.vim
let g:gmail_user_name = 'nise.nabe@gmail.com'

" HybridText
"autocmd BufEnter * if &filetype == "" | setlocal ft=hybrid | endif

" gitv
autocmd FileType git :setlocal foldlevel=99

" vim-unite-ack
let g:unite_source_ack_command = 'ack --nocolor --nogroup'
