" --- {{{
" vim:ft=vim:fdm=marker
" }}}
"    __   __   ________  ___ __ __   ______    ______
"   /_/\ /_/\ /_______/\/__//_//_/\ /_____/\  /_____/\
"   \:\ \\ \ \\__.::._\/\::\| \| \ \\:::_ \ \ \:::__\/
" ___\:\ \\ \ \  \::\ \  \:.      \ \\:(_) ) )_\:\ \  __
"/__/\\:\_/.:\ \ _\::\ \__\:.\-/\  \ \\: __ `\ \\:\ \/_/\
"\::\ \\ ..::/ //__\::\__/\\. \  \  \ \\ \ `\ \ \\:\_\ \ \
" \:_\/ \___/_( \________\/ \__\/ \__\/ \_\/ \_\/ \_____\/
"=========================================================
"FOR FOLDING : <Esc> zf#j
" =============================================={{{
" Leader reset to Backslash/Pipe --- {{{
	let mapleader="\º"
	let ttimeoutlen=500
" }}}
" Pathogen infection & Plugins ----- {{{
"	execute pathogen#infect()
	call plug#begin('~/.vim/plugged')
"		Plug 'lervag/vimtex'
		Plug 'frazrepo/vim-rainbow'
		Plug 'preservim/nerdcommenter'
"		Plug 'itchyny/vim-cursorword'
		Plug 'vim-latex/vim-latex'
"		Plug 'nathanaelkane/vim-indent-guides'
		Plug 'dylanaraps/wal.vim'
		Plug 'pangloss/vim-javascript'
		Plug 'ryanoasis/vim-devicons'
	call plug#end()
" }}}
" Base options --------------------- {{{
	syntax on
	set nocompatible
	filetype plugin indent on
" Color cycling commands ------------- {{{
" INSERT
	inoremap <leader>1 <Esc>:colorscheme synthwave<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>i
	inoremap <leader>2 <Esc>:colorscheme neonwave<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>i
	inoremap <leader>3 <Esc>:colorscheme redblack<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>i
	inoremap <leader>4 <Esc>:colorscheme python<Enter>i
	inoremap <leader>5 <Esc>:colorscheme golden<Enter>i
	inoremap <leader>6 <Esc>:colorscheme gentooish<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>i
	inoremap <leader>7 <Esc>:colorscheme kaltex<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>i
	inoremap <leader>8 <Esc>:colorscheme muon<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>i
" NORMAL
	nnoremap <leader>1 :colorscheme synthwave<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>
	nnoremap <leader>2 :colorscheme neonwave<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>
	nnoremap <leader>3 :colorscheme redblack<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>
	nnoremap <leader>4 :colorscheme python<Enter>
	nnoremap <leader>5 :colorscheme golden<Enter>
	nnoremap <leader>6 :colorscheme gentooish<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>
	nnoremap <leader>7 :colorscheme kaltex<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>
	nnoremap <leader>8 :colorscheme muon<Enter>:hi Normal guibg=NONE ctermbg=NONE<Enter>
" }}}
"	colorscheme synthwave
	"colorscheme neonwave
	colorscheme wal
"	set encoding=utf-8
	set number
"	set wildmenu
"	set wildmode=longest,list,full
	set iskeyword+=:
	set sw=8
	set cursorline
	set showmatch
	set autoindent
	set smartindent
	set nohlsearch
	set fillchars=fold:-
"	set listchars=tab:\|\ 
"	set list
	autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
	autocmd SourcePost * hi Normal ctermbg=NONE guibg=NONE
		\|	hi SignColumn ctermbg=NONE guibg=NONE
" }}}
" Vim remappings ------------------- {{{
	autocmd FileType vim inoremap <C-c> <Esc>0i"
	autocmd FileType vim nnoremap <C-c> 0i"<Esc>
" Generic commands ----------------------- {{{
" Delete trailing whitespaces on save
"	autocmd BufWritePre * %s/\s\+$//e
" Disable autocommenting
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" New Tab
"	nnoremap <S-t> :tabnew<cr>
" Search & replace through the whole doc [%s/search/replace/g(lobal)] [[x,y s]] for limited search
	nnoremap R :%s///g<Left><Left><Left>
" Quick vimrc search
	nnoremap <leader>v :vsplit ~/.vimrc<cr>
" Copypasta
	nnoremap <leader>y "+y
	nnoremap <leader>P "+p
	vnoremap <leader>y "+y
	vnoremap <leader>P "+p
	inoremap <leader>P "+p
" }}}
" }}}
" LaTeX ---------------------------- {{{
" Empty .tex fix
	let g:tex_flavor="latex"
