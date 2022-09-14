" --- {{{
" vim:ft=vim:fdm=marker
" --- }}}
"    __   __   ________  ___ __ __   ______    ______
"   /_/\ /_/\ /_______/\/__//_//_/\ /_____/\  /_____/\
"   \:\ \\ \ \\__.::._\/\::\| \| \ \\:::_ \ \ \:::__\/
" ___\:\ \\ \ \  \::\ \  \:.      \ \\:(_) ) )_\:\ \  __
"/__/\\:\_/.:\ \ _\::\ \__\:.\-/\  \ \\: __ `\ \\:\ \/_/\
"\::\ \\ ..::/ //__\::\__/\\. \  \  \ \\ \ `\ \ \\:\_\ \ \
" \:_\/ \___/_( \________\/ \__\/ \__\/ \_\/ \_\/ \_____\/
"=========================================================
" --- PLUGINS --- {{{
	call plug#begin('~/.vim/plugged')
		"Plug 'frazrepo/vim-rainbow'
		Plug 'preservim/nerdcommenter'
		Plug 'vim-latex/vim-latex'
		Plug 'dylanaraps/wal.vim'
		"Plug 'pangloss/vim-javascript'
		Plug 'vim-syntastic/syntastic'
		Plug 'ryanoasis/vim-devicons'
		"Plug 'mboughaba/i3config.vim'
	call plug#end()
" -- PLUGIN SETTINGS -- {{{
" - SYNTASTIC - {{{
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 1
	let g:syntastic_mode_map = { 'passive_filetypes': ['python','latex','tex'] }
" - }}}
" -- }}}
"--- }}}

" --- BASE SETTINGS --- {{{
" -- LEADER -- {{{
	"let mapleader ="\º"
	let mapleader = "\."
	let ttimeoutlen=500
" -- }}}
" -- FUNCTIONS -- {{{
" -- }}}
" -- REMAPPINGS -- {{{
" placeholder navigation
	inoremap þ <++><Esc>T<hi
	nnoremap þ <Ins><++><Esc>T<h
	inoremap <M-p> <++><Esc>T<hi
	nnoremap <M-p> i<++><Esc>T<hi
" -- }}}
" -- GENERAL -- {{{
" disable autocommenting
	autocmd FileType *setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" vimrc splitting
	nnoremap <leader>v :split ~/.vimrc<cr>
" tabbing
	nnoremap <leader>T :tabnew
" %s/search/replace/g(lob)
	nnoremap R :%s///g<Left><Left><Left>
" -- }}}
" --- }}}

" --- VIM APPEARANCE --- {{{
	syntax on
	set autoindent
	set smartindent
	colorscheme wal
	set number
	set sw=8
	set cursorline
	set fillchars=fold:=
" -- TRANSPARENCY - {{{
	autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
	autocmd SourcePost * hi Normal ctermbg=NONE guibg=NONE
		\|	hi SignColumn ctermbg=NONE guibg=NONE
" - }}}
" - SEARCH APPEARANCE - {{{
	set nohlsearch
	
" - }}}
" - WILDMENU - {{{
	set wildmenu
	set wildmode=longest,list,full
" - }}}
" -- }}}

" --- VIM --- {{{
	autocmd FileType vim nnoremap <C-c> 0i"<Esc>
	autocmd FileType vim inoremap <C-c> <Esc>0i"<Esc>A
" -- TODOS -- {{{
"  find TODOs
	nnoremap <leader>f /TODO<enter>
"  make TODOs
	inoremap <leader>t <esc>A%%TODO
	nnoremap <leader>t A%%TODO
"  -- }}}
" --- }}}

" --- LATEX --- {{{
" -- BASE -- {{{
	let g:tex_flavor="latex"
	let g:tex_itemize_env="equation,equation*,aligned,align,matrix,pmatrix,table,tabular"
" -- }}}
" -- COMPILERS -- {{{
" - INOREMAPS - {{{
	autocmd FileType tex inoremap <F2> <Esc>:w<Enter>:!lualatex<Space><c-r>%<Enter>
	autocmd FileType tex inoremap <F3> <Esc>:w<Enter>:!xelatex<Space><c-r>%<Enter>		
"	autocmd FileType tex inoremap <F8> <Esc>:w<Enter>:!pdflatex<Space><c-r>%<Enter>				" Moving to apparently conflicting <F8> "" COMPLETELY RULED OUT
	autocmd FileType tex inoremap <F8> <Esc>:w<Enter>:!latexmk<Space>-pdflua<Space><c-r>%<Enter>
	autocmd FileType tex inoremap <F4> <Esc>:w<Enter>:!subfiletexxer<Space>-m<Space><c-r>%<Enter>
	autocmd FileType tex inoremap <F8> <Esc>:w<Enter>:!perlxmk<space>-d<space>--subfile<enter>
	autocmd FileType tex inoremap <F6> <Esc>:w<Enter>:!perlxmk<space>-d<enter>
	autocmd FileType tex inoremap <F10> <Esc>:w<Enter>:!texall<Space>-c<Space><c-r>%<Enter>
" - }}}
" - NNOREMAPS - {{{
	autocmd FileType tex nnoremap <F2> :w<Enter>:!lualatex<Space><c-r>%<Enter><Ins>
	autocmd FileType tex nnoremap <F3> :w<Enter>:!xelatex<Space><c-r>%<Enter><Ins>
