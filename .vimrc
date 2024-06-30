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

"-----------------------------------------------------------------------------------
" filetype and after filetype vim-plugin(commentary)
"-----------------------------------------------------------------------------------
filetype plugin indent on

"commentary,based different file type insert right comment
nmap <BS> gcc
vmap <BS> gc
"can put this int ftplugin into *.vim
"autocmd FileType apache setlocal commentstring=#\ %s

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
" Toggle the NERD Tree on an off with F7
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
" tagbar airline
"-----------------------------------------------------------------------------------
"let g:airline_theme='deus'
"let g:airline_theme='luna'
" let g:airline_theme='distinguished'
" let g:airline_theme='bubblegum'
let g:airline_theme='jellybeans'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
"g:airline_theme='luna'
"-----------------------------------------------------------------------------------
" markdwon preview config
"-----------------------------------------------------------------------------------
" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 1

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
" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
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

" preview page title
 " ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" only img-paste absolute path is enough
" use a custom location for images
" let g:mkdp_images_path = '.md_images_' . expand("%:t:r")
" let g:mkdp_images_path = '/home/rongshubian/testMD/' . '.img_' . expand("%:t:r")

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown', 'md', 'mkd']

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'

" example
nmap ,ms <Plug>MarkdownPreview
nmap ,mj <Plug>MarkdownPreviewStop
nmap ,mt <Plug>MarkdownPreviewToggle
"-----------------------------------------------------------------------------------
" config md image paste for wsl
"-----------------------------------------------------------------------------------
" let g:mdip_imgdir_absolute =  expand("%:p:h")
let g:mdip_imgdir = '.img_' . expand("%:t:r")
let g:mdip_imgdir_absolute =  expand("%:p:h") . "/". g:mdip_imgdir 
" echo "absolute " . expand("%:p") . "absolute h " . expand("%:h") 

" let g:mdip_imgname = 'image'
autocmd FileType markdown,md,mkd nmap <buffer><silent> ,mp :call mdip#MarkdownClipboardImage()<CR>