" LaTeX autosave
"	let tex_preview_always_autosave=1
" LaTeX compiler remappings, F2 for LuaLaTeX, F3 for XeLaTeX and F4 for pdfLaTeX
augroup latexphysgen
	autocmd!
	autocmd FileType tex inoremap <F2> <Esc>:w<Enter>:!lualatex<Space><c-r>%<Enter>
	autocmd FileType tex nnoremap <F2> :w<Enter>:!lualatex<Space><c-r>%<Enter>
	autocmd FileType tex inoremap <F3> <Esc>:w<Enter>:!xelatex<Space><c-r>%<Enter>
	autocmd FileType tex nnoremap <F3> :w<Enter>:!xelatex<Space><c-r>%<Enter>
	autocmd FileType tex inoremap <F4> <Esc>:w<Enter>:!pdflatex<Space><c-r>%<Enter>
	autocmd FileType tex nnoremap <F4> :w<Enter>:!pdflatex<Space><c-r>%<Enter>
	autocmd FileType tex inoremap <F6> <Esc>:w<Enter>:!latexmk<Space>-pdflua<Space><c-r>%<Enter>
	autocmd FileType tex nnoremap <F6> :w<Enter>:!latexmk<Space>-pdflua<Space><c-r>%<Space><Enter>
	autocmd FileType tex inoremap <F8> <Esc>:w<Enter>:!subfiletexxer<Space>-latexmk<Enter>
	autocmd FileType tex nnoremap <F8> :w<Enter>:!subfiletexxer<Space>-latexmk<Enter>
	autocmd FileType tex inoremap <F10> <Esc>:w<Enter>:!texall<Enter>
	autocmd FileType tex nnoremap <F10> :w<Enter>:!texall<Enter>
" Open the compiled .pdf
	autocmd FileType tex nnoremap <leader>z :!zathura <c-r>%<Backspace><Backspace><Backspace>pdf & <CR><CR>
	autocmd FileType tex nnoremap <leader>m :!mupdf <c-r>%<Backspace><Backspace><Backspace>pdf & <CR><CR>
