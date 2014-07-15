                set nocompatible        " must be first line
                set background=dark     " Assume a dark background
                "Vundle  autoload
                filetype off
                set runtimepath+=~/.vim/bundle/vundle
                call vundle#rc()
                Bundle 'gmarik/vundle'
                set runtimepath^=~/.vim/bundle/ctrlp.vim

                set autochdir
                
        Bundle 'Raimondi/delimitMate'
        Bundle 'sjl/gundo.vim'
        Bundle 'sjl/splice.vim'
        Bundle 'godlygeek/tabular'
        Bundle 'tomtom/tcomment_vim'
        Bundle 'vim-scripts/tlib'
        Bundle 'SirVer/ultisnips'
        Bundle 'mhinz/vim-startify'
        Bundle 'Lokaltog/vim-distinguished'
        Bundle 'bling/vim-airline'
        Bundle 'scrooloose/syntastic'

" General 
        set background=dark         " Assume a dark background
        filetype plugin indent on       " Automatically detect file types.
        syntax on                                       " syntax highlighting
        syntax enable
        set mouse=a                                     " automatically enable mouse usage
       " set autochdir                           " always switch to the current file directory.. Messes with some plugins, best left commented out
        " not every vim is compiled with this, use the following line instead
        " If you use command-t plugin, it conflicts with this, comment it out.
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        scriptencoding utf-8

        " set autowrite                  " automatically write a file when leaving a modified buffer
        set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
        set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
        set virtualedit=onemore                 " allow for cursor beyond last character
        set history=1000                                " Store a ton of history (default is 20)
        set nospell                                     " spell checking off
        set backup                                              " backups are nice 
        set noswapfile
        set undofile                                    " so is persistent undo ...
        set undolevels=1000 "maximum number of changes that can be undone
        set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" Moved to function at bottom of the file
        "set backupdir=$HOME/.vimbackup//  " but not when they clog .
        "set directory=$HOME/.vimswap//         " Same for swap files
        "set viewdir=$HOME/.vimviews//  " same for view files
        
        "" Creating directories if they don't exist
        "silent execute '!mkdir -p $HVOME/.vimbackup'
        "silent execute '!mkdir -p $HOME/.vimswap'
        "silent execute '!mkdir -p $HOME/.vimviews'
        au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
        au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
        " }
" }
 " Syntastic
 let g:syntastic_enable_signs=1
 let g:syntastic_auto_jump=1
"  let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: #%w}]'
 
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
 
 
 " Needed for airline to work
 set laststatus=2
 
 " Show && Remove trailing tespaces in commons sourcees on save
autocmd FileType c,cpp,java,php,javascript,python,yaml,json,sls autocmd    BufWritePre <buffer> :%s/\s\+$//e



" Vim UI {
        colorscheme distinguished " deser load a colorscheme
        set tabpagemax=15                               " only show 15 tabs
        set showmode                    " display the current mode
        set cursorline                                  " highlight current line
        hi cursorline guibg=#333333     " highlight bg color of current line
        hi CursorColumn guibg=#333333   " highlight cursor

        " if has('cmdline_info')
        "         set ruler                       " show the ruler
        "         set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        "         set showcmd                     " show partial commands in status line and
        "                                                                 " selected characters/lines in visual mode
        " endif

        " if has('statusline')
        " set laststatus=2

        "         " Broken down into easily includeable segments
        "         set statusline=%<%f\    " Filename
        "         set statusline+=%w%h%m%r " Options
        "         set statusline+=%{fugitive#statusline()} "  Git Hotness
        "         set statusline+=\ [%{&ff}/%Y]            " filetype
        "         set statusline+=\ [%{getcwd()}]          " current dir
        "         "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
        "         set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
        " endif
        set backspace=indent,eol,start  " backspace for dummys
        set linespace=0                                 " No extra spaces between rows
        set nu                                                  " Line numbers on
        set showmatch                                   " show matching brackets/parenthesis
        set incsearch                                   " find as you type search
        set hlsearch                                    " highlight search terms
        set winminheight=0                              " windows can be 0 line high 
        set ignorecase                                  " case insensitive search
        set smartcase                                   " case sensitive when uc present
        set wildmenu                                    " show list instead of just completing
        set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
        set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
        set scrolljump=5                                " lines to scroll when cursor leaves screen
        set scrolloff=3                                 " minimum lines to keep above and below cursor
        set foldenable                                  " auto fold code
        set gdefault                                    " the /g flag on :s substitutions by default
        set list
        set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
" }
"   Formatting {
        set wrap                      " wrap long lines
        set autoindent                  " indent at the same level of the previous line
        set shiftwidth=4                " use indents of 4 spaces
        set expandtab                           " tabs are spaces, not tabs
        set tabstop=4                                   " an indentation every four columns
        set softtabstop=4                               " let backspace delete indent
        set smarttab
        "set matchpairs+=<:>                    " match, to be used with % 
        set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
        set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
        au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

        " Remove trailing whitespaces and ^M chars - not work
        "autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
        " autocmd FileType python compiler pylint  
