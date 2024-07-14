"-----------------------------------------------------------------------------------
" vim ops cmdonfig
"-----------------------------------------------------------------------------------
" most ugly bug because of this, delete character not render, ioremap jj failed
set nocompatible

" enable relative line number
set relativenumber
set number

"always enable statusbar
set laststatus=2
set ruler "enbale right-down row and column num

set shiftwidth=4 "set sw=4
set tabstop=4 "set ts=4
set softtabstop=4
set bs=2
set expandtab
set autoindent

set number
set nowrap

syntax on

"colorscheme include cursor column and line hilight
"colorscheme Tomorrow-Night-Eighties
"colorscheme jellybeans
colorscheme molokai
"colorscheme obsidian
"colorscheme solarized
set cursorline
set cursorcolumn

set hls
set nowrapscan
set noignorecase

" Allow backspacing over indent, eol, and the start of an insert
"set backspace=2
"some often behavior when delete,search .... for text edit
set cpoptions=ces$

set showcmd
set showmode

"hide the mouse while typing
set mousehide
"not fold the code by default
set foldlevel=99
set foldmethod=manual

let g:MyWinHeight=20
"-----------------------------------------------------------------------------------
" filetype and after filetype vim-plugin(commentary)
"-----------------------------------------------------------------------------------
filetype plugin indent on

"commentary,based different file type insert right comment
nmap <BS> gcc
vmap <BS> gc

"-----------------------------------------------------------------------------------
"config often key mapping
"-----------------------------------------------------------------------------------
inoremap jj <esc>
noremap <silent> ,ns <ESC>:w<CR>
noremap <silent> ,nd <ESC>:%s/\\s*$//g<CR>
noremap <silent> <F6> :2match Underlined /.\\%81v/<CR>

"-----------------------------------------------------------------------------------
" NerdTree config
"-----------------------------------------------------------------------------------
nmap <silent> ,nf :NERDTreeFind<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>
" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

"-----------------------------------------------------------------------------------
" tagbar config
"-----------------------------------------------------------------------------------
nnoremap <silent> <F8> :TagbarToggle<CR>

"-----------------------------------------------------------------------------------
" statusbar airline
"-----------------------------------------------------------------------------------
"let g:airline_theme='deus'
"let g:airline_theme='luna'
" let g:airline_theme='distinguished'
" let g:airline_theme='bubblegum'
let g:airline_theme='jellybeans'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
"g:airline_theme='luna'

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
"-----------------------------------------------------------------------------------
" config easymotion, modify the default leader
"-----------------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_smartcase = 1
nmap <space>l <Plug>(easymotion-overwin-line)
nmap <space>s <Plug>(easymotion-sn)

"-----------------------------------------------------------------------------------
" config easymotion, modify the default leader
"-----------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-----------------------------------------------------------------------------------
" markdwon preview config
"-----------------------------------------------------------------------------------
let g:mkdp_echo_preview_url = 1
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown', 'md', 'mkd']
let g:mkdp_theme = 'dark'

function! MdpOpenPreview(url) abort
	let l:mdp_browser = '/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
	let l:mdp_browser_opts = '--new-window'
	if !filereadable(substitute(l:mdp_browser, '\\ ', ' ', 'g'))
		let l:mdp_browser = '/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe'
		let l:mdp_browser_opts = '--new-window'
	endif
	execute join(['silent! !', l:mdp_browser, l:mdp_browser_opts, a:url])
	" update the markdown buffer draw
    redraw!
endfunction
let g:mkdp_browserfunc = 'MdpOpenPreview'

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

nmap ,ms <Plug>MarkdownPreview
nmap ,mj <Plug>MarkdownPreviewStop
nmap ,mt <Plug>MarkdownPreviewToggle
"-----------------------------------------------------------------------------------
" config md image paste for wsl
"-----------------------------------------------------------------------------------
let g:mdip_imgdir = '.img_' . expand("%:t:r")
let g:mdip_imgdir_absolute =  expand("%:p:h") . "/". g:mdip_imgdir 
" echo "absolute " . expand("%:p") . "absolute h " . expand("%:h") 

autocmd FileType markdown,md,mkd nmap <buffer><silent> ,mp :call mdip#MarkdownClipboardImage()<CR>
"-----------------------------------------------------------------------------------
" vimmark config
"-----------------------------------------------------------------------------------
nmap <silent> mm <Plug>MarkSet
vmap <unique> <silent> mm <Plug>MarkSet
nmap <unique> <silent> mr <Plug>MarkRegex
vmap <unique> <silent> mr <Plug>MarkRegex
nmap <unique> <silent> mn <Plug>MarkAllClear
nmap <unique> <silent> m* <Plug>MarkSearchAnyNext
nmap <unique> <silent> m# <Plug>MarkSearchAnyPrev

"-----------------------------------------------------------------------------------
" vim-locate config; provide search result list 
"-----------------------------------------------------------------------------------
"" location list win
"gl" search and give a window
let g:locate_max_height = g:MyWinHeight
let g:locate_focus = 1
let g:locate_colon_jump = 0

"-----------------------------------------------------------------------------------
" ultisnips and sytax template config
"-----------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"-----------------------------------------------------------------------------------
" paththeses rainbow config
"-----------------------------------------------------------------------------------
let g:rainbow_active = 1