"	autocmd FileType tex nnoremap <F4> :w<Enter>:!pdflatex<Space><c-r>%<Enter><Ins>
	autocmd FileType tex nnoremap <F6> :w<Enter>:!latexmk<Space>-pdflua<Space><c-r>%<Enter><Ins>
	autocmd FileType tex nnoremap <F4> :w<Enter>:!subfiletexxer<Space>-m<Space><c-r>%<Enter><Ins>
	autocmd FileType tex nnoremap <F8> <Esc>:w<Enter>:!perlxmk<space>-d<space>--subfile<enter>
	autocmd FileType tex nnoremap <F9> <Esc>:w<Enter>:!perlxmk<space>-d<enter>
	autocmd FileType tex nnoremap <F10> :w<Enter>:!texall<Space><c-r>%<Enter><Ins>
" - }}}
" -- }}}
" -- COMMENT REMOVAL -- {{{
	autocmd FileType tex nnoremap <C-z> :s/%/<Enter>
	autocmd FileType tex inoremap <C-z> <Esc>:s/%/<Enter>
	autocmd FileType tex vnoremap <C-z> :s/%/<Enter>
" -- }}}
" -- PDF READING -- {{{
	"autocmd FileType tex nnoremap <leader>z :!zathura<space><c-r>%<Backspace><Backspace><Backspace>pdf &<cr><cr>
	"autocmd FileType tex inoremap <leader>z <Esc>:!zathura<space><c-r>%<Backspace><Backspace><Backspace>pdf &<cr><cr>
	autocmd FileType tex nnoremap <leader>z :!perlthura<space>-s<space>&<enter>
	autocmd FileType tex inoremap <leader>z <esc>:!perlthura<space>-s<pace>&<enter>i
	autocmd FileType tex nnoremap <leader>o :!perlthura<space>-f<space>&<enter>
	autocmd FileType tex inoremap <leader>o <esc>:!perlthura<space>-f<space>&<enter>i
" -- }}}
" -- COMMANDS -- {{{
	autocmd FileType tex inoremap <C-t> \texttt{}<++><esc>T{i
	autocmd FileType tex inoremap <M-i> \textit{}<++><esc>T{i
	autocmd FileType tex inoremap <leader>v \vec{}<++><esc>T{i
	autocmd FileType tex inoremap <leader>z \hat{\vec{}}<++><esc>T{i
	autocmd FileType tex inoremap <leader>n \nabla
	autocmd FileType tex inoremap <leader>x \cpr{}{<++>}{<++>}<++><esc>T{i<esc>T{i<esc>T{i
	autocmd FileType tex inoremap <leader>p \psi
	autocmd FileType tex inoremap <leader>P \Psi
	autocmd FileType tex inoremap <leader>i \int_{}^{<++>}<++>\dd^{<++>}{<++>}<esc>T{i<esc>T{i<esc>T{i<esc>T{i
	autocmd FileType tex inoremap <leader>, \cdot
	autocmd FileType tex inoremap <leader>' \times
" -- }}}
" -- PLACEHOLDER NAVIGATION -- {{{
"<++>	
" -- }}}
" -- SPELLCHECK -- {{{
	autocmd FileType tex inoremap <C-s> <Esc>:setlocal spell spelllang=en_us<Enter>A
	autocmd FileType tex nnoremap <C-s> :setlocal spell spelllang=en_us<Enter>
	autocmd FileType tex nnoremap <leader>s :setlocal spell spelllang=it<Enter>
	autocmd FileType tex inoremap <leader>s <Esc>:setlocal spell spelllang=it<Enter>A
" -- }}}
" -- ABBREVIATIONS & ALIASES -- {{{
	" only maths abbrev
	autocmd FileType tex iabbrev stdph e^{i\vec{k}\cdot\vec{r}-i\omega t}
	" end maths abbrev
	autocmd FileType tex iabbrev wlg without loss of generality
	autocmd FileType tex iabbrev fourier Fourier
	autocmd FileType tex iabbrev iff if and only if
	autocmd FileType tex iabbrev airy Airy
	autocmd FileType tex iabbrev emw electromagnetic wave
	autocmd FileType tex iabbrev emws electromagnetic waves
	autocmd FileType tex iabbrev maxwell Maxwell
	autocmd FileType tex iabbrev hemholtz Helmholtz
	autocmd FileType tex iabbrev Hemholtz Helmholtz
	autocmd FileType tex iabbrev helmholtz Helmholtz
	autocmd FileType tex iabbrev grf Green's function
	autocmd FileType tex iabbrev grfs Green's functions
"  -- }}}
" --- }}}

" --- C --- {{{
	autocmd FileType c nnoremap <F2> :w<Enter>:!gcc <C-r>%<Space>-o<Space><C-r>%<Del>exe<Enter>
	autocmd FileType c nnoremap <F3> :w<Enter>:!gcc <C-r>%<Space>-o<Space><C-r>%<Del>exe<Space>-lm<Space>-Wall<Space>--pedantic<Enter>
	autocmd FileType c inoremap <F2> <Esc>:w<Enter>:!gcc <C-r>%<Space>-o<Space><C-r>%<Del>exe<Space>-Wall<Space>--pedantic<Enter>
	autocmd FileType c inoremap <F3> <Esc>:w<Enter>:!gcc <C-r>%<Space>-o<Space><C-r>%<Del>exe<Space>-lm<Space>-Wall<Space>--pedantic<Enter>
	autocmd FileType c inoremap <C-c> <Esc>0i//<Esc>A
	autocmd FileType c nnoremap <C-c> 0i//<Esc>A
" --- }}}