" LaTeX command shortcuts
	autocmd FileType tex inoremap <C-y> \textit{}<Esc>T{i
	autocmd FileType tex inoremap <leader>b \textbf{}<Esc>T{i
	autocmd FileType tex inoremap <C-u> \underline{}<++><Esc>T{i
    	autocmd FileType tex inoremap <C-e> \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap <C-h> \hbar
	autocmd FileType tex inoremap <leader>H \mathcal{H}
	autocmd FileType tex inoremap <C-k> \ket{}<++><Esc>T{i
	autocmd FileType tex inoremap <C-b> \bra{}<++><Esc>T{i
	autocmd FileType tex inoremap <C-l> \braket{}<++><Esc>T{i
	autocmd FileType tex inoremap <M-l> \bra{}<++>\ket{<++>}<++><Esc>T{hhhhhhhhhhi
	autocmd FileType tex inoremap <M-k> \ket{}\bra{<++>}<++><Esc>T{hhhhhhi
	autocmd FileType tex inoremap <M-o> \opr{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>O
	autocmd FileType tex inoremap <leader>o \opr{\mathcal{}}<++><Esc>T}hhi
	autocmd FileType tex inoremap <leader>r \mathrm{}<++><Esc>T{
	autocmd FileType tex inoremap <M-a> \adj{}<++><Esc>T{i
	autocmd FileType tex inoremap <C-a> \adj{\opr{}}<++><Esc>hhhhhi
	autocmd FileType tex inoremap <C-s> <Esc>:setlocal spell spelllang=en_us<Enter>A
	autocmd FileType tex nnoremap <C-s> :setlocal spell spelllang=en_us<Enter>A
	autocmd FileType tex inoremap <leader>s <Esc>:setlocal spell spelllang=it<Enter>A
	autocmd FileType tex nnoremap <M-s> :setlocal spell spelllang=it<Enter>A
	autocmd FileType tex inoremap <M-d> <Esc>:set nospell<Enter>A
        autocmd FileType tex nnoremap <M-d> :set nospell<Enter>A
	autocmd FileType tex inoremap <leader>t \texttt{}<++><Esc>T{i
"	autocmd FileType tex inoremap <leader>t \term[]{<++>}{<++>}<++><Esc>T[i
	autocmd FileType tex inoremap <leader>i \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>E \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>e \varepsilon
	autocmd FileType tex inoremap <leader>f \varphi
	autocmd FileType tex inoremap <leader>p \psi
	autocmd FileType tex inoremap <leader>a \uparrow
	autocmd FileType tex inoremap <leader>s \downarrow
	autocmd FileType tex inoremap <leader>w \omega
	autocmd FileType tex inoremap <leader>W \Omega
	autocmd FileType tex inoremap <leader>r \dopr
	autocmd FileType tex inoremap <C-v> \vec{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>x \cpr{}{<++>}{<++>}<++><Esc>T{hhhhhhhhi
" Placeholder  navigation
	autocmd FileType tex nnoremap <M-p> <Ins><++><Esc>T<hi
	autocmd FileType tex inoremap <M-p> <++><Esc>T<hi
	autocmd FileType tex inoremap <leader>h \opr{\ham}
" check the previous line dork
augroup END
" Environment indentation
	let g:tex_itemize_env="equation,equation*,aligned,align,align*,array"
" Quick comment
augroup latexcomment
	autocmd!
	autocmd FileType tex nnoremap <C-c> :s/^/%<Enter>
	autocmd FileType tex nnoremap <C-z> :s/^%/<Enter>
	autocmd FileType tex inoremap <C-c> <Esc>:s/^/%<Enter><Ins>
	autocmd FileType tex inoremap <C-z> <Esc>:s/^%/<Enter><Ins>
	autocmd FileType tex vnoremap <C-c> :s/^/%<Enter>
	autocmd FileType tex vnoremap <C-z> :s/^%/<Enter>
	autocmd FileType tex vnoremap <C-C> :s/^%/<Enter>
augroup END
" Lazy shit
augroup latexrename
	autocmd!
	autocmd FileType tex iabbrev schrodinger Schrödinger
	autocmd FileType tex iabbrev Schrodinger Schrödinger
	autocmd FileType tex iabbrev Heisemberg Heisenberg
	autocmd FileType tex iabbrev heisenberg Heisenberg
	autocmd FileType tex iabbrev heisemberg Heisenberg
	autocmd FileType tex iabbrev hamiltonian Hamiltonian
	autocmd FileType tex iabbrev hamilton Hamilton
	autocmd FileType tex iabbrev hermitian Hermitian
	autocmd FileType tex iabbrev fourier Fourier
	autocmd FileType tex iabbrev newton Newton
	autocmd FileType tex iabbrev newtonian Newtonian
	autocmd FileType tex iabbrev lagrange Lagrange
	autocmd FileType tex iabbrev lagrangian Lagrangian
	autocmd FileType tex iabbrev euler Euler
augroup END
" }}}
" R Markdown ----------------------- {{{
	autocmd FileType rmd map <F2> :!echo<Space>"require(rmarkdown);<Space>render('<C-r>%')<Space>\|<Space>R<Space>--vanilla<Enter>
"}}}
" Markdown ------------------------- {{{
	autocmd FileType md map <F2> :!pandoc <C-r>%<Space>--pdf-engine=lualatex<Space>-o<Space><C-r>%<Del><Del><Del>.pdf<Enter><Enter>
	autocmd FileType markdown map <F2> :!pandoc <C-r>%<Space>--pdf-engine=lualatex<Space>-o<Space><C-r>%<Del><Del><Del>.pdf<Enter><Enter>
	autocmd FileType md nnoremap <leader>z :!zathura <c-r>%<Backspace><Backspace><Backspace>.pdf & <CR><CR>
	autocmd FileType markdown nnoremap <leader>z :!zathura <c-r>%<Backspace><Backspace><Backspace>.pdf & <CR><CR>
" }}}
" C -------------------------------- {{{
	autocmd FileType c map <F2> :!gcc <C-r>%<Space>-o<Space><C-r>%<Del><Del><Enter><Enter>
	autocmd FileType c map <F3> :!gcc <C-r>%<Space>-o<Space><C-r>%<Del><Del><Space>-lm<Enter><Enter>
" Placeholder navigation for C
	autocmd FileType c nnoremap <C-p> <Ins><++><Esc>T<hi
	autocmd FileType c inoremap <C-p> <++><Esc>T<hi
	autocmd FileType c inoremap <C-c> <Esc>0<Ins>//
	autocmd FileType c nnoremap <C-c> 0<Ins>//<Esc>
" }}}
" BASH ----------------------------- {{{
	autocmd FileType sh nnoremap <C-c> 0<Ins>#<Esc>
	autocmd FileType sh inoremap <C-c> <Esc>0<Ins>#
	autocmd FileType bash nnoremap <C-c> 0<Ins>#<Esc>
	autocmd FileType bash inoremap <C-c> <Esc>0<Ins>#
	autocmd FileType bash nnoremap <C-p> <Ins><++><Esc>T<hi
	autocmd FileType bash nnoremap <C-p> <Ins><++><Esc>T<hi
	autocmd FileType sh inoremap <C-p> <++><Esc>T<hi
	autocmd FileType sh inoremap <C-p> <++><Esc>T<hi
" }}}
" DOSINI --------------------------- {{{
	autocmd FileType dosini nnoremap <C-c> 0<Ins>;<Esc>
	autocmd FileType dosini inoremap <C-c> <Esc>0<Ins>;
" }}}
" ==============================================}}}
