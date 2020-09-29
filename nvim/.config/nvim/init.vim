" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

call plug#end()

let g:tex_flavor = "LaTeX"

" Netrw configuration
let g:netrw_banner = 0

" Set leader keys
let maplocalleader=','
let mapleader=' '

" Color
colorscheme gruvbox

" Enable buffers to be hidden in the background
set hidden

" Always two lines above and below the cursor
set so=2

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Use tab for completion navigation
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Always show to signcolumn
" Neovim will allow number and sign columns to be merged in the future with
" signcolumn=yes
set signcolumn=yes

" Disable auto comment continuation
set formatoptions-=cro

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set number

" Escape disables highlights
nnoremap <silent><esc> :noh<cr>

" Use <cr> to confirm completion
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<CR>"

" GoTo code navigation
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Navigate diagnostics
nnoremap <silent> gp <Plug>(coc-diagnostic-prev)
nnoremap <silent> gn <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming
nnoremap <space>r <Plug>(coc-rename)

" Use the help command for vim and help files otherwise show documentation in
" preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add Neovim's native statusline support
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Faster split navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Map function and class text objects
xnoremap if <Plug>(coc-funcobj-i)
onoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap af <Plug>(coc-funcobj-a)
xnoremap ic <Plug>(coc-classobj-i)
onoremap ic <Plug>(coc-classobj-i)
xnoremap ac <Plug>(coc-classobj-a)
onoremap ac <Plug>(coc-classobj-a)

" Apply code action to selected region
xnoremap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Highlight symbol and references on cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)

" Set tab width
set shiftwidth=4
set tabstop=4

" Edit vimrc easily
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

cnoremap wq USE ZZ TO SAVE AND QUIT
cnoremap q USE ZQ TO QUIT
cnoremap q! USE ZQ TO QUIT

nnoremap ZX ZQ

autocmd FileType sh nnoremap <localleader>c :!shellcheck %<cr>
autocmd FileType sh nnoremap <localleader>l :!./%<cr>
autocmd FileType cpp nnoremap <localleader>l :!g++ % && ./a.out<cr>
autocmd FileType python nnoremap <localleader>l :!python %<cr>

autocmd FileType tex inoremap { {}<left>
autocmd FileType tex inoremap [ []<left>
autocmd FileType tex inoremap ( ()<left>
autocmd FileType tex inoremap $ $$<left>

nnoremap <leader>wc :!wc -w < %<cr>

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

nnoremap j gj
nnoremap k gk
