" File: vimrc_base
" Author: missingtears
" Description: fengpingping's personal vim configure file.
" Since: 2017-07-11
" Modify: 2018-12-25

" 设置leader替换
let mapleader = ","
let g:mapleader = ","

" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
" windows
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

set guifontwide=幼圆:h10.5
set guifont=DejaVu_Sans_Mono_for_Powerline:h10.5
colorscheme gruvbox

" 快迅保存
nmap <leader>w :w!<cr>

" 制表符
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

set history=1000

" 缩进
set autoindent
set smartindent

set number
set ruler

" 开启高亮显示结果
set hlsearch

" 打开语法高亮
syntax enable

" 高亮突出当前行
set cursorline

" 关闭兼容模式
set nocompatible

" 备份和缓存
set nowritebackup
set nobackup
set noswapfile

" 隐藏菜单栏
set guioptions-=m
" 隐藏工具栏
set guioptions-=T
" 隐藏左侧滚动条
set guioptions-=L
" 隐藏右侧滚动条
set guioptions-=r
" 隐藏底部滚动条
set guioptions-=b

" 当文件在外部被修改时自动更新该文件
set autoread

" 状态栏显示目前所执行的指令
set showcmd

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" 打开 vimrc配置文件
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 重新载入 vimrc配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>