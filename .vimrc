set expandtab
set ts=4 sw=4 
set nu rnu
set wildmenu
set path=**
set autoindent
set wildmode=list:longest
set nowrap
set hlsearch
set timeoutlen=100
set fillchars=eob:\ 

nnoremap <Space>h :nohl<CR>
vnoremap <Space>h :nohl<CR>

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

colorscheme sorbet

nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

nnoremap <C-f> :<C-f>cc
vnoremap <C-f> :<C-f>cc

nnoremap <Space>t :term ++curwin<CR>
vnoremap <Space>t :term ++curwin<CR>

nnoremap n nzz
vnoremap N Nzz

tnoremap <C-t> <C-w>N