" }

" Key (re)Mappings {

        "The default leader is '\', but many people prefer ',' as it's in a standard
        "location
        let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
        nnoremap ; :
        


        " Easier moving in tabs and windows
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
        
    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

        " The following two lines conflict with moving to top and bottom of the
        " screen
        " If you prefer that functionality, comment them out.
        map <S-H> gT          
        map <S-L> gt
        " Stupid shift key fixes
        cmap W w                                                
        cmap WQ wq
        cmap wQ wq
        cmap Q q
        cmap Tabe tabe

        " Yank from the cursor to the end of the line, to be consistent with C and D.
        nnoremap Y y$


        """ Code folding options
        nmap <leader>f0 :set foldlevel=0<CR>
        nmap <leader>f1 :set foldlevel=1<CR>
        nmap <leader>f2 :set foldlevel=2<CR>
        nmap <leader>f3 :set foldlevel=3<CR>
        nmap <leader>f4 :set foldlevel=4<CR>
        nmap <leader>f5 :set foldlevel=5<CR>
        nmap <leader>f6 :set foldlevel=6<CR>
        nmap <leader>f7 :set foldlevel=7<CR>
        nmap <leader>f8 :set foldlevel=8<CR>
        nmap <leader>f9 :set foldlevel=9<CR>

    "clearing highlighted search
        nmap <silent> <leader>/ :nohlsearch<CR>

        " Shortcuts
        " Change Working Directory to that of the current file
        cmap cwd lcd %:p:h
        cmap cd. lcd %:p:h

        " visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv 
        " For when you forget to sudo.. Really Write the file.
        cmap w!! w !sudo tee % >/dev/null
        augroup line_return
                au!
                    au BufReadPost *
                            \ if line("'\"") > 0 && line("'\"") <= line("$") |
                            \     execute 'normal! g`"zvzz' |
                            \ endif
        augroup END
" }

" Plugins {

        " VCSCommand {
"               let b:VCSCommandMapPrefix=',v'
"               let b:VCSCommandVCSType='git'
        " } 
        
        " PIV {
                "let cfu=phpcomplete#CompletePHP
        " }
        
        " Supertab {
                let g:SuperTabDefaultCompletionType = "context"
                let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
        " }

        " Misc { 
                :map <C-F10> <Esc>:vsp<CR>:VTree<CR>
                " map Control + F10 to Vtree


                let g:NERDShutUp=1
                let b:match_ignorecase = 1
        " }
        
        " ShowMarks {
                let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                " Don't leave on by default, use :ShowMarksOn to enable
                let g:showmarks_enable = 0
                " For marks a-z
                highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
                " For marks A-Z
                highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
                " For ale other marks
                highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
                " For multiple marks on the same line.
                highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
        " }
        
        " Command-t {
         let g:CommandTSearchPath = $HOME 
          let g:CommandTAcceptSelectionMap = '<C-t>'
          let g:CommandTAcceptSelectionTabMap = '<CR>'
        " }

        "Gundo
        map <leader>u :GundoToggle<CR>
        "}
    

        " OmniComplete {
                "if has("autocmd") && exists("+omnifunc")
                        "autocmd Filetype *
                                "\if &omnifunc == "" |
                                "\setlocal omnifunc=syntaxcomplete#Complete |
                                "\endif
                "endif

                " Popup menu hightLight Group
                "highlight Pmenu        ctermbg=13      guibg=DarkBlue
        "highlight PmenuSel     ctermbg=7       guibg=DarkBlue          guifg=LightBlue
                "highlight PmenuSbar ctermbg=7  guibg=DarkGray
                "highlight PmenuThumb                   guibg=Black

                hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
                hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
                hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

                " some convenient mappings 
                " inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
                " inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
                " inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
                " inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
                " inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
                " inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " and make sure that it doesn't break supertab
        let g:SuperTabCrMapping = 0
        
                " automatically open and close the popup menu / preview window
                au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
                set completeopt=menu,preview,longest
        " }
        
        " Ctags {
    " This will look in the current directory for 'tags', and work up the tree towards root until one is found. 
                set tags=./tags;/,$HOME/vimtags
        map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " C-\ - Open the definition in a new tab
        map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split
        " }

        " EasyTags {
       " Disabling for now. It doesn't work well on large tag files 
        let g:loaded_easytags = 1  " Disable until it's working better
                let g:easytags_cmd = 'ctags'
        let g:easytags_dynamic_files = 1
                if !has('win32') && !has('win64')
            let g:easytags_resolve_links = 1
        endif
        " }

        " Delimitmate {
                au FileType * let b:delimitMate_autoclose = 1

                " If using html auto complete (complete closing tag)
        au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
        " }
        
        " AutoCloseTag {
                " Make it so AutoCloseTag works for xml and xhtml files as well
                au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        " }

        " UltiSnipMate {
        let g:UltiSnipsEditSplit='horizontal'
        " }

        " NerdTree {
                map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
                map <leader>e :NERDTreeFind<CR>
                nmap <leader>nt :NERDTreeFind<CR>

                let NERDTreeShowBookmarks=1
                let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
                let NERDTreeChDirMode=0
                let NERDTreeQuitOnOpen=1
                let NERDTreeShowHidden=1
                let NERDTreeKeepTreeInNewTab=1
               " autocmd VimEnter * NERDTree
                "autocmd VimEnter * wincmd p
        " }
    
    " Tabularize {
        " if exists(":Tabularize")
        "   nmap <Leader>f= :Tabularize /=<CR>
        "   vmap <Leader>f= :Tabularize /=<CR>
        "   nmap <Leader>f: :Tabularize /:<CR>
        "   vmap <Leader>f: :Tabularize /:<CR>
        "   nmap <Leader>f:: :Tabularize /:\zs<CR>
        "   vmap <Leader>f:: :Tabularize /:\zs<CR>
        "   nmap <Leader>f, :Tabularize /,<CR>
        "   vmap <Leader>f, :Tabularize /,<CR>
        "   nmap <Leader>f<Bar> :Tabularize /<Bar><CR>
        "   vmap <Leader>f<Bar> :Tabularize /<Bar><CR>
        " endif
     " }
  
        " Richard's plugins {
                " Fuzzy Finder {
                        """ Fuzzy Find file, tree, buffer, line
                        " nmap <leader>ff :FufFile **/<CR>
                        " nmap <leader>ft :FufFile<CR>
                        " nmap <leader>fb :FufBuffer<CR>
                        " nmap <leader>fl :FufLine<CR>
                        " nmap <leader>fr :FufRenewCache<CR>
                " }
                        map <C-b> :CtrlPBuffer<CR>
                        let g:ctrlp_custom_ignore = 'node_modules\|report\|vendor\|cache\|git'

                " Session List {
                        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
                        nmap <leader>sv :ViewSession<CR>
                        nmap <leader>ss :SessionSave<CR>
                        let g:session_autosave = 'no'         
                
                
                " VCS commands {
                        nmap <leader>vs :VCSStatus<CR>
                        nmap <leader>vc :VCSCommit<CR>
                        nmap <leader>vb :VCSBlame<CR>
                        nmap <leader>va :VCSAdd<CR>
                        nmap <leader>vd :VCSVimDiff<CR>
                        nmap <leader>vl :VCSLog<CR>
                        nmap <leader>vu :VCSUpdate<CR>
                " }
                " php-doc commands {
                        nmap <leader>pd :call PhpDocSingle()<CR>
                        vmap <leader>pd :call PhpDocRange()<CR>
                " }
                
                " Debugging with VimDebugger {
                        map <F11> :DbgStepInto<CR>
                        map <F10> :DbgStepOver<CR>
                        map <S-F11> :DbgStepOut<CR>
                        map <F5> :DbgRun<CR>
                        map <F6> :DbgDetach<CR>
                        map <F8> :DbgToggleBreakpoint<CR>
                        map <S-F8> :DbgFlushBreakpoints<CR>
                        map <F9> :DbgRefreshWatch<CR>
                        map <S-F9> :DbgAddWatch<CR>
                " }

                " Taglist Variables {
                        let Tlist_Auto_Highlight_Tag = 1
                        let Tlist_Auto_Update = 1
                        let Tlist_Exit_OnlyWindow = 1
                        let Tlist_File_Fold_Auto_Close = 1
                        let Tlist_Highlight_Tag_On_BufEnter = 1
                        let Tlist_Use_Right_Window = 1
                        let Tlist_Use_SingleClick = 1

                        let g:ctags_statusline=1
                        " Override how taglist does javascript
                        let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global'
                 " }

                " JSON {
                        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
                 " }
        " }
" }

" GUI Setting {
        " GVIM- (here instead of .gvimrc)
        if has('gui_running')
                set guioptions-=T               " remove the toolbar
                set lines=40                    " 40 lines of text instead of 24,
        else
                set term=builtin_ansi       " Make arrow and other keys work
        endif
" }

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME 
  let prefix = '.vim'
  let dir_list = { 
                          \ 'backup': 'backupdir', 
                          \ 'views': 'viewdir', 
                          \ 'swap': 'directory', 
                          \ 'undo': 'undodir' }

  for [dirname, settingname] in items(dir_list)
          let directory = parent . '/' . prefix . dirname . "/"
          if exists("*mkdir")
                  if !isdirectory(directory)
                  call mkdir(directory)
                  endif
          endif
          if !isdirectory(directory)
                  echo "Warning: Unable to create backup directory: " . directory
                  echo "Try: mkdir -p " . directory
          else  
          let directory = substitute(directory, " ", "\\\\ ", "")
          exec "set " . settingname . "=" . directory
          endif
  endfor
endfunction
call InitializeDirectories() 

function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
set term=screen-256color
